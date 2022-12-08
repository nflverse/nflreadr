#' Load Fantasy Player IDs
#'
#' Accesses DynastyProcess.com's database of fantasy football player IDs, which help connect nflverse to various other platforms and IDs.
#'
#' @return a dataframe of player IDs
#'
#' @examples
#' \donttest{
#' try({ # prevents cran errors
#' load_ff_playerids()
#' })
#' }
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_ff_playerids.html> for the web data dictionary
#' @seealso Issues with this data should be filed here: <https://github.com/dynastyprocess/data>
#'
#' @export
load_ff_playerids <- function() {
  out <- load_from_url("https://github.com/dynastyprocess/data/raw/master/files/db_playerids.rds",
                       nflverse = TRUE,
                       nflverse_type = "(ffverse) player IDs")
  return(out)
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
#' try({ # prevents cran errors
#' load_ff_rankings()
#' })
#' }
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_ff_rankings.html> for the web data dictionary
#' @seealso <https://www.fantasypros.com> for the source of data
#' @seealso Issues with this data should be filed here: <https://github.com/dynastyprocess/data>
#'
#' @export
load_ff_rankings <- function(type = c("draft", "week", "all")){

  type <- rlang::arg_match0(type, c("draft","week", "all"))

  url <- switch(
    type,
    draft = "https://github.com/dynastyprocess/data/raw/master/files/db_fpecr_latest.rds",
    week = "https://github.com/dynastyprocess/data/raw/master/files/fp_latest_weekly.rds",
    all = "https://github.com/dynastyprocess/data/raw/master/files/db_fpecr.rds"
  )

  out <- load_from_url(url, nflverse = TRUE, nflverse_type = "FP expert rankings")
  return(out)
}

#' Load Expected Fantasy Points
#'
#' This function downloads precomputed expected points data from [{ffopportunity}](https://ffopportunity.ffverse.com) automated releases.
#'
#' @param seasons a numeric vector of seasons to return, defaults to most recent season. If set to `TRUE`, returns all available data.
#' @param stat_type one of `"weekly"`, `"pbp_pass"`, `"pbp_rush"`
#' @param model_version one of `"latest"` or `"v1.0.0"`
#'
#' @examples
#' \donttest{
#'   try({ # prevents cran errors
#'   load_ff_opportunity()
#'   load_ff_opportunity(seasons = 2021, stat_type = "pbp_pass", model_version = "v1.0.0")
#'   })
#' }
#'
#' @return Precomputed expected fantasy points data from the ffopportunity automated releases.
#'
#' @seealso <https://ffopportunity.ffverse.com> for more on the package, data, and modelling
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_ff_opportunity.html> for the web data dictionary
#' @seealso [`dictionary_ff_opportunity`] for the data dictionary bundled as a package data frame
#' @seealso Issues with this data should be filed here: <https://github.com/ffverse/ffopportunity>
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

  urls <- glue::glue("https://github.com/ffverse/ffopportunity/releases/download/{model_version}-data/ep_{stat_type}_{seasons}.rds")

  out <- load_from_url(urls, nflverse = TRUE, nflverse_type = glue::glue("ffopportunity expected points: {stat_type}"))
  return(out)
}
