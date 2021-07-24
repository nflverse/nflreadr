#' Load Play By Play
#'
#' @description Loads multiple seasons from the nflfastR data repository
#'
#' @param seasons A vector of 4-digit years associated with given NFL seasons.
#' @param file_type One of `"rds"`, `"parquet"` or `"qs"`. The latter two require
#' the package `curl` as well as `arrow` and `qs` respectively.
#'
#' @return The complete nflfastR dataset as returned by [nflfastR::build_nflfastR_pbp()] for
#' all given `seasons`
#'
#' @examples
#' \donttest{
#' load_pbp(2019:2020)
#' }
#'
#' @seealso <https://www.nflfastr.com/articles/field_descriptions.html> for the data dictionary
#'
#' @export
load_pbp <- function(seasons, file_type = getOption("nflreadr.prefer", default = "qs")) {

  file_type <- match.arg(file_type, c("rds", "qs"))
  loader <- choose_loader(file_type)

  # Catch invalid season input
  most_recent <- most_recent_season()

  if (!all(seasons %in% 1999:most_recent)) {
    cli::cli_abort("Please pass valid seasons between 1999 and {most_recent}")
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
#' @param file_type One of `"rds"`, `"parquet"` or `"qs"`. The latter two require
#' the package `curl` as well as `arrow` and `qs` respectively.
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
load_rosters <- function(season){
  # different "most-current-season" logic than for pbp, right?
  current_year <- as.integer(format(Sys.Date(), format = "%Y"))

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
