#' Load Play By Play
#'
#' @description Loads multiple seasons from the nflfastR data repository
#'
#' @param seasons A vector of 4-digit years associated with given NFL seasons.
#' @param type One of `"rds"`, `"parquet"` or `"qs"`. The latter two require
#' the package `curl` as well as `arrow` and `qs` respectively.
#'
#' @return The complete nflfastR dataset as returned by [nflfastR::build_nflfastR_pbp()] for
#' all given `seasons`
#'
#' @export
#'
#' @examples
#' \donttest{
#' pbp <- load_pbp(2019:2020)
#' dplyr::glimpse(pbp)
#' }
#'
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

  urls <- paste0("https://github.com/nflverse/nflfastR-data/",
                 "raw/master/data/play_by_play_",
                 seasons,
                 ".",
                 type)

  loader <- switch(type,
                   "rds" = rds_from_url,
                   "parquet" = parquet_from_url,
                   "qs" = qs_from_url
                   )

  out <- purrr::map_dfr(urls, loader, p = p)
  class(out) <- c("tbl_df","tbl","data.frame")
  out
}

#' Load Player Level Stats
#'
#' @param seasons a numeric vector of seasons to return
#' @param summarise_by one of `week` or `season`
#' @param type one of `offense`, `defense`, or `special_teams`
#'
#' @export
load_player_stats <- function(seasons, type, summarise_by){

}
#' Load Team Level Stats
#'
#' @param seasons a numeric vector of seasons to return
#' @param summarise_by one of `week` or `season`
#' @param type one of `offense`, `defense`, or `special_teams`
#'
#' @export
load_team_stats <- function(){

}

#' Load Game/Schedule Data
#'
#' This returns game/schedule information as maintained by Lee Sharpe.
#'
#' @export
load_schedules <- function(){
  rds_from_url("https://github.com/nflverse/nfldata/raw/master/data/games.rds")
}

#' Load Rosters
#'
#' @param seasons a numeric vector of seasons to return
#'
load_rosters <- function(season){

}
