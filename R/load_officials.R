#' Load Officials
#'
#' @description Loads data on which officials are assigned to oversee a specific game. Data available from 2015 onwards.
#'
#' @param seasons a numeric vector specifying what seasons to return, if `TRUE` returns all available data
#' @param file_type One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @examples
#' \dontshow{.for_cran()}
#' \donttest{
#' try({ # prevents cran errors
#'   load_officials()
#' })
#' }
#'
#' @return A tibble with one row per game per official.
#'
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflreadr> and it will be triaged appropriately.
#'
#' @export
load_officials <- function(
  seasons = TRUE,
  file_type = getOption("nflreadr.prefer", default = "rds")
) {
  file_type <- rlang::arg_match0(file_type, c("rds", "csv", "parquet", "qs"))
  url <- glue::glue(
    "https://github.com/nflverse/nflverse-data/releases/download/officials/officials.{file_type}"
  )

  if (!isTRUE(seasons)) {
    stopifnot(
      is.numeric(seasons),
      all(seasons >= 2015),
      all(seasons <= nflreadr::most_recent_season())
    )
  }

  out <- load_from_url(url, seasons = seasons, nflverse = TRUE)
  return(out)
}
