#' Load Play By Play
#'
#' @description Loads play by play seasons from the [nflverse-data repository](https://github.com/nflverse/nflverse-data)
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
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_pbp.html> for a web version of the data dictionary
#' @seealso [`dictionary_pbp`] for the data dictionary bundled as a package dataframe
#' @seealso <https://www.nflfastr.com/reference/build_nflfastR_pbp.html> for the nflfastR function `nflfastR::build_nflfastR_pbp()`
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflfastR-data>
#'
#' @export
load_pbp <- function(seasons = most_recent_season(), file_type = getOption("nflreadr.prefer", default = "qs")) {

  file_type <- rlang::arg_match0(file_type, c("rds", "qs"))
  loader <- choose_loader(file_type)

  if(isTRUE(seasons)) seasons <- 1999:most_recent_season()

  stopifnot(is.numeric(seasons),
            seasons >=1999,
            seasons <= most_recent_season())

  urls <- paste0("https://github.com/nflverse/nflverse-data/releases/download/pbp/play_by_play_",
                 seasons, ".", file_type)

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)
  out <- lapply(urls, progressively(loader, p))
  out <- data.table::rbindlist(out, use.names = TRUE)

  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  out
}

#' Load Player Level Weekly Stats
#'
#' @param seasons a numeric vector of seasons to return, defaults to most recent season. If set to `TRUE`, returns all available data.
#' @param stat_type one of `offense` or `kicking`
#' @param file_type One of `"rds"` or `"qs"`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @examples
#' \donttest{
#'   load_player_stats()
#'   load_player_stats(stat_type = "kicking")
#' }
#'
#' @return A tibble of week-level player statistics that aims to match NFL official box scores.
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_player_stats.html> for a web version of the data dictionary
#' @seealso [`dictionary_player_stats`] for the data dictionary
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflfastR-data>
#'
#' @export
load_player_stats <- function(seasons = most_recent_season(),
                              stat_type = c("offense","kicking"), # defense, punting, other as added
                              file_type = getOption("nflreadr.prefer", default = "qs")){

  if(!isTRUE(seasons)) {stopifnot(is.numeric(seasons),
                                  seasons >=1999,
                                  seasons <= most_recent_season())}

  file_type <- rlang::arg_match0(file_type, c("rds", "qs"))
  stat_type <- rlang::arg_match0(stat_type, c("offense","kicking"))

  base_name <- switch(stat_type,
                      "offense" = "player_stats.",
                      "kicking" = "player_stats_kicking.")

  loader <- choose_loader(file_type)

  url <- paste0("https://github.com/nflverse/nflverse-data/releases/download/player_stats/",base_name,file_type)

  out <- loader(url)
  if(!isTRUE(seasons)) out <- out[out$season %in% seasons]
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
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
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_rosters.html> for a web version of the data dictionary
#' @seealso [`dictionary_rosters`] for the data dictionary as a dataframe
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-data>
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

  urls <- paste0("https://github.com/nflverse/nflverse-data/releases/download/rosters/roster_",
                 seasons, ".rds")

  out <- lapply(urls, progressively(rds_from_url, p))
  out_ts <- attr(utils::tail(out,1),"nflverse_timestamp")
  out_type <- attr(utils::tail(out,1),"nflverse_type")
  out <- data.table::rbindlist(out, use.names = TRUE)
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  attr(out,"nflverse_timestamp") <- out_ts
  attr(out,"nflverse_type") <- out_type
  out
}

