#' Load Play By Play
#'
#' @description Loads multiple seasons from the nflfastR datarepo
#'
#' @param seasons A vector of 4-digit years associated with given NFL seasons.
#' @param type One of `"rds"`, `"parquet"` or `"qs"`. The latter two require
#' the package `curl` as well as `arrow` and `qs` respectively.
#'
#' @return The complete nflfastR dataset as returned by [nflfastR::build_nflfastR_pbp()] for
#' all given `seasons`
#' @export
#'
#' @examples
#' pbp <- load_pbp(2019:2020)
#' dplyr::glimpse(pbp)
load_pbp <- function(seasons, type = c("rds", "parquet", "qs")) {
  type <- match.arg(type)

  # Catch missing packages
  if (type == "parquet" && !all(is_installed("arrow"), is_installed("curl"))){
    cli::cli_abort("Packages {.code arrow} and {.code curl} required for argument {.val {type}}. Please install them.")
  }

  if (type == "qs" && !all(is_installed("qs"), is_installed("curl"))){
    cli::cli_abort("Packages {.code qs} and {.code curl} required for argument {.val {type}}. Please install them.")
  }

  # Catch invalid season input
  most_recent <- most_recent_season()
  if (!all(seasons %in% 1999:most_recent)) {
    cli::cli_abort("Please pass valid seasons between 1999 and {most_recent}")
  }

  # If progressr is installed, make progress updates available
  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  base_url <- paste0(
    "https://github.com/nflverse/nflfastR-data/blob/master/data/play_by_play_",
    seasons
  )

  # choose loading function and correct urls
  if (type == "parquet"){
    loader <- parquet_from_url
    urls <- paste0(base_url, ".parquet?raw=true")
  } else if (type == "qs"){
    loader <- qs_from_url
    urls <- paste0(base_url, ".qs?raw=true")
  } else {
    loader <- rds_from_url
    urls <- paste0(base_url, ".rds?raw=true")
  }

  purrr::map_dfr(urls, loader, p = p)
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
load_schedules <- function(){
  "https://github.com/nflverse/nfldata/blob/master/data/games.rds?raw=true" %>%
    rds_from_url()
}

#' Load Rosters
#'
#' @param seasons a numeric vector of seasons to return
#'
#' @return
#' @export
#'
#' @examples
load_rosters <- function(season){}
