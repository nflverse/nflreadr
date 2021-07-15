#' Load Play By Play
#'
#' @param seasons
#'
#' @return
#' @export
#'
#' @examples
#' load_pbp(2019:2020)
load_pbp <- function(seasons){
  most_recent <- most_recent_season()
  if (!all(seasons %in% 1999:most_recent)) {
    cli::cli_abort("Please pass valid seasons between 1999 and {most_recent}")
  }
  urls <- paste0(
    "https://github.com/nflverse/nflfastR-data/blob/master/data/play_by_play_",
    seasons,
    ".rds?raw=true"
  )
  out <- parallel::mclapply(urls, rds_from_url)
  out <- do.call("rbind", out)
  out
}

#' Load Player Level Stats
#'
#' @param seasons a numeric vector of seasons to return
#' @param summarise_by one of `week` or `season`
#' @param type one of `offense`, `defense`, or `special_teams`
#' @return
#'
#' @examples
#' @export
load_player_stats <- function(seasons, type, summarise_by){}

#' Load Team Level Stats
#'
#' @param seasons a numeric vector of seasons to return
#' @param summarise_by one of `week` or `season`
#' @param type one of `offense`, `defense`, or `special_teams`
#'
#' @examples
#' @return
#' @export
load_team_stats <- function(){}

#' Load Game Data
#'
#' @return
#' @export
#'
#' @examples
load_schedules <- function(){}

#' Load Rosters
#'
#' @param seasons a numeric vector of seasons to return
#'
#' @return
#' @export
#'
#' @examples
load_rosters <- function(season){}
