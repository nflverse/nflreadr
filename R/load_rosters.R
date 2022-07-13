#' Load Rosters
#'
#' @param seasons a numeric vector of seasons to return, defaults to returning
#' this year's data if it is March or later. If set to `TRUE`, will return all available data.
#' @param file_type One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @examples
#' \donttest{
#' try({ # prevents cran errors
#'   load_rosters(2020)
#' })
#' }
#'
#' @return A tibble of season-level roster data.
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_rosters.html> for a web version of the data dictionary
#' @seealso [`dictionary_rosters`] for the data dictionary as a dataframe
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-data>
#'
#' @export
load_rosters <- function(seasons = most_recent_season(roster = TRUE),
                         file_type = getOption("nflreadr.prefer", default = "rds")){
  file_type <- rlang::arg_match0(file_type, c("rds", "csv", "parquet", "qs"))
  current_year <- most_recent_season(roster = TRUE)
  if(isTRUE(seasons)) seasons <- 1999:current_year
  stopifnot(is.numeric(seasons),
            seasons >= 1999,
            seasons <= current_year)

  urls <- paste0("https://github.com/nflverse/nflverse-data/releases/download/rosters/roster_",
                 seasons, ".rds")

  out <- load_from_url(urls, seasons = seasons, nflverse = TRUE)

  return(out)
}
