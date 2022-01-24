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

#' Load Expected Fantasy Points
#'
#' This function downloads precomputed expected points data from the ffopportunity automated releases.
#'
#' @param seasons a numeric vector of seasons to return, defaults to most recent season. If set to `TRUE`, returns all available data.
#' @param stat_type one of `"weekly"`, `"pbp_pass"`, `"pbp_rush"`
#' @param model_version one of `"latest"` or `"v1.0.0"`
#'
#' @examples
#' \donttest{
#'   try({
#'   load_ff_opportunity()
#'   load_ff_opportunity(seasons = 2021, type = "pbp_pass", version = "v1.0.0")
#'   })
#' }
#'
#' @return Precomputed expected fantasy points data from the ffopportunity automated releases.
#'
#' @seealso <https://ffopportunity.ffverse.com> for more on the package, data, and modelling
#' @seealso TODO {data dictionary}
#'
#' @export
load_ff_opportunity <- function(seasons = most_recent_season(),
                                stat_type = c("weekly","pbp_pass","pbp_rush"),
                                model_version = c("latest","v1.0.0")
                                ){

  if(isTRUE(seasons)) seasons <- 2006:most_recent_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2006,
            seasons <= most_recent_season())

  stat_type <- rlang::arg_match0(stat_type, c("weekly","pbp_pass","pbp_rush"))
  model_version <- rlang::arg_match0(model_version, c("latest","v1.0.0"))

  urls <- paste0(
    "https://github.com/ffverse/ffopportunity/releases/download/",
    paste0(model_version,"-data/ep_"), stat_type, "_", seasons, ".rds")

  p <- NULL
  if (is_installed("progressr")) p <- progressr::progressor(along = urls)

  out <- lapply(urls, progressively(rds_from_url, p))
  out <- data.table::rbindlist(out, use.names = TRUE)
  class(out) <- c("tbl_df","tbl","data.table","data.frame")
  out
}
