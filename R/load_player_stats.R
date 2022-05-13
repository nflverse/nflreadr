#' Load Player Level Weekly Stats
#'
#' @param seasons a numeric vector of seasons to return, defaults to most recent season. If set to `TRUE`, returns all available data.
#' @param stat_type one of `offense` or `kicking`
#' @param file_type One of `"rds"` or `"qs"`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @examples
#' \donttest{
#' try({ # prevents cran errors
#'   load_player_stats()
#'   load_player_stats(stat_type = "kicking")
#' })
#' }
#'
#' @return A tibble of week-level player statistics that aims to match NFL official box scores.
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_player_stats.html> for a web version of the data dictionary
#' @seealso [`dictionary_player_stats`] for the data dictionary
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflfastR-data>
#'
#' @export
load_player_stats <- function(seasons = most_recent_season(),
                              stat_type = c("offense","kicking"), # defense, punting, other as added
                              file_type = getOption("nflreadr.prefer", default = "rds")){

  if(!isTRUE(seasons)) {stopifnot(is.numeric(seasons),
                                  seasons >=1999,
                                  seasons <= most_recent_season())}

  file_type <- rlang::arg_match0(file_type, c("rds", "qs"))
  stat_type <- rlang::arg_match0(stat_type, c("offense","kicking"))

  base_name <- switch(stat_type,
                      "offense" = "player_stats.",
                      "kicking" = "player_stats_kicking.")

  loader <- choose_loader(file_type)

  url <- paste0("https://github.com/nflverse/nflverse-data/releases/download/player_stats/",base_name,file_type)

  out <- loader(url)
  if(!isTRUE(seasons)) out <- out[out$season %in% seasons]
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  out
}

# Load Team Level Weekly Stats
#
# @param seasons a numeric vector of seasons to return
# @param type one of `offense`, `defense`, or `special_teams`
#
# @examples
# \donttest{
#   load_team_stats()
# }
#
# @return
#
# @export
# load_team_stats <- function(){}
