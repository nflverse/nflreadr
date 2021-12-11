#' Load Fantasy Player IDs
#'
#' Accesses DynastyProcess.com's database of fantasy football player IDs, which help connect nflverse to various other platforms and IDs.
#'
#' @return a dataframe of player IDs
#'
#' @examples
#' \donttest{
#' load_ff_playerids()
#' }
#'
#' @seealso Issues with this data should be filed here: <https://github.com/dynastyprocess/data>
#'
#' @export
load_ff_playerids <- function() {
  out <- rds_from_url("https://github.com/dynastyprocess/data/raw/master/files/db_playerids.rds")
  class(out) <- c("tbl_df","tbl","data.table","data.frame")
  out
}

#' Load Latest FantasyPros Rankings
#'
#' Accesses DynastyProcess.com's repository of the latest FP expert consensus rankings - updated on a weekly basis.
#'
#' @param type one of "draft" (preseason), "week" (this week, inseason), or "all" (full archive)
#'
#' @return a dataframe of expert consensus rankings
#'
#' @examples
#' \donttest{
#' load_ff_rankings()
#' }
#'
#' @seealso Issues with this data should be filed here: <https://github.com/dynastyprocess/data>
#' @seealso <https://www.fantasypros.com>
#'
#' @export
load_ff_rankings <- function(type = c("draft", "week", "all")){

  type <- rlang::arg_match0(type, c("draft","week", "all"))

  url <- switch(
    type,
    draft = "https://github.com/dynastyprocess/data/raw/master/files/db_fpecr_latest.rds",
    week = "https://github.com/dynastyprocess/data/raw/master/files/fp_latest_weekly.rds",
    all = "https://github.com/dynastyprocess/data/master/files/db_fpecr.rds"
  )

  out <- rds_from_url(url)
  class(out) <- c("tbl_df","tbl","data.table","data.frame")
  out
}
