#### UTILS ###

#' Get Latest Season
#'
#' A helper function to choose the most recent season available for a given dataset
#'
#' @param roster a TRUE/FALSE flag: if TRUE, returns the current year if March 1st or later. if FALSE, returns the current year if September 1st or later. Otherwise returns current year minus 1.
#'
#' @return season (a four digit numeric)
#' @export
most_recent_season <- function(roster = FALSE) {
  today <- Sys.Date()
  current_year <- as.integer(format(today, format = "%Y"))
  current_month <- as.integer(format(today, format = "%m"))

  if ((isFALSE(roster) && current_month >= 9) ||
      (isTRUE(roster) && current_month >= 3)) {
    return(current_year)
  }

  return(current_year - 1)
}

## internal utils ##

.datatable.aware <- TRUE

is_installed <- function(pkg) requireNamespace(pkg, quietly = TRUE)

choose_loader <- function(type) {
  switch(type,
    "rds" = rds_from_url,
    "qs" = qs_from_url
  )
}

#' @keywords internal
"_PACKAGE"

#' @importFrom Rcpp getRcppVersion
#' @importFrom RcppParallel defaultNumThreads
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
