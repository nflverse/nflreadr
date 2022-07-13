#### Internal UTILS ###

.datatable.aware <- TRUE

is_installed <- function(pkg) requireNamespace(pkg, quietly = TRUE)

#' @keywords internal
"_PACKAGE"

# @importFrom Rcpp getRcppVersion
# @importFrom RcppParallel defaultNumThreads
NULL

`%c%` <- function(x,y){
  ifelse(!is.na(x),x,y)
}

#' @export
#' @noRd
print.nflverse_data <- function(x,...){

  cli::cli_rule("{.emph nflverse {attr(x,'nflverse_type')}}")

  if(!is.null(attr(x,'nflverse_timestamp'))) {
    cli::cli_alert_info(
      "Data updated: {.field {format(attr(x,'nflverse_timestamp'), tz = Sys.timezone(), usetz = TRUE)}}"
      )
  }

  NextMethod(print,x)
  invisible(x)
}

#' rbindlist but maintain attributes of last file
#'
#' @export
#' @keywords internal
rbindlist_with_attrs <- function(dflist){

  nflverse_timestamp <- attr(dflist[[length(dflist)]], "nflverse_timestamp")
  nflverse_type <- attr(dflist[[length(dflist)]], "nflverse_type")
  out <- data.table::rbindlist(dflist, use.names = TRUE, fill = TRUE)
  attr(out,"nflverse_timestamp") <- nflverse_timestamp
  attr(out,"nflverse_type") <- nflverse_type
  out
}

#' nflverse data class
#'
#' This class has a special S3 print method that tries to read attached metadata and
#' provide timestamps and source attributes. It otherwise will dispatch to the
#' `data.frame` class.
#'
#' @name nflverse_data-class
#' @exportClass nflverse_data
methods::setOldClass(c("nflverse_data", "data.frame"))

#' @importFrom curl curl_fetch_memory
NULL
