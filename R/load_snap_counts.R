#' Load Snap Counts from PFR
#'
#' @description Loads game level snap counts stats provided by Pro Football Reference
#' starting with the 2013 season.
#'
#' @param seasons a numeric vector specifying what seasons to return, if `TRUE` returns all available data
#'
#' @examples
#' \donttest{
#'   load_snap_counts()
#' }
#'
#' @return A tibble of game-level snap counts provided by Pro Football Reference.
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_snap_counts.html> for the web data dictionary
#' @seealso [`dictionary_snap_counts`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/pfr_scrapR>
#'
#' @export
load_snap_counts <- function(seasons = most_recent_season()){

  if(isTRUE(seasons)) seasons <- 2013:most_recent_season()
  stopifnot(is.numeric(seasons),
            seasons >= 2013,
            seasons <= most_recent_season())

  urls <- paste0("https://github.com/nflverse/nflverse-data/releases/",
                 "download/snap_counts/snap_counts_",
                 seasons,
                 ".rds")

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)
  out <- lapply(urls, progressively(rds_from_url, p))
  out <- rbindlist_with_attrs(out)
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  out
}
