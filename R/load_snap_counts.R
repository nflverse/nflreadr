#' Load Snap Counts from PFR
#'
#' @description Loads game level snap counts stats provided by Pro Football Reference
#' starting with the 2012 season.
#'
#' @param seasons a numeric vector specifying what seasons to return, if `TRUE` returns all available data
#' @param file_type One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @examples
#' \dontshow{.for_cran()}
#' \donttest{
#'   try({ # prevents CRAN errors
#'   load_snap_counts()
#'   })
#' }
#'
#' @return A tibble of game-level snap counts provided by Pro Football Reference.
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_snap_counts.html> for the web data dictionary
#' @seealso [`dictionary_snap_counts`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-pfr>
#'
#' @export
load_snap_counts <- function(
  seasons = most_recent_season(),
  file_type = getOption("nflreadr.prefer", default = "rds")
) {
  file_type <- rlang::arg_match0(file_type, c("rds", "csv", "parquet", "qs"))
  if (isTRUE(seasons)) {
    seasons <- 2012:most_recent_season()
  }
  stopifnot(
    is.numeric(seasons),
    seasons >= 2012,
    seasons <= most_recent_season()
  )

  urls <- paste0(
    "https://github.com/nflverse/nflverse-data/releases/",
    "download/snap_counts/snap_counts_",
    seasons,
    ".",
    file_type
  )

  out <- load_from_url(urls, seasons = seasons, nflverse = TRUE)
  out
}
