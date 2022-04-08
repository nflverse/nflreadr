#' Load Game/Schedule Data
#'
#' This returns game/schedule information as maintained by Lee Sharpe.
#'
#' @param seasons a numeric vector of seasons to return, default `TRUE` returns all available data.
#'
#' @return A tibble of game information for past and/or future games.
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_schedules.html> for a web version of the data dictionary
#' @seealso [`dictionary_schedules`] for the data dictionary as a dataframe
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nfldata>
#'
#' @examples
#' \donttest{
#'  load_schedules(2020)
#' }
#'
#' @export
load_schedules <- function(seasons = TRUE){

  out <- rds_from_url("https://github.com/nflverse/nfldata/raw/master/data/games.rds")

  if(!isTRUE(seasons)) stopifnot(is.numeric(seasons))
  if(!isTRUE(seasons)) out <- out[out$season %in% seasons]

  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  attr(out,"nflverse_type") <- "games and schedules"
  out
}