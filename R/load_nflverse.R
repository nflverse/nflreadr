#' Load Play By Play
#'
#' @description Loads multiple seasons from the [nflfastR data repository](https://github.com/nflverse/nflfastR-data)
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
#'   load_pbp(2019:2020)
#' }
#' @seealso [`dictionary_pbp`] for the data dictionary as a dataframe
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_pbp.html> for a web version of the data dictionary
#' @seealso <https://www.nflfastr.com/reference/build_nflfastR_pbp.html> for the nflfastR function `nflfastR::build_nflfastR_pbp()`
#'
#' @export
load_pbp <- function(seasons = most_recent_season(), file_type = getOption("nflreadr.prefer", default = "qs")) {

  file_type <- match.arg(file_type, c("rds", "qs"))
  loader <- choose_loader(file_type)

  if(isTRUE(seasons)) seasons <- 1999:most_recent_season()

  stopifnot(is.numeric(seasons),
            seasons >=1999,
            seasons <= most_recent_season())

  urls <- paste0("https://github.com/nflverse/nflfastR-data/raw/master/data/play_by_play_",
                 seasons, ".", file_type)

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  out <- purrr::map_dfr(urls, progressively(loader, p))
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
#' @seealso <https://github.com/nflverse/nfldata/blob/master/DATASETS.md#games>
#' @seealso [`dictionary_schedules`] for the data dictionary as a dataframe
#' @seealso `vignette("Data Dictionary - Schedules")` for the data dictionary as a vignette
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
#' @seealso [`dictionary_rosters`] for the data dictionary as a dataframe
#' @seealso <https://github.com/nflverse/nflfastR-roster>
#' @seealso <https://www.nflfastr.com/reference/fast_scraper_roster.html>
#'
#' @export
load_rosters <- function(seasons = most_recent_season(roster = TRUE)){

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

  out <- purrr::map_dfr(urls, progressively(rds_from_url, p))
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
#' @seealso [`dictionary_nextgen_stats`] for the data dictionary
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_nextgen_stats.html> for a web version of the dictionary
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
#' Load NFL Team Graphics, Colors, and Logos
#'
#' @description Loads team graphics, colors, and logos - useful for plots!
#'
#' @examples
#' \donttest{
#'   load_teams()
#' }
#'
#' @return A tibble of team-level image URLs and hex color codes.
#'
#' @seealso <https://github.com/nflverse/nflfastr-data>
#'
#' @export
load_teams <- function(){
  out <- rds_from_url("https://github.com/nflverse/nflfastR-data/raw/master/teams_colors_logos.rds")
  class(out) <- c("tbl_df","tbl","data.frame")
  out
}

#' Load Weekly Depth Charts
#'
#' @description Loads depth charts for each NFL team for each week back to 2001.
#'
#' @param seasons a numeric vector specifying what seasons to return, if `TRUE` returns all available data. Defaults to latest season.
#'
#' @examples
#' \donttest{
#'   load_depth_charts(2020)
#' }
#'
#' @seealso <https://github.com/nflverse/nflfastR-roster>
#'
#' @return A tibble of week-level depth charts for each team.
#' @export
load_depth_charts <- function(seasons = most_recent_season()){
  if(isTRUE(seasons)) seasons <- 2001:most_recent_season()
  stopifnot(is.numeric(seasons),
            seasons >= 2001,
            seasons <= most_recent_season())

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)
  urls <- paste0("https://github.com/nflverse/nflfastR-roster/",
                 "raw/master/data/seasons/depth_charts_",
                 seasons,
                 ".rds")

  out <- purrr::map_dfr(urls, progressively(rds_from_url,p))
  class(out) <- c("tbl_df","tbl","data.frame")
  return(out)
 }

#' Load Injury Reports
#'
#' @param seasons a numeric vector of seasons to return, data available since 2009. Defaults to latest season available.
#' @param file_type One of `"rds"` or `"qs"`. Can also be set globally with options(nflreadr.prefer)
#'
#' @examples
#' \donttest{
#'     load_injuries(2020)
#' }
#'
#' @return a tibble of season-level injury report data.
#'
#' @seealso <https://github.com/nflverse/nflfastR-roster>
#'
#' @export
load_injuries <- function(seasons = most_recent_season(),
                          file_type = getOption("nflreadr.prefer", default = "qs")){
  if(isTRUE(seasons)) seasons <- 2009:most_recent_season()
  stopifnot(is.numeric(seasons),
            seasons >= 2009,
            seasons <= most_recent_season())
  file_type <- match.arg(file_type, c("rds", "qs"))
  loader <- choose_loader(file_type)

  url <- paste0("https://github.com/nflverse/nflfastR-roster/raw/master/data/nflfastR-injuries",
                ".",
                file_type)
  out <- loader(url)
  class(out) <- c("tbl_df","tbl","data.frame")
  if(!is.null(seasons)) out <- dplyr::filter(out, out$season %in% seasons)
  out
}

#' Load ESPN's QBR
#'
#' @param league One of "nfl" or "college", defaults to "nfl"
#' @param seasons a numeric vector of seasons to return, data available since 2006. Defaults to latest season available. TRUE will select all seasons.
#' @param summary_type One of "season" or "weekly", defaults to season
#'
#' @examples
#' \donttest{
#'     load_espn_qbr("nfl",2020)
#' }
#'
#' @return a tibble of season-level injury report data.
#'
#' @seealso <https://github.com/nflverse/espnscrapeR-data>
#'
#' @export
load_espn_qbr <- function(league = c("nfl", "college"),
                          seasons = most_recent_season(),
                          summary_type = c("season","weekly")
                          ){

  league <- match.arg(league)
  summary_type <- match.arg(summary_type)
  if(isTRUE(seasons)) seasons <- 2006:most_recent_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2006,
            seasons <= most_recent_season())

  url <- paste0("https://github.com/nflverse/espnscrapeR-data/raw/master/data/qbr-",
                league,
                "-",
                summary_type,
                ".rds")

  out <- rds_from_url(url)
  class(out) <- c("tbl_df","tbl","data.frame")

  if(!is.null(seasons)) out <- dplyr::filter(out, out$season %in% seasons)

  out
}

#' Load Advanced Passing Stats from PFR
#'
#' @description Loads player level season stats provided by Pro Football Reference
#' starting with the 2019 season.
#'
#' @param seasons a numeric vector specifying what seasons to return, if `TRUE` returns all available data
#'
#' @examples
#' \donttest{
#'   load_pfr_passing()
#' }
#'
#' @return A tibble of season-level player statistics provided by Pro Football Reference.
#'
#' @seealso <https://www.pro-football-reference.com/years/2020/passing_advanced.htm>
#' @seealso [`dictionary_pfr_passing`] for the data dictionary
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_pfr_passing.html>
#'
#' @export
load_pfr_passing <- function(seasons = TRUE){

  if(isTRUE(seasons)) seasons <- 2019:most_recent_season()
  stopifnot(is.numeric(seasons),
            seasons >= 2019,
            seasons <= most_recent_season())

  url <- "https://raw.githubusercontent.com/nflverse/pfr_scrapR/master/data/pfr_advanced_passing.rds"

  out <- rds_from_url(url)
  class(out) <- c("tbl_df","tbl","data.frame")
  if(!is.null(seasons)) out <- dplyr::filter(out, out$season %in% seasons)
  out
}

#' Load Snap Counts from PFR
#'
#' @description Loads game level snap counts stats provided by Pro Football Reference
#' starting with the 2013 season.
#'
#' @param seasons a numeric vector specifying what seasons to return, if `TRUE` returns all available data
#'
#' @examples
#' \donttest{
#'   load_snap_counts()
#' }
#'
#' @return A tibble of season-level player statistics provided by Pro Football Reference.
#'
#' @seealso [`dictionary_snap_counts`] for the data dictionary
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_snap_counts.html>
#'
#' @export
load_snap_counts <- function(seasons = most_recent_season()){

  if(isTRUE(seasons)) seasons <- 2013:most_recent_season()
  stopifnot(is.numeric(seasons),
            seasons >= 2013,
            seasons <= most_recent_season())

  urls <- paste0("https://github.com/nflverse/pfr_scrapR/",
                 "blob/master/data/snap_counts_",
                 seasons,
                 ".rds?raw=true")

  out <- purrr::map_dfr(urls, rds_from_url)

  class(out) <- c("tbl_df","tbl","data.frame")
  out
}

#' Load Draft Picks from PFR
#'
#' @description Loads every draft pick since 1980 courtesy of PFR.
#'
#' @param seasons a numeric vector of seasons to return, default `TRUE` returns all available data
#'
#' @examples
#' \donttest{
#'   load_draft_picks()
#' }
#'
#' @return A tibble of NFL draft picks provided by Pro Football Reference.
#'
#' @seealso [`dictionary_draft_picks`] for the data dictionary
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_draft_picks.html>
#'
#' @export
load_draft_picks <- function(seasons = TRUE){

  url <- "https://raw.githubusercontent.com/nflverse/nfldata/master/data/draft_picks.rds"
  out <- rds_from_url(url)
  class(out) <- c("tbl_df","tbl","data.frame")

  if(!isTRUE(seasons)) stopifnot(is.numeric(seasons))
  if(!isTRUE(seasons)) out <- dplyr::filter(out, out$season %in% seasons)
  out
}

#' Load Trades
#'
#' This returns a table of historical trades as maintained by Lee Sharpe.
#'
#' @param seasons a numeric vector of seasons to return, default `TRUE` returns all available data.
#'
#' @return A tibble of game information for past and/or future games.
#'
#' @seealso <https://github.com/nflverse/nfldata/blob/master/DATASETS.md#trades>
#'
#' @examples
#' \donttest{
#'  load_trades(2020)
#' }
#'
#' @export
load_trades <- function(seasons = TRUE){

  out <- rds_from_url("https://github.com/nflverse/nfldata/raw/master/data/trades.rds")
  class(out) <- c("tbl_df","tbl","data.frame")

  if(!isTRUE(seasons)) stopifnot(is.numeric(seasons))
  if(!isTRUE(seasons)) out <- dplyr::filter(out, out$season %in% seasons)

  out
}
