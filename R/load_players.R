#' Load Players
#'
#' @description Load a dataframe of player-level information, including IDs and other mostly-immutable data (birthdates, college, draft position etc.)
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
load_players <- function(){
  out <- rds_from_url("https://github.com/nflverse/nflverse-data/releases/download/players/players.rds")
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  out
}
