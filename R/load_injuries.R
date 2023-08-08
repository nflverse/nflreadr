#' Load Injury Reports
#'
#' Data collected from an API for weekly injury report data.
#'
#' @param seasons a numeric vector of seasons to return, data available since 2009. Defaults to latest season available.
#' @param file_type One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @examples
#' \dontshow{.for_cran()}
#' \donttest{
#' try({# prevents cran errors
#'     load_injuries(2020)
#' })
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
                          file_type = getOption("nflreadr.prefer", default = "rds")){

  if(isTRUE(seasons)) seasons <- 2009:nflreadr::most_recent_season()

  file_type <- rlang::arg_match0(file_type, c("rds", "csv", "parquet", "qs"))
  stopifnot(is.numeric(seasons),
            seasons >= 2009,
            seasons <= most_recent_season())

  urls <- glue::glue("https://github.com/nflverse/nflverse-data/releases/download/injuries/injuries_{seasons}.{file_type}")

  out <- load_from_url(urls, seasons = seasons, nflverse = TRUE)

  return(out)
}
