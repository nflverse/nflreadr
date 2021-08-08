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
#' @seealso <https://github.com/dynastyprocess/data>
#' @seealso [`ffscrapr::dp_playerids()`]
#'
#' @export
load_ff_playerids <- function() {
  out <- rds_from_url("https://github.com/dynastyprocess/data/raw/master/files/db_playerids.rds")
  class(out) <- c("tbl_df","tbl","data.frame")
  out
}

#' Load Latest FantasyPros Rankings
#'
#' Accesses DynastyProcess.com's repository of the latest FP expert consensus rankings - updated on a weekly basis.
#'
#' @return a dataframe of expert consensus rankings
#'
#' @examples
#' \donttest{
#' load_ff_rankings()
#' }
#'
#' @seealso <https://www.github.com/dynastyprocess/data>
#' @seealso <https://www.fantasypros.com>
#'
#' @export
load_ff_rankings <- function(){
  out <- rds_from_url("https://github.com/dynastyprocess/data/raw/master/files/db_fpecr_latest.rds")
  class(out) <- c("tbl_df","tbl","data.frame")
  out
}
