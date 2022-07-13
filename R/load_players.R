#' Load Players
#'
#' @description Load a dataframe of player-level information, including IDs and other mostly-immutable data (birthdates, college, draft position etc.)
#' @param file_type One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @examples
#' \donttest{
#' try({ # prevents cran errors
#'   load_players()
#' })
#' }
#'
#' @return A tibble with one row per player.
#'
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflreadr> and it will be triaged appropriately.
#'
#' @export
load_players <- function(file_type = getOption("nflreadr.prefer", default = "rds")){
  file_type <- rlang::arg_match0(file_type, c("rds", "csv", "parquet", "qs"))
  url <- glue::glue("https://github.com/nflverse/nflverse-data/releases/download/players/players.{file_type}")
  out <- load_from_url(url, nflverse = TRUE)
  out
}
