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
#' \dontshow{.for_cran()}
#' \donttest{
#' try({ # prevents cran errors
#'  load_schedules(2020)
#' })
#' }
#'
#' @export
load_schedules <- function(seasons = TRUE){
  if(!isTRUE(seasons)) stopifnot(is.numeric(seasons))
  out <- load_from_url("https://github.com/nflverse/nfldata/raw/master/data/games.rds",
                       seasons = seasons,
                       nflverse = TRUE,
                       nflverse_type = "games and schedules")
  # nflfastR and nfl4th use the "roof" variable in several models
  # These models expect one of c("closed", "outdoors", "open", "retractable") or NA
  # We ran into problems where roof was empty or something else several time
  # So we catch these cases here and change invalid data to NA
  valid_roof_values <- c("closed", "dome", "outdoors", "open", "retractable", NA_character_)
  out$roof[!out$roof %in% valid_roof_values] <- NA_character_

  return(out)
}
