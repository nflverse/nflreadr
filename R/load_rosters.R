#' Load Rosters
#'
#' @param seasons a numeric vector of seasons to return, defaults to returning
#' this year's data if it is March or later. If set to `TRUE`, will return all available data.
#'
#' @examples
#' \donttest{
#'   load_rosters(2020)
#' }
#'
#' @return A tibble of season-level roster data.
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_rosters.html> for a web version of the data dictionary
#' @seealso [`dictionary_rosters`] for the data dictionary as a dataframe
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-data>
#'
#' @export
load_rosters <- function(seasons = most_recent_season(roster = TRUE)){

  current_year <- most_recent_season(roster = TRUE)
  if(isTRUE(seasons)) seasons <- 1999:current_year
  stopifnot(is.numeric(seasons),
            seasons >= 1999,
            seasons <= current_year)

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = seasons)

  urls <- paste0("https://github.com/nflverse/nflverse-data/releases/download/rosters/roster_",
                 seasons, ".rds")

  out <- lapply(urls, progressively(rds_from_url, p))
  out <- rbindlist_with_attrs(out)
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  out
}
