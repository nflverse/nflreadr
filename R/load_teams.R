#' Load NFL Team Graphics, Colors, and Logos
#'
#' @description Loads team graphics, colors, and logos - useful for plots!
#'
#' @examples
#' \donttest{
#' try({ # prevents cran errors
#'   load_teams()
#' })
#' }
#'
#' @return A tibble of team-level image URLs and hex color codes.
#'
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflfastR-data>
#'
#' @export
load_teams <- function(){
  out <- load_from_url("https://github.com/nflverse/nflfastR-data/raw/master/teams_colors_logos.rds",
                       nflverse = TRUE,
                       nflverse_type = "team graphics")
  out
}
