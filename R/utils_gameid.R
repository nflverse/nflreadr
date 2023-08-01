#' Compute nflverse Game Identifiers
#'
#' @param season 4 digit season between 1999 and the output of [most_recent_season()]
#' @param week Numeric or character giving the week, between 1 and 22.
#' @param home,away Valid NFL team abbreviation as it can be found in [team_abbr_mapping]
#'
#' @return A character vector
#' @export
#'
#' @examples
#' nflverse_game_id(2022, 2, "LAC", "KC")
nflverse_game_id <- function(season,
                             week,
                             away,
                             home){
  # catch character input of season and week
  season <- as.numeric(season)
  week <- as.numeric(week)

  if (!all(season %in% 1999:most_recent_season(roster = TRUE))){
    cli::cli_abort("{.arg season} must be between 1999 and {most_recent_season(roster = TRUE)}")
  }

  if (!all(week %in% 1:22)){
    cli::cli_abort("{.arg week} must be between 1 and 22")
  }

  valid_names <- names(nflreadr::team_abbr_mapping_norelocate)

  if (!all(home %in% valid_names)) {
    invalid <- unique(home[!home %in% valid_names])
    cli::cli_abort("{.val {invalid}} {?is an/are} invalid {.arg home} abbreviation{?s}.")
  }

  if (!all(away %in% valid_names)) {
    invalid <- unique(away[!away %in% valid_names])
    cli::cli_abort("{.val {invalid}} {?is an/are} invalid {.arg away} abbreviation{?s}.")
  }

  away <- clean_team_abbrs(away, current_location = FALSE)
  home <- clean_team_abbrs(home, current_location = FALSE)

  arg_lengths <- lengths(list(season, week, away, home))

  if (!all(arg_lengths %in% c(1, max(arg_lengths)))){
    cli::cli_warn("Arguments should be of of length one or of length {max(arg_lengths)}. Recycling may produce unexpected results.")
  }

  paste(
    season,
    formatC(week, width = 2, flag = "0"),
    away,
    home,
    sep = "_"
  )
}
