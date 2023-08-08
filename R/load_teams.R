#' Load NFL Team Graphics, Colors, and Logos
#'
#' @description Loads team graphics, colors, and logos - useful for plots!
#'
#' @param current If `TRUE` (the default), returns a standardized list of current teams only,
#' with abbreviations as per [nflreadr::team_abbr_mapping].
#' @examples
#' \dontshow{.for_cran()}
#' \donttest{
#' try({ # prevents cran errors
#'   load_teams()
#' })
#' }
#'
#' @return A tibble of team-level image URLs and hex color codes.
#'
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-pbp>
#'
#' @export
load_teams <- function(current = TRUE){
  out <- load_from_url("https://github.com/nflverse/nflverse-pbp/raw/master/teams_colors_logos.rds",
                       nflverse = TRUE,
                       nflverse_type = "team graphics")

  if (isTRUE(current)){
    out <- out[out$team_abbr %in% nflreadr::team_abbr_mapping,]
  }
  out
}
