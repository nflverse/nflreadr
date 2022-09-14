#' Compute nflverse Game Identifiers
#'
#' @param season 4 digit season between 1999 and the output of [most_recent_season()]
#' @param week Numeric or character giving the week, bewtween 1 and 22.
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

  if (!all(season %in% 1999:most_recent_season())){
    cli::cli_abort("{.arg season} must be between 1999 and {most_recent_season()}")
  }

  if (!all(week %in% 1:22)){
    cli::cli_abort("{.arg week} must be between 1 and 22")
  }

  if (!all(home %in% team_abbr_mapping)){
    cli::cli_abort("{.val {home}} is not a valid {.arg home} abbreviation.")
  }

  if (!all(away %in% team_abbr_mapping)){
    cli::cli_abort("{.val {away}} is not a valid {.arg away} abbreviation.")
  }

  # This could be used to require equal length of input vectors but it
  # wouldn't allow recycling of single values. So I keep it commented for now

  # if (lengths(list(season, week, away, home)) |> unique() |> length() > 1){
  #   cli::cli_abort("All arguments are required same length.")
  # }

  paste(
    season,
    formatC(week, width = 2, flag = "0"),
    away,
    home,
    sep = "_"
  )
}