#' Load Player Level Weekly NFL Next Gen Stats
#'
#' @description Loads player level weekly stats provided by NFL Next Gen Stats
#' starting with the 2016 season. Three different stat types are available and
#' the current season's data updates every night. NGS will only provide data for
#' players above a minimum number of pass/rush/rec attempts.
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
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_nextgen_stats.html> for a web version of the data dictionary
#' @seealso [`dictionary_nextgen_stats`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-data>
#'
#' @export
load_nextgen_stats <- function(seasons = TRUE,
                               stat_type = c("passing", "receiving", "rushing"),
                               file_type = getOption("nflreadr.prefer", default = "qs")){

  if(!isTRUE(seasons)) {
    stopifnot(is.numeric(seasons),
              seasons >= 2016,
              seasons <= most_recent_season())
  }

  file_type <- rlang::arg_match0(file_type, c("rds", "qs"))
  stat_type <- rlang::arg_match0(stat_type, c("passing", "receiving", "rushing"))
  loader <- choose_loader(file_type)
  url <- paste0("https://github.com/nflverse/nflverse-data/releases/download/",
                "nextgen_stats/ngs_", stat_type, ".", file_type)
  out <- loader(url)
  if(!isTRUE(seasons)) out <- out[out$season %in% seasons]
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
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
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflfastR-data>
#'
#' @export
load_teams <- function(){
  out <- rds_from_url("https://github.com/nflverse/nflfastR-data/raw/master/teams_colors_logos.rds")
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  attr(out,"nflverse_type") <- "team graphics"
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
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_depth_charts.html> for a web version of the dictionary
#' @seealso [`dictionary_depth_charts`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-data>
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

  urls <- paste0("https://github.com/nflverse/nflverse-data/releases/download/depth_charts/depth_charts_",
                 seasons, ".rds")

  out <- lapply(urls, progressively(rds_from_url, p))
  out_ts <- attr(utils::tail(out,1),"nflverse_timestamp")
  out_type <- attr(utils::tail(out,1),"nflverse_type")
  out <- data.table::rbindlist(out, use.names = TRUE)
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  attr(out,"nflverse_timestamp") <- out_ts
  attr(out,"nflverse_type") <- out_type
  out
}

#' Load Injury Reports
#'
#' Data collected from an API for weekly injury report data.
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
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_injuries.html> for a web version of the dictionary
#' @seealso [`dictionary_injuries`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-data>
#'
#' @export
load_injuries <- function(seasons = most_recent_season(),
                          file_type = NULL){

  if(!is.null(file_type)){
    cli::cli_warn("`file_type` arg deprecated for load_injuries, now uses rds by default")
  }

  if(isTRUE(seasons)) seasons <- 2009:nflreadr::most_recent_season()

  stopifnot(is.numeric(seasons),
              seasons >= 2009,
              seasons <= most_recent_season())

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  urls <- paste0("https://github.com/nflverse/nflverse-data/releases/download/injuries/injuries_",
                 seasons, ".rds")

  out <- lapply(urls, progressively(rds_from_url, p))

  out_ts <- attr(utils::tail(out,1),"nflverse_timestamp")
  out_type <- attr(utils::tail(out,1),"nflverse_type")

  out <- data.table::rbindlist(out, use.names = TRUE)
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")

  attr(out,"nflverse_timestamp") <- out_ts
  attr(out,"nflverse_type") <- out_type

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
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_espn_qbr.html> for a web version of the dictionary
#' @seealso [`dictionary_espn_qbr`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/espnscrapeR-data>
#'
#' @export
load_espn_qbr <- function(league = c("nfl", "college"),
                          seasons = most_recent_season(),
                          summary_type = c("season","weekly")
){

  league <- rlang::arg_match0(league, c("nfl","college"))
  summary_type <- rlang::arg_match0(summary_type, c("season","weekly"))
  if(!isTRUE(seasons)) {
    stopifnot(is.numeric(seasons),
              seasons >= 2006,
              seasons <= most_recent_season())
  }


  url <- paste0("https://github.com/nflverse/espnscrapeR-data/raw/master/data/qbr-",
                league,
                "-",
                summary_type,
                ".rds")

  out <- rds_from_url(url)
  if(!isTRUE(seasons)) out <- out[out$season %in% seasons]
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  attr(out,"nflverse_type") <- "QBR (via ESPN)"
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
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_pfr_passing.html> for the web data dictionary
#' @seealso [`dictionary_pfr_passing`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/pfr_scrapR>
#'
#' @export
load_pfr_passing <- function(seasons = TRUE){

  cli::cli_warn("`load_pfr_passing()` has been deprecated, please use `load_pfr_advstats(stat_type = 'pass', summary_level = 'season')`")

  load_pfr_advstats(seasons = seasons, stat_type = "pass", summary_level = "season")
}

#' Load Advanced Stats from PFR
#'
#' @description Loads player level season stats provided by Pro Football Reference
#' starting with the 2018 season, primarily to augment existing nflverse data.
#'
#' @param seasons a numeric vector specifying what seasons to return, if `TRUE` returns all available data
#' @param stat_type one of "pass", "rush", "rec", "def"
#' @param summary_level one of "week" (default) or "season" - some data is only available at the season level
#'
#' @examples
#' \donttest{
#'   load_pfr_advstats()
#' }
#'
#' @return A tibble of player statistics provided by Pro Football Reference that supplements data in nflverse
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_pfr_passing.html> for the web data dictionary
#' @seealso <https://www.pro-football-reference.com/years/2021/passing_advanced.htm>
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-data>
#'
#' @export
load_pfr_advstats <- function(seasons = most_recent_season(), stat_type = c("pass","rush","rec","def"), summary_level = c("week","season")){

  if(isTRUE(seasons)) seasons <- 2018:most_recent_season()
  stat_type <- rlang::arg_match0(stat_type, c("pass","rush","rec","def"))
  summary_level <- rlang::arg_match0(summary_level, c("week","season"))
  stopifnot(is.numeric(seasons),
            seasons >= 2018,
            seasons <= most_recent_season())

  switch(summary_level,
         "week" = .pfr_advstats_week(seasons, stat_type),
         "season" = .pfr_advstats_season(seasons, stat_type))
}

.pfr_advstats_week <- function(seasons,stat_type){

  urls <- paste0("https://github.com/nflverse/nflverse-data/releases/download/pfr_advstats/advstats_week_",
                 stat_type,
                 "_",
                 seasons,
                 ".rds")

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)
  out <- lapply(urls, progressively(rds_from_url, p))
  out_ts <- attr(utils::tail(out,1),"nflverse_timestamp")
  out_type <- attr(utils::tail(out,1),"nflverse_type")
  out <- data.table::rbindlist(out, use.names = TRUE)
  attr(out, "nflverse_timestamp") <- out_ts
  attr(out, "nflverse_type") <- out_type
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  out
}

.pfr_advstats_season <- function(seasons, stat_type){

  data_url <- paste0("https://github.com/nflverse/nflverse-data/releases/download/pfr_advstats/advstats_season_",
                 stat_type,
                 ".rds")

  out <- rds_from_url(data_url)
  out <- out[out$season %in% seasons]
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
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
#' @return A tibble of game-level snap counts provided by Pro Football Reference.
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_snap_counts.html> for the web data dictionary
#' @seealso [`dictionary_snap_counts`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/pfr_scrapR>
#'
#' @export
load_snap_counts <- function(seasons = most_recent_season()){

  if(isTRUE(seasons)) seasons <- 2013:most_recent_season()
  stopifnot(is.numeric(seasons),
            seasons >= 2013,
            seasons <= most_recent_season())

  urls <- paste0("https://github.com/nflverse/nflverse-data/releases/",
                 "download/snap_counts/snap_counts_",
                 seasons,
                 ".rds")

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)
  out <- lapply(urls, progressively(rds_from_url, p))
  out_ts <- attr(utils::tail(out,1),"nflverse_timestamp")
  out_type <- attr(utils::tail(out,1),"nflverse_type")
  out <- data.table::rbindlist(out, use.names = TRUE)
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  attr(out,"nflverse_timestamp") <- out_ts
  attr(out,"nflverse_type") <- out_type
  out
}

#' Load Combine Data from PFR
#'
#' @description Loads combine data since 2000 courtesy of PFR.
#'
#' @param seasons a numeric vector of seasons to return, default `TRUE` returns all available data
#'
#' @examples
#' \donttest{
#'   load_combine()
#' }
#'
#' @return A tibble of NFL combine data provided by Pro Football Reference.
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-data>
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_combine.html> for a web version of the dictionary
#' @seealso [`dictionary_combine`] for the data dictionary as bundled within the package
#'
#' @export
load_combine <- function(seasons = TRUE){
  url <- "https://github.com/nflverse/nflverse-data/releases/download/combine/combine.rds"
  out <- rds_from_url(url)
  if(!isTRUE(seasons)) stopifnot(is.numeric(seasons))
  if(!isTRUE(seasons)) out <- out[out$season %in% seasons]
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
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
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_draft_picks.html> for the web data dictionary
#' @seealso [`dictionary_draft_picks`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nfldata>
#'
#' @export
load_draft_picks <- function(seasons = TRUE){
  url <- "https://raw.githubusercontent.com/nflverse/nfldata/master/data/draft_picks.rds"
  out <- rds_from_url(url)
  if(!isTRUE(seasons)) stopifnot(is.numeric(seasons))
  if(!isTRUE(seasons)) out <- out[out$season %in% seasons]
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  attr(out,"nflverse_type") <- "draft picks (via PFR)"
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
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_trades.html> for a web version of the dictionary
#' @seealso [`dictionary_trades`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nfldata>
#'
#' @examples
#' \donttest{
#'  load_trades(2020)
#' }
#'
#' @export
load_trades <- function(seasons = TRUE){

  out <- rds_from_url("https://github.com/nflverse/nfldata/raw/master/data/trades.rds")

  if(!isTRUE(seasons)) stopifnot(is.numeric(seasons))
  if(!isTRUE(seasons)) out <- out[out$season %in% seasons]
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  attr(out,"nflverse_type") <- "trades (via PFR)"
  out
}
