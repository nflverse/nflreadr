#' Load Draft Picks from PFR
#'
#' @description Loads every draft pick since 1980 courtesy of PFR.
#'
#' @param seasons a numeric vector of seasons to return, default `TRUE` returns all available data
#' @param file_type One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @examples
#' \donttest{
#' try({ # prevents cran errors
#'   load_draft_picks()
#' })
#' }
#'
#' @return A tibble of NFL draft picks provided by Pro Football Reference.
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_draft_picks.html> for the web data dictionary
#' @seealso [`dictionary_draft_picks`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-data>
#'
#' @export
load_draft_picks <- function(seasons = TRUE,
                             file_type = getOption("nflreadr.prefer", default = "rds")){
  file_type <- rlang::arg_match0(file_type, c("rds", "csv", "parquet", "qs"))
  url <- glue::glue("https://github.com/nflverse/nflverse-data/releases/download/draft_picks/draft_picks.{file_type}")
  out <- load_from_url(url, seasons = seasons, nflverse = TRUE)
  return(out)
}
