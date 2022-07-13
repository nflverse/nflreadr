#' Load Trades
#'
#' This returns a table of historical trades as maintained by Lee Sharpe.
#'
#' @param seasons a numeric vector of seasons to return, default `TRUE` returns all available data.
#'
#' @return A tibble of game information for past and/or future games.
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_trades.html> for a web version of the dictionary
#' @seealso [`dictionary_trades`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nfldata>
#'
#' @examples
#' \donttest{
#'  load_trades(2020)
#' }
#'
#' @export
load_trades <- function(seasons = TRUE){

  if(!isTRUE(seasons)) stopifnot(is.numeric(seasons))

  out <- load_from_url("https://github.com/nflverse/nfldata/raw/master/data/trades.rds",
                       seasons = seasons,
                       nflverse = TRUE,
                       nflverse_type = "trades (via PFR / Lee Sharpe)")

  return(out)
}
