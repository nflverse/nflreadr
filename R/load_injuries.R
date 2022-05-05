#' Load Injury Reports
#'
#' Data collected from an API for weekly injury report data.
#'
#' @param seasons a numeric vector of seasons to return, data available since 2009. Defaults to latest season available.
#' @param file_type Deprecated: now uses rds by default.
#'
#' @examples
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
                          file_type = NULL){

  if(!is.null(file_type)){
    cli::cli_warn("`file_type` arg deprecated for load_injuries, now uses rds by default")
  }

  if(isTRUE(seasons)) seasons <- 2009:nflreadr::most_recent_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2009,
            seasons <= most_recent_season())

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  urls <- paste0("https://github.com/nflverse/nflverse-data/releases/download/injuries/injuries_",
                 seasons, ".rds")

  out <- lapply(urls, progressively(rds_from_url, p))

  out <- rbindlist_with_attrs(out)

  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")

  out
}
