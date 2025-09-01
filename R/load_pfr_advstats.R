#' Load Advanced Passing Stats from PFR
#'
#' @description Loads player level season stats provided by Pro Football Reference
#' starting with the 2019 season.
#'
#' @param seasons a numeric vector specifying what seasons to return, if `TRUE` returns all available data
#'
#' @examples
#' \dontshow{.for_cran()}
#' \donttest{
#'   load_pfr_passing()
#' }
#'
#' @return A tibble of season-level player statistics provided by Pro Football Reference.
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_pfr_passing.html> for the web data dictionary
#' @seealso [`dictionary_pfr_passing`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-pfr>
#'
#' @keywords internal
#' @export
load_pfr_passing <- function(seasons = TRUE) {
  cli::cli_warn(
    "`load_pfr_passing()` has been deprecated, please use `load_pfr_advstats(stat_type = 'pass', summary_level = 'season')`"
  )

  load_pfr_advstats(
    seasons = seasons,
    stat_type = "pass",
    summary_level = "season"
  )
}

#' Load Advanced Stats from PFR
#'
#' @description Loads player level season stats provided by Pro Football Reference
#' starting with the 2018 season, primarily to augment existing nflverse data.
#'
#' @param seasons a numeric vector specifying what seasons to return, if `TRUE` returns all available data
#' @param stat_type one of "pass", "rush", "rec", "def"
#' @param summary_level one of "week" (default) or "season" - some data is only available at the season level
#' @param file_type One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#'
#' @examples
#' \dontshow{.for_cran()}
#' \donttest{
#' try({ # prevents cran errors
#'   load_pfr_advstats()
#' })
#' }
#'
#' @return A tibble of player statistics provided by Pro Football Reference that supplements data in nflverse
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_pfr_passing.html> for the web data dictionary
#' @seealso <https://www.pro-football-reference.com/years/2021/passing_advanced.htm>
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-data>
#'
#' @export
load_pfr_advstats <- function(
  seasons = most_recent_season(),
  stat_type = c("pass", "rush", "rec", "def"),
  summary_level = c("week", "season"),
  file_type = getOption("nflreadr.prefer", default = "rds")
) {
  if (isTRUE(seasons)) {
    seasons <- 2018:most_recent_season()
  }
  stopifnot(
    is.numeric(seasons),
    seasons >= 2018,
    seasons <= most_recent_season()
  )

  stat_type <- rlang::arg_match0(stat_type, c("pass", "rush", "rec", "def"))
  summary_level <- rlang::arg_match0(summary_level, c("week", "season"))
  file_type <- rlang::arg_match0(file_type, c("rds", "csv", "parquet", "qs"))

  switch(
    summary_level,
    "week" = .pfr_advstats_week(seasons, stat_type, file_type),
    "season" = .pfr_advstats_season(seasons, stat_type, file_type)
  )
}

.pfr_advstats_week <- function(seasons, stat_type, file_type) {
  urls <- paste0(
    "https://github.com/nflverse/nflverse-data/releases/download/pfr_advstats/advstats_week_",
    stat_type,
    "_",
    seasons,
    ".",
    file_type
  )

  out <- load_from_url(urls, seasons = seasons, nflverse = TRUE)
  return(out)
}

.pfr_advstats_season <- function(seasons, stat_type, file_type) {
  data_url <- paste0(
    "https://github.com/nflverse/nflverse-data/releases/download/pfr_advstats/advstats_season_",
    stat_type,
    ".",
    file_type
  )

  out <- load_from_url(data_url, seasons = seasons, nflverse = TRUE)
  return(out)
}
