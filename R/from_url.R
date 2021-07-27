#' Load .rds file from a remote connection
#'
#' @param url a character url
#' @param ... for internal usage only
#'
#' @export
#'
#' @examples
#' \donttest{
#' rds_from_url("https://github.com/nflverse/nfldata/blob/master/data/games.rds?raw=true")
#' }
rds_from_url <- function(url, ...){
  dots <- list(...)
  if ("p" %in% names(dots)) p <- dots$p else p <- NULL

  con <- url(url)
  on.exit(close(con))
  load <- try(readRDS(con), silent = TRUE)

  if (!is.null(p) && inherits(p, "progressor") && is_installed("progressr")) p("loading ...")
  if (inherits(load, "try-error")) return(data.frame())

  load
}

#' Load raw filedata from a remote connection
#'
#' @param url a character url
#' @param ... for internal usage only
#'
#' @export
#'
#' @examples
#' \donttest{
#' raw_from_url(
#' "https://github.com/nflverse/nflfastR-data/raw/master/data/play_by_play_2020.parquet"
#' )
#' }
raw_from_url <- function(url, ...){
  dots <- list(...)
  if ("p" %in% names(dots)) p <- dots$p else p <- NULL

  load <- try(curl::curl_fetch_memory(url), silent = TRUE)

  if (!is.null(p) && inherits(p, "progressor") && is_installed("progressr")) p("loading ...")
  if (inherits(load, "try-error")) return(data.frame())

  load$content
}

#' Load .qs file from a remote connection
#'
#' @param url a character url
#' @param ... for internal usage only
#'
#' @export
#'
#' @examples
#' \donttest{
#' qs_from_url(
#' "https://github.com/nflverse/nflfastR-data/raw/master/data/play_by_play_2020.qs"
#' )
#' }
qs_from_url <- function(url, ...){
  dots <- list(...)
  if ("p" %in% names(dots)) p <- dots$p else p <- NULL
  load <- try(curl::curl_fetch_memory(url), silent = TRUE)
  if (!is.null(p) && inherits(p, "progressor") && is_installed("progressr")) p("loading ...")
  if (inherits(load, "try-error")) return(data.frame())
  qs::qdeserialize(load$content)
}
