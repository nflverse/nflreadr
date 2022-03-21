#' Load Combine Data from PFR
#'
#' @description Loads combine data since 2000 courtesy of PFR.
#'
#' @param seasons a numeric vector of seasons to return, default `TRUE` returns all available data
#'
#' @examples
#' \donttest{
#'   load_combine()
#' }
#'
#' @return A tibble of NFL combine data provided by Pro Football Reference.
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-data>
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_combine.html> for a web version of the dictionary
#' @seealso [`dictionary_combine`] for the data dictionary as bundled within the package
#'
#' @export
load_combine <- function(seasons = TRUE){
  url <- "https://github.com/nflverse/nflverse-data/releases/download/combine/combine.rds"
  out <- rds_from_url(url)
  if(!isTRUE(seasons)) stopifnot(is.numeric(seasons))
  if(!isTRUE(seasons)) out <- out[out$season %in% seasons]
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  out
}
