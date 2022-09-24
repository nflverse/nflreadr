#' Load Play By Play
#'
#' @description Loads play by play seasons from the [nflverse-data repository](https://github.com/nflverse/nflverse-data)
#'
#' @param seasons A numeric vector of 4-digit years associated with given NFL seasons - defaults to latest season. If set to `TRUE`, returns all available data since 1999.
#' @param file_type One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @return The complete nflfastR dataset as returned by `nflfastR::build_nflfastR_pbp()`
#' (see below) for all given `seasons`
#'
#' @examples
#' \donttest{
#' try({ # prevents cran errors
#'   load_pbp(2019:2020)
#' })
#' }
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_pbp.html> for a web version of the data dictionary
#' @seealso [`dictionary_pbp`] for the data dictionary bundled as a package dataframe
#' @seealso <https://www.nflfastr.com/reference/build_nflfastR_pbp.html> for the nflfastR function `nflfastR::build_nflfastR_pbp()`
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-pbp>
#'
#' @export
load_pbp <- function(seasons = most_recent_season(), file_type = getOption("nflreadr.prefer", default = "rds")) {

  file_type <- rlang::arg_match0(file_type, c("rds", "qs", "csv", "parquet"))

  if(isTRUE(seasons)) seasons <- 1999:most_recent_season()

  stopifnot(is.numeric(seasons),
            seasons >=1999,
            seasons <= most_recent_season())

  urls <- paste0("https://github.com/nflverse/nflverse-data/releases/download/pbp/play_by_play_",
                 seasons, ".", file_type)

  out <- load_from_url(urls,nflverse = TRUE, seasons = seasons)

  return(out)
}
