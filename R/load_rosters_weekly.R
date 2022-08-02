#' Load Weekly Rosters
#'
#' Returns week level rosters (rather than latest for a given season as returned by `load_rosters()`)
#'
#' @param seasons a numeric vector of seasons to return, defaults to returning
#' this year's data if it is March or later. If set to `TRUE`, will return all available data.
#' Data available back to 2002.
#' @param file_type One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @examples
#' \donttest{
#' try({ # prevents cran errors
#'   load_rosters_weekly(2020)
#' })
#' }
#'
#' @return A tibble of weekly roster data.
#'
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-data>
#'
#' @export
load_rosters_weekly <- function(seasons = most_recent_season(roster = TRUE),
                                file_type = getOption("nflreadr.prefer", default = "rds")){

  file_type <- rlang::arg_match0(file_type, c("rds", "csv", "parquet", "qs"))

  current_year <- most_recent_season(roster = TRUE)

  if(isTRUE(seasons)) seasons <- 2002:current_year

  stopifnot(is.numeric(seasons),
            seasons >= 2002,
            seasons <= current_year)

  urls <- paste0("https://github.com/nflverse/nflverse-data/releases/download/weekly_rosters/roster_weekly_",
                 seasons,".",file_type)

  out <- load_from_url(urls, seasons = seasons, nflverse = TRUE)

  return(out)
}

