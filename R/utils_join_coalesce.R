#' Coalescing join
#'
#' EXPERIMENTAL! This function joins two dataframes together by key, and then coalesces any
#' columns that have shared names (i.e. fills in NAs). A utility function primarily
#' used internally within nflverse to help build player IDs
#'
#' @param x,y dataframes. Will be coerced to data.table
#' @param by keys to join on, as a plain or named character vector
#' @param type one of "left" (all rows of x and matching rows of y),
#' "inner" (matching rows of x and y), "full" (all rows of x and y)
#' @param by.x,by.y alternate form of keys to join on - if provided, will override `by`.
#' @param incomparables keys to NOT match on, i.e. NA should not match on NA.
#' @param sort whether to sort output by the join keys
#' @param ... other args passed to `merge.data.frame()`
#'
#' @return a data.table joining x and y dataframes together, with every column from
#' both x and y and patching NA values in x with those in y.
#'
#'
#' @examples
#'
#' x <- data.frame(id1 = c(NA_character_,letters[1:4]), a = c(1,NA,3,NA,5), b = 1:5 * 10)
#' y <- data.frame(id2 = c(letters[3:11],NA_character_), a = -(1:10), c = 1:10 * 100)
#'
#' join_coalesce(x,y, by = c("id1"="id2"))
#' join_coalesce(x,y, by.x = "id1", by.y = "id2")
#' join_coalesce(x,y, by = c("id1"="id2"), type = "inner")
#' join_coalesce(x,y, by = c("id1"="id2"), type = "full")
#'
#' @export
join_coalesce <- function(x, y, by = NULL,
                          type = c("left", "inner", "full"),
                          ...,
                          by.x = NULL,by.y = NULL,
                          sort = TRUE,
                          incomparables = c(NA,NaN)) {

  type <- rlang::arg_match0(type, c("left", "inner", "full"))

  stopifnot(
    is.data.frame(x),
    is.data.frame(y),
    length(by.x) == length(by.y),
    (is.character(by) && length(by) >= 1) ||
      (is.character(by.x) && is.character(by.y) && length(by.x) >= 1)
  )

  keys_x <- if (!is.null(by.x)) by.x else if(is.null(names(by))) by else ifelse(names(by) == "", by, names(by))
  keys_y <- if (!is.null(by.y)) by.y else by

  check_keys <- c(
    "Join `by` keys in x are not unique" = nrow(x) != nrow(unique(x[keys_x])),
    "Join `by` keys in y are not unique" = nrow(y) != nrow(unique(y[keys_y])),
    "Join `by` keys in x have NAs" = any(is.na(x[keys_x])),
    "Join `by` keys in y have NAs"= any(is.na(y[keys_y]))
  )

  if(any(check_keys)) {
    cli::cli_warn(
      names(check_keys)[which(check_keys)]
    )
  }

  joined_cols <- c(setdiff(names(x), keys_x), setdiff(names(y), keys_y))
  dupl_cols <- joined_cols[duplicated(joined_cols)]

  # data.table's merge doesn't have an "incomparables" argument in the current prod version
  # this causes NA to match to NA
  merged_df <- merge.data.frame(
    x = x,
    y = y,
    by.x = keys_x,
    by.y = keys_y,
    all.x = type %in% c("left", "full"),
    all.y = type == "full",
    sort = sort,
    incomparables = incomparables,
    ...,
    suffixes = c("..x", "..y")
  )

  data.table::setDT(merged_df)

  for (col in dupl_cols) {
    data.table::set(
      merged_df,
      j = col,
      value = merged_df[[paste0(col, "..x")]] %c% merged_df[[paste0(col, "..y")]])
    data.table::set(merged_df, j = paste0(col, "..x"), value = NULL)
    data.table::set(merged_df, j = paste0(col, "..y"), value = NULL)
  }

  return(merged_df[,c(keys_x,unique(joined_cols)), with = FALSE])
}
