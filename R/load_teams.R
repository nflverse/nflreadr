#' Load NFL Team Graphics, Colors, and Logos
#'
#' @description Loads team graphics, colors, and logos - useful for plots!
#'
#' @param current If `TRUE` (the default), returns a standardized list of current teams only,
#' with abbreviations as per [nflreadr::team_abbr_mapping].
#' @param file_type One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
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
load_teams <- function(
  current = TRUE,
  file_type = getOption("nflreadr.prefer", default = "rds")
) {
  file_type <- rlang::arg_match0(file_type, c("rds", "qs", "csv", "parquet"))

  urls <- paste0(
    "https://github.com/nflverse/nflverse-data/releases/download/teams/",
    "teams_colors_logos.",
    file_type
  )

  out <- load_from_url(urls, nflverse = TRUE)

  if (isTRUE(current)) {
    out <- out[out$team_abbr %in% nflreadr::team_abbr_mapping, ]
  }
  out
}
