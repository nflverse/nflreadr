#' Load Play By Play
#'
#' @description Loads multiple seasons from the nflfastR data repository
#'
#' @param seasons A numeric vector of 4-digit years associated with given NFL seasons - defaults to latest season. If set to `TRUE`, returns all available data since 1999.
#' @param file_type One of `"rds"` or `"qs"`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @return The complete nflfastR dataset as returned by `nflfastR::build_nflfastR_pbp()`
#' (see below) for all given `seasons`
#'
#' @examples
#' \donttest{
#' load_pbp(2019:2020)
#' }
#'
#' @seealso `vignette("Data Dictionary - PBP")` for the data dictionary
#' @seealso <https://www.nflfastr.com/articles/field_descriptions.html> for a web version of the data dictionary
#' @seealso <https://www.nflfastr.com/reference/build_nflfastR_pbp.html> for the nflfastR function `build_nflfastR_pbp()`
#'
#' @export
load_pbp <- function(seasons = most_recent_season(), file_type = getOption("nflreadr.prefer", default = "qs")) {

  file_type <- match.arg(file_type, c("rds", "qs"))
  loader <- choose_loader(file_type)

  if(isTRUE(seasons)) seasons <- 1999:most_recent_season()

  # Alternative "error" message/handling?
  stopifnot(is.numeric(seasons),
            seasons >=1999,
            seasons <= most_recent_season())

  # if (!all(seasons %in% 1999:most_recent_season())) {
  #   stop(paste("Please pass valid seasons between 1999 and", most_recent_season()))
  # }

  urls <- paste0("https://github.com/nflverse/nflfastR-data/raw/master/data/play_by_play_",
                 seasons, ".", file_type)

  # If progressr is installed, make progress updates available
  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- purrr::map_dfr(urls, loader, p = p)
  class(out) <- c("tbl_df","tbl","data.frame")
  out
}

#' Load Player Level Weekly Stats
#'
#' @param seasons a numeric vector of seasons to return, defaults to most recent season. If set to `NULL`, returns all available data.
# @param stat_type one of `offense`, `defense`, or `special_teams`
#' @param file_type One of `"rds"` or `"qs"`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @examples
#' \donttest{
#'   load_player_stats()
#' }
#'
#' @return A tibble of week-level player statistics that aims to match NFL official box scores.
#'
#' @seealso <https://www.nflfastr.com/reference/load_player_stats.html>
#' @seealso <https://github.com/nflverse/nflfastr-data>
#' @seealso `vignette("Data Dictionary - Player Stats")` for the data dictionary
#'
#' @export
load_player_stats <- function(seasons = most_recent_season(),
                              # stat_type = c("offense","defense","special_teams"),
                              file_type = getOption("nflreadr.prefer", default = "qs")){

  if(isTRUE(seasons)) seasons <- 1999:most_recent_season()

  stopifnot(is.numeric(seasons),
            seasons >=1999,
            seasons <= most_recent_season())

  file_type <- match.arg(file_type, c("rds", "qs"))
  loader <- choose_loader(file_type)

  url <- paste0("https://github.com/nflverse/nflfastR-data/raw/master/data/player_stats.",file_type)

  out <- loader(url)
  class(out) <- c("tbl_df","tbl","data.frame")
  if(!is.null(seasons)) out <- dplyr::filter(out, out$season %in% seasons)
  out
}

# Load Team Level Weekly Stats
#
# @param seasons a numeric vector of seasons to return
# @param type one of `offense`, `defense`, or `special_teams`
#
# @examples
# \donttest{
#   load_team_stats()
# }
#
# @return
#
# @export
# load_team_stats <- function(){}

#' Load Game/Schedule Data
#'
#' This returns game/schedule information as maintained by Lee Sharpe.
#'
#' @param seasons a numeric vector of seasons to return, default `TRUE` returns all available data.
#'
#' @return A tibble of game information for past and/or future games.
#'
#' @seealso <https://github.com/nflverse/nfldata>
#'
#' @examples
#' \donttest{
#'  load_schedules(2020)
#' }
#'
#' @export
load_schedules <- function(seasons = TRUE){

  out <- rds_from_url("https://github.com/nflverse/nfldata/raw/master/data/games.rds")
  class(out) <- c("tbl_df","tbl","data.frame")

  if(!isTRUE(seasons)) stopifnot(is.numeric(seasons))
  if(!isTRUE(seasons)) out <- dplyr::filter(out, out$season %in% seasons)

  out
}

#' Load Rosters
#'
#' @param seasons a numeric vector of seasons to return, defaults to returning
#' this year's data if it is March or later. If set to `TRUE`, will return all available data.
#'
#' @examples
#' \donttest{
#'   load_rosters(2020)
#' }
#'
#' @return A tibble of season-level roster data.
#'
#' @seealso <https://github.com/nflverse/nflfastR-roster>
#' @seealso <https://www.nflfastr.com/reference/fast_scraper_roster.html>
#'
#' @export
load_rosters <- function(seasons = most_recent_season()){

  # different "most-current-season" logic than for pbp
  current_year <- most_recent_season(roster = TRUE)
  if(isTRUE(seasons)) seasons <- 1999:current_year
  stopifnot(is.numeric(seasons),
            seasons >= 1999,
            seasons <= current_year)

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

#' Load Player Level Weekly NFL Next Gen Stats
#'
#' @description Loads player level weekly stats provided by NFL Next Gen Stats
#' starting with the 2016 season. Three different stat types are available and
#' the current season's data updates every night.
#'
#' @param seasons a numeric vector specifying what seasons to return, if `TRUE` returns all available data
#' @param stat_type one of `"passing"`, `"receiving"`, or `"rushing"`
#' @param file_type One of `"rds"` or `"qs"`. Can also be set globally with options(nflreadr.prefer)
#'
#' @examples
#' \donttest{
#'   load_nextgen_stats(stat_type = "passing")
#'   load_nextgen_stats(stat_type = "receiving")
#'   load_nextgen_stats(stat_type = "rushing")
#' }
#'
#' @return A tibble of week-level player statistics provided by NFL Next Gen Stats.
#' Regular season summary is given for `week == 0`.
#'
#' @seealso <https://nextgenstats.nfl.com/stats/passing> for `stat_type = "passing"`
#' @seealso <https://nextgenstats.nfl.com/stats/receiving> for `stat_type = "receiving"`
#' @seealso <https://nextgenstats.nfl.com/stats/rushing> for `stat_type = "rushing"`
#'
#' @export
load_nextgen_stats <- function(seasons = TRUE,
                               stat_type = c("passing", "receiving", "rushing"),
                               file_type = getOption("nflreadr.prefer", default = "qs")){

  if(isTRUE(seasons)) seasons <- 2016:most_recent_season()
  stopifnot(is.numeric(seasons),
            seasons >= 2016,
            seasons <= most_recent_season())

  file_type <- match.arg(file_type, c("rds", "qs"))
  stat_type <- match.arg(stat_type)
  loader <- choose_loader(file_type)

  url <- paste0("https://github.com/nflverse/ngs-data/raw/main/data/ngs_",
                stat_type,
                ".",
                file_type)

  out <- loader(url)
  class(out) <- c("tbl_df","tbl","data.frame")
  if(!is.null(seasons)) out <- dplyr::filter(out, out$season %in% seasons)
  out
}
