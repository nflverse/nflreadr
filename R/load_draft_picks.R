#' Load Draft Picks from PFR
#'
#' @description Loads every draft pick since 1980 courtesy of PFR.
#'
#' @param seasons a numeric vector of seasons to return, default `TRUE` returns all available data
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
load_draft_picks <- function(seasons = TRUE){
  url <- "https://github.com/nflverse/nflverse-data/releases/download/draft_picks/draft_picks.rds"
  out <- rds_from_url(url)
  if(!isTRUE(seasons)) stopifnot(is.numeric(seasons))
  if(!isTRUE(seasons)) out <- out[out$season %in% seasons]
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  out
}
