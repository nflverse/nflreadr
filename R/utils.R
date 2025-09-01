#### Internal UTILS ###

.datatable.aware <- TRUE

is_installed <- function(pkg) requireNamespace(pkg, quietly = TRUE)

#' @keywords internal
"_PACKAGE"

#' @importFrom data.table `:=`
NULL

`%c%` <- function(x, y) {
  data.table::fifelse(!is.na(x), x, y)
}

#' rbindlist but maintain attributes of last file
#'
#' @export
#' @keywords internal
rbindlist_with_attrs <- function(dflist) {
  nflverse_timestamp <- attr(dflist[[length(dflist)]], "nflverse_timestamp")
  nflverse_type <- attr(dflist[[length(dflist)]], "nflverse_type")
  out <- data.table::rbindlist(dflist, use.names = TRUE, fill = TRUE)
  data.table::setattr(out, "nflverse_timestamp", nflverse_timestamp)
  data.table::setattr(out, "nflverse_type", nflverse_type)
  out
}

.ignore_unused_imports <- function() {
  curl::curl_fetch_memory
  methods::setOldClass
}

# additional release issue bullets for usethis::use_release_issue()
release_bullets <- function() {
  c(
    '`devtools::check_mac_release()`',
    '`c <- rhub::check_for_cran(show_status = FALSE)`',
    '`pkgdown::check_pkgdown()`',
    '`usethis::use_tidy_thanks()`',
    NULL
  )
}

assert <- function(..., .envir = rlang::caller_env()) {
  # Capture expressions as character strings
  exprs <- rlang::enexprs(...) |> as.character()

  # Evaluate the expressions, keeping all user-supplied ("outer") names
  x <- vctrs::vec_c(..., .name_spec = "{outer}")

  if (all(x)) {
    return(invisible(TRUE))
  }

  # Use name of x vector as the name of the error
  # Otherwise use the expression itself as the error message
  if (is.null(names(x)[!x])) names(x)[!x] <- exprs[!x]
  errs <- ifelse(
    test = names(x)[!x] == "",
    yes = exprs[!x],
    no = names(x)[!x]
  ) |>
    # Evaluate any remaining glue strings in error message in case it's user-provided
    sapply(\(e) glue::glue(e, .envir = .envir))

  cli::cli_abort(
    c(
      "The following assertions failed:",
      setNames(errs, rep("x", length(errs)))
    ),
    call = rlang::caller_env()
  )
}
