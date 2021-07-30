#' Data Dictionary: Play by Play
#'
#' A dataframe containing the data dictionary for `load_pbp()`
#'
#' @seealso `vignette("Data Dictionary - PBP")`
"dictionary_pbp"

#' Data Dictionary: Player Stats
#'
#' A dataframe containing the data dictionary for `load_player_stats()`
#'
#' @seealso `vignette("Data Dictionary - Player Stats")`
"dictionary_player_stats"

#' Data Dictionary: Fantasy Player IDs
#'
#' A dataframe containing the data dictionary for `load_ff_playerids()`
#'
#' @seealso `vignette("Data Dictionary - FF Player IDs")`
"dictionary_ff_playerids"

#' Data Dictionary: Rosters
#'
#' A dataframe containing the data dictionary for `load_rosters()`
#'
#' @seealso `vignette("Data Dictionary - Rosters")`
"dictionary_rosters"

#' Data Dictionary: Schedules
#'
#' A dataframe containing the data dictionary for `load_schedules()`
#'
#' @seealso `vignette("Data Dictionary - Schedules")`
"dictionary_schedules"

#' NFL Team names, colors and logo urls.
#'
#' @docType data
#' @format A data frame with 36 rows and 14 variables containing NFL team level
#' information, including franchises in multiple cities.
#' The colors are taken from Lee Sharpe's teamcolors.csv who has taken them from the
#' `teamcolors` package created by Ben Baumer and Gregory Matthews.
#' The Wikipeadia logo urls are taken from Lee Sharpe's logos.csv
#' Team wordmarks from nfl.com
#' @seealso `vignette("Data Dictionary - Teams Colors Logos")`
#' @examples
#' \donttest{
#' teams_colors_logos
#' }
"teams_colors_logos"
