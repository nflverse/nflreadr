#' Load Player Level Weekly NFL Next Gen Stats
#'
#' @description Loads player level weekly stats provided by NFL Next Gen Stats
#' starting with the 2016 season. Three different stat types are available and
#' the current season's data updates every night. NGS will only provide data for
#' players above a minimum number of pass/rush/rec attempts.
#'
#' @param seasons a numeric vector specifying what seasons to return, if `TRUE` returns all available data
#' @param stat_type one of `"passing"`, `"receiving"`, or `"rushing"`
#' @param file_type One of `"rds"` or `"qs"`. Can also be set globally with options(nflreadr.prefer)
#'
#' @examples
#' \donttest{
#' try({ # prevents cran errors
#'   load_nextgen_stats(stat_type = "passing")
#'   load_nextgen_stats(stat_type = "receiving")
#'   load_nextgen_stats(stat_type = "rushing")
#' })
#' }
#'
#' @return A tibble of week-level player statistics provided by NFL Next Gen Stats.
#' Regular season summary is given for `week == 0`.
#'
#' @seealso <https://nextgenstats.nfl.com/stats/passing> for `stat_type = "passing"`
#' @seealso <https://nextgenstats.nfl.com/stats/receiving> for `stat_type = "receiving"`
#' @seealso <https://nextgenstats.nfl.com/stats/rushing> for `stat_type = "rushing"`
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_nextgen_stats.html> for a web version of the data dictionary
#' @seealso [`dictionary_nextgen_stats`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-data>
#'
#' @export
load_nextgen_stats <- function(seasons = TRUE,
                               stat_type = c("passing", "receiving", "rushing"),
                               file_type = getOption("nflreadr.prefer", default = "rds")){

  if(!isTRUE(seasons)) {
    stopifnot(is.numeric(seasons),
              seasons >= 2016,
              seasons <= most_recent_season())
  }

  file_type <- rlang::arg_match0(file_type, c("rds", "qs", "parquet", "csv"))
  stat_type <- rlang::arg_match0(stat_type, c("passing", "receiving", "rushing"))
  loader <- choose_loader(file_type)
  url <- paste0("https://github.com/nflverse/nflverse-data/releases/download/",
                "nextgen_stats/ngs_", stat_type, ".", file_type)
  out <- loader(url)
  if(!isTRUE(seasons)) out <- out[out$season %in% seasons]
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  out
}
