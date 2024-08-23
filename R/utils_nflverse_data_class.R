#' nflverse data class
#'
#' This class has a special S3 print method that tries to read attached metadata and
#' provide timestamps and source attributes. It otherwise will dispatch to the
#' `data.frame` class.
#'
#' @name nflverse_data-class
#' @keywords internal
#' @exportClass nflverse_data
methods::setOldClass(c("nflverse_data", "data.frame"))

#' @export
#' @noRd
print.nflverse_data <- function(x,...){

  cli::cli_rule("{.emph nflverse {attr(x,'nflverse_type')}}")

  if(!is.null(attr(x,'nflverse_timestamp'))) {
    # Print a formatted string in local timezone
    timestamp <- format(
      # the attribute is character so we have to convert it to POSIX to be able
      # to convert the timezone to the local one
      as.POSIXct(attr(x,'nflverse_timestamp'), tz = nflreadr::nflverse_data_timezone),
      tz = Sys.timezone(),
      usetz = TRUE
    )
    cli::cli_alert_info("Data updated: {.field {timestamp}}")
  }

  NextMethod(print,x)
  invisible(x)
}

#' @export
#' @aliases make_nflverse_data
#' @rdname nflverse_data-class
as.nflverse_data <- function(df, nflverse_type = NULL, ...){

  df <- data.table::as.data.table(df)
  data.table::setattr(df, "class",  c("nflverse_data", "tbl_df", "tbl", "data.table","data.frame"))

  dots <- rlang::dots_list(..., .named = TRUE)

  for(i in seq_along(dots)){
    data.table::setattr(df, names(dots)[[i]], dots[[i]])
  }

  if(!is.null(nflverse_type)) data.table::setattr(df, "nflverse_type", nflverse_type)

  if(
    (length(dots) > 0 | !is.null(nflverse_type)) &&
    is.null(attr(df, "nflverse_timestamp"))
  ){
    data.table::setattr(df, "nflverse_timestamp", format(Sys.time(), tz = nflreadr::nflverse_data_timezone, usetz = TRUE))
  }

  return(df)
}

make_nflverse_data <- as.nflverse_data
