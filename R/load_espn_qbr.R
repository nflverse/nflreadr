#' Load ESPN's QBR
#'
#' @param seasons a numeric vector of seasons to return, data available since 2006. Defaults to latest season available. TRUE will select all seasons.
#' @param summary_type One of `"season"` or `"week"`, defaults to `"season"`
#' @param file_type One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @examples
#' \dontshow{.for_cran()}
#' \donttest{
#'     load_espn_qbr(2020)
#' }
#'
#' @return a tibble of ESPN QBR data, summarized according to `summary_type`
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_espn_qbr.html> for a web version of the dictionary
#' @seealso [`dictionary_espn_qbr`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/espnscrapeR-data>
#'
#' @export
load_espn_qbr <- function(
  seasons = most_recent_season(),
  summary_type = c("season", "week"),
  file_type = getOption("nflreadr.prefer", default = "rds")
) {
  summary_type <- rlang::arg_match0(summary_type, c("season", "week"))
  file_type <- rlang::arg_match0(file_type, c("rds", "qs", "csv", "parquet"))

  if (!isTRUE(seasons)) {
    stopifnot(
      is.numeric(seasons),
      seasons >= 2006,
      seasons <= most_recent_season()
    )
  }

  url <- paste0(
    "https://github.com/nflverse/nflverse-data/releases/download/espn_data/qbr_",
    summary_type,
    "_level.",
    file_type
  )
  out <- load_from_url(
    url,
    seasons = seasons,
    nflverse = TRUE,
    nflverse_type = "QBR (via ESPN/espnscrapeR)"
  )
  return(out)
}
