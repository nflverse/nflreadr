#' Load Officials
#'
#' @description Loads data on which officials are assigned to oversee a specific game. Data available from 2015 onwards.
#'
#' @param seasons a numeric vector specifying what seasons to return, if `TRUE` returns all available data
#'
#' @examples
#' \donttest{
#' try({ # prevents cran errors
#'   load_officials()
#' })
#' }
#'
#' @return A tibble with one row per game per official.
#'
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflreadr> and it will be triaged appropriately.
#'
#' @export
load_officials <- function(seasons = TRUE){

  out <- rds_from_url("https://github.com/nflverse/nflverse-data/releases/download/officials/officials.rds")

  if(!isTRUE(seasons)) {
    stopifnot(
      is.numeric(seasons),
      all(seasons >= 2015),
      all(seasons <= nflreadr::most_recent_season())
    )}
  if(!isTRUE(seasons)) out <- out[out$season %in% seasons]
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")

  out
}
