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

  check_download_deps(type)

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

#' Load Player Level Weekly Stats
#'
#' @param seasons a numeric vector of seasons to return
# @param stat_type one of `offense`, `defense`, or `special_teams`
#' @param file_type one of "rds", "qs" or "parquet"
#'
#' @export
load_player_stats <- function(seasons,
                              # stat_type = c("offense","defense","special_teams"),
                              file_type = c("rds","qs","parquet")){

  file_type <- match.arg(file_type)

  check_download_deps(file_type)

  url <- paste0("https://github.com/nflverse/nflfastR-data/raw/master/data/player_stats.",file_type)

  loader <- switch(type,
                   "rds" = rds_from_url,
                   "parquet" = parquet_from_url,
                   "qs" = qs_from_url)

  out <- loader(url)

  class(out) <- c("tbl_df","tbl","data.frame")

  out
}
#' Load Team Level Weekly Stats
#'
#' @param seasons a numeric vector of seasons to return
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
#' @export
load_rosters <- function(season){

  current_year <- as.integer(format(today, format = "%Y"))

  if (!all(seasons %in% 1999:current_year)) {
    cli::cli_abort("Please pass valid seasons between 1999 and {current_year}")
  }

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  urls <- paste0("https://github.com/nflverse/nflfastR-roster/",
                 "raw/master/data/seasons/roster_",
                 seasons,
                 ".rds")

  out <- purrr::map_dfr(urls, rds_from_url, p = p)

  class(out) <- c("tbl_df","tbl","data.frame")

  out
}
