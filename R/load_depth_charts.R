#' Load Weekly Depth Charts
#'
#' @description Loads depth charts for each NFL team for each week back to 2001.
#'
#' @param seasons a numeric vector specifying what seasons to return, if `TRUE` returns all available data. Defaults to latest season.
#' @param file_type One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @examples
#' \dontshow{.for_cran()}
#' \donttest{
#' try({ # prevents cran errors
#'   load_depth_charts(2020)
#' })
#' }
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_depth_charts.html> for a web version of the dictionary
#' @seealso [`dictionary_depth_charts`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-data>
#'
#' @return A tibble of week-level depth charts for each team.
#' @export
load_depth_charts <- function(seasons = most_recent_season(),
                              file_type = getOption("nflreadr.prefer", default = "rds")){
  if(isTRUE(seasons)) seasons <- 2001:most_recent_season()
  stopifnot(is.numeric(seasons),
            seasons >= 2001,
            seasons <= most_recent_season())

  urls <- glue::glue("https://github.com/nflverse/nflverse-data/releases/download/depth_charts/depth_charts_{seasons}.rds")
  out <- load_from_url(urls, seasons = seasons, nflverse = TRUE)
  return(out)
}
