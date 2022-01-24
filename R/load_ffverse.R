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
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_ff_playerids.html> for the web data dictionary
#' @seealso <https://github.com/dynastyprocess/data> for where the data currently lives
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
#' @param type one of "draft" or "week", for preseason or inseason-weekly rankings
#'
#' @return a dataframe of expert consensus rankings
#'
#' @examples
#' \donttest{
#' load_ff_rankings()
#' }
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_ff_rankings.html> for the web data dictionary
#' @seealso <https://github.com/dynastyprocess/data> for where the data currently lives
#' @seealso <https://www.fantasypros.com> for the source of data
#'
#' @export
load_ff_rankings <- function(type = c("draft","week")){

  type <- rlang::arg_match0(type, c("draft","week"))

  url <- switch(
    type,
    draft = "https://github.com/dynastyprocess/data/raw/master/files/db_fpecr_latest.rds",
    week = "https://github.com/dynastyprocess/data/raw/master/files/fp_latest_weekly.rds"
  )

  out <- rds_from_url(url)
  class(out) <- c("tbl_df","tbl","data.table","data.frame")
  out
}

