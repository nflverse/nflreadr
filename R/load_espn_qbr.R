#' Load ESPN's QBR
#'
#' @param league One of "nfl" or "college", defaults to "nfl"
#' @param seasons a numeric vector of seasons to return, data available since 2006. Defaults to latest season available. TRUE will select all seasons.
#' @param summary_type One of "season" or "weekly", defaults to season
#'
#' @examples
#' \donttest{
#'     load_espn_qbr("nfl",2020)
#' }
#'
#' @return a tibble of season-level injury report data.
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_espn_qbr.html> for a web version of the dictionary
#' @seealso [`dictionary_espn_qbr`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/espnscrapeR-data>
#'
#' @export
load_espn_qbr <- function(league = c("nfl", "college"),
                          seasons = most_recent_season(),
                          summary_type = c("season","weekly")
){

  league <- rlang::arg_match0(league, c("nfl","college"))
  summary_type <- rlang::arg_match0(summary_type, c("season","weekly"))
  if(!isTRUE(seasons)) {
    stopifnot(is.numeric(seasons),
              seasons >= 2006,
              seasons <= most_recent_season())
  }


  url <- paste0("https://github.com/nflverse/espnscrapeR-data/raw/master/data/qbr-",
                league,
                "-",
                summary_type,
                ".rds")

  out <- rds_from_url(url)
  if(!isTRUE(seasons)) out <- out[out$season %in% seasons]
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  attr(out,"nflverse_type") <- "QBR (via ESPN)"
  out
}
