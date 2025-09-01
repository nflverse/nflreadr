#' Load Player Level Stats
#'
#' @param seasons a numeric vector of seasons to return, defaults to most recent
#' season. If set to `TRUE`, returns all available data.
#' @inheritParams rlang::args_dots_empty
#' @param summary_level choice: one of week (default), "reg" for regular season,
#' "post" for postseason, "reg+post" for combined regular + post season stats
#' @param file_type choice: one of `c("rds", "qs", "csv", "parquet")`. Can also
#' be set globally with `options(nflreadr.prefer)`
#' @param stat_type `r lifecycle::badge("deprecated")` - now returns all stat
#' types by default
#'
#' @examples
#' \dontshow{.for_cran()}
#' \donttest{
#' try({
#'   load_player_stats()
#' })
#' }
#'
#' @return A tibble of week-level player statistics that aims to match NFL official box scores.
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_player_stats.html> for a web version of the data dictionary
#' @seealso [`dictionary_player_stats`] for the data dictionary
#'
#' @export
load_player_stats <- function(
  seasons = most_recent_season(),
  ...,
  summary_level = c("week", "reg", "post", "reg+post"),
  file_type = getOption("nflreadr.prefer", default = "rds"),
  stat_type = lifecycle::deprecated()
) {
  # ensure that all function args except seasons are named
  rlang::check_dots_empty()

  # deprecate stat_type arg
  if (lifecycle::is_present(stat_type)) {
    lifecycle::deprecate_warn(
      when = "1.5.0",
      what = "load_player_stats(stat_type)",
      with = "load_player_stats()"
    )
  }

  summary_level <- rlang::arg_match(summary_level)
  file_type <- rlang::arg_match0(file_type, c("rds", "csv", "qs", "parquet"))

  if (!isTRUE(seasons)) {
    stopifnot(
      is.numeric(seasons),
      seasons >= 1999,
      seasons <= most_recent_season()
    )
  }

  summary_level <- switch(
    summary_level,
    "week" = "week_",
    "reg" = "reg_",
    "post" = "post_",
    "reg+post" = "regpost_"
  )

  url <- paste0(
    "https://github.com/nflverse/nflverse-data/releases/download/stats_player/",
    "stats_player_",
    summary_level,
    seasons,
    ".",
    file_type
  )

  out <- load_from_url(url, seasons = seasons, nflverse = TRUE)
  out
}
#' Load Team Level Stats
#'
#' @param seasons a numeric vector of seasons to return, defaults to most recent
#' season. If set to `TRUE`, returns all available data.
#' @inheritParams rlang::args_dots_empty
#' @param summary_level choice: one of week (default), "reg" for regular season,
#' "post" for postseason, "reg+post" for combined regular + post season stats
#' @param file_type choice: one of `c("rds", "qs", "csv", "parquet")`. Can also
#' be set globally with `options(nflreadr.prefer)`
#'
#' @examples
#' \dontshow{.for_cran()}
#' \donttest{
#' try({
#'   load_team_stats()
#' })
#' }
#'
#' @return A tibble of week-level player statistics that aims to match NFL official box scores.
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_player_stats.html> for a web version of the data dictionary
#' @seealso [`dictionary_player_stats`] for the data dictionary
#'
#' @export
load_team_stats <- function(
  seasons = most_recent_season(),
  ...,
  summary_level = c("week", "reg", "post", "reg+post"),
  file_type = getOption("nflreadr.prefer", default = "rds")
) {
  # ensure that all function args except seasons are named
  rlang::check_dots_empty()

  summary_level <- rlang::arg_match(summary_level)
  file_type <- rlang::arg_match0(file_type, c("rds", "csv", "qs", "parquet"))

  if (!isTRUE(seasons)) {
    stopifnot(
      is.numeric(seasons),
      seasons >= 1999,
      seasons <= most_recent_season()
    )
  }

  summary_level <- switch(
    summary_level,
    "week" = "week_",
    "reg" = "reg_",
    "post" = "post_",
    "reg+post" = "regpost_"
  )

  url <- paste0(
    "https://github.com/nflverse/nflverse-data/releases/download/stats_team/",
    "stats_team_",
    summary_level,
    seasons,
    ".",
    file_type
  )

  out <- load_from_url(url, seasons = seasons, nflverse = TRUE)
  out
}
