#' Load Players
#'
#' @description Load a dataframe of player-level information, including IDs and other mostly-immutable data (birthdates, college, draft position etc.)
#' @param file_type One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @examples
#' \dontshow{.for_cran()}
#' \donttest{
#' try({ # prevents cran errors
#'   load_players()
#' })
#' }
#'
#' @return A tibble with one row per player.
#'
#' @details
#'
#' ## Contribute
#'
#' Please visit <https://github.com/nflverse/nflverse-players/blob/master/.github/CONTRIBUTING.md>
#' for a detailed explanation how to contribute (or correct) players data.
#'
#' ## Scope of Players Dataset
#'
#' The nflverse players dataset aims to be the single source of truth when it
#' comes to NFL player IDs across various sources (relevant to the nflverse).
#' The following source IDs and information are considered in-scope of the
#' nflverse players dataset:
#'
#' - Basic player information e.g. name, height, weight, age, date of birth,
#' years experience, college, status, position, headshot image (mostly from GSIS)
#' - Draft information: draft year, draft round, draft pick, draft team (from PFR)
#' - PFF position and status information
#' - Primary source IDs from:
#'   - NFL (`gsis_id`, `smart_id`) - `gsis_id` is the primary key
#'   - Pro Football Reference (`pfr_id`)
#'   - Pro Football Focus (`pff_id`)
#'   - Over The Cap (`otc_id`)
#'   - Elias Sports Bureau (`esb_id`)
#'   - ESPN (`espn_id`)
#'
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-players>.
#' @seealso [`dictionary_players`] for the data dictionary as bundled within the package
#'
#' @export
load_players <- function(file_type = getOption("nflreadr.prefer", default = "rds")){
  file_type <- rlang::arg_match0(file_type, c("rds", "csv", "parquet", "qs"))
  url <- glue::glue("https://github.com/nflverse/nflverse-data/releases/download/players/players.{file_type}")
  out <- load_from_url(url, nflverse = TRUE)
  out
}
