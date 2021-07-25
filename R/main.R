#' Load Play By Play
#'
#' @description Loads multiple seasons from the nflfastR data repository
#'
#' @param seasons A vector of 4-digit years associated with given NFL seasons.
#' @param file_type One of `"rds"` or `"qs"`. Can also be set globally with the
#' option nflreadr.prefer
#'
#' @return The complete nflfastR dataset as returned by `nflfastR::build_nflfastR_pbp()`
#' (see below) for all given `seasons`
#'
#' @examples
#' \donttest{
#' load_pbp(2019:2020)
#' }
#'
#' @seealso <https://www.nflfastr.com/articles/field_descriptions.html> for the data dictionary
#' @seealso <https://www.nflfastr.com/reference/build_nflfastR_pbp.html> for the nflfastR function `build_nflfastR_pbp()`
#'
#' @export
load_pbp <- function(seasons, file_type = getOption("nflreadr.prefer", default = "qs")) {

  file_type <- match.arg(file_type, c("rds", "qs"))
  loader <- choose_loader(file_type)

  # Catch invalid season input
  most_recent <- most_recent_season()

  if (!all(seasons %in% 1999:most_recent)) {
    stop(paste("Please pass valid seasons between 1999 and", most_recent))
  }

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
# @param seasons a numeric vector of seasons to return
# @param stat_type one of `offense`, `defense`, or `special_teams`
#' @param file_type One of `"rds"` or `"qs"`. Can also be set globally with the
#' option nflreadr.prefer
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
#'
#' @export
load_player_stats <- function(#seasons,
                              # stat_type = c("offense","defense","special_teams"),
                              file_type = getOption("nflreadr.prefer", default = "qs")){

  file_type <- match.arg(file_type, c("rds", "qs"))
  loader <- choose_loader(file_type)

  url <- paste0("https://github.com/nflverse/nflfastR-data/raw/master/data/player_stats.",file_type)

  out <- loader(url)
  class(out) <- c("tbl_df","tbl","data.frame")
  out
}

#' Load Team Level Weekly Stats
#'
# @param seasons a numeric vector of seasons to return
# @param type one of `offense`, `defense`, or `special_teams`
#'
#' @examples
#' \donttest{
#'   load_team_stats()
#' }
#'
#' @return
#'
#' @export
load_team_stats <- function(){}

#' Load Game/Schedule Data
#'
#' This returns game/schedule information as maintained by Lee Sharpe.
#'
#' @return A tibble of season-level roster data.
#'
#' @seealso <https://github.com/nflverse/nfldata>
#' @seealso <https://www.nflfastr.com/reference/fast_scraper_roster.html>
#'
#' @examples
#' \donttest{
#'  load_schedules()
#' }
#'
#' @export
load_schedules <- function(){
  out <- rds_from_url("https://github.com/nflverse/nfldata/raw/master/data/games.rds")
  class(out) <- c("tbl_df","tbl","data.frame")
  out
}

#' Load Rosters
#'
#' @param seasons a numeric vector of seasons to return
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
load_rosters <- function(seasons){
  # different "most-current-season" logic than for pbp, right?
  current_year <- as.integer(format(Sys.Date(), format = "%Y"))

  if (!all(seasons %in% 1999:current_year)) {
    stop(paste("Please pass valid seasons between 1999 and", current_year))
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

#' Load Player Level Weekly NFL Next Gen Stats
#'
#' @description Loads player level weekly stats provided by NFL Next Gen Stats
#' starting with the 2016 season. Three different stat types are available and
#' the current seasons data updates every night.
#'
#' @param stat_type one of `"passing"`, `"receiving"`, or `"rushing"`
#' @param file_type One of `"rds"` or `"qs"`. Can also be set globally with the
#' option nflreadr.prefer
#'
#' @examples
#' \donttest{
#'   load_nextgen_stats("passing")
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
load_nextgen_stats <- function(stat_type = c("passing", "receiving", "rushing"),
                               file_type = getOption("nflreadr.prefer", default = "qs")){

  file_type <- match.arg(file_type, c("rds", "qs"))
  loader <- choose_loader(file_type)

  url <- paste0("https://github.com/nflverse/ngs-data/raw/main/data/ngs_",
                stat_type,
                ".",
                file_type)

  out <- loader(url)
  class(out) <- c("tbl_df","tbl","data.frame")
  out
}
