#' Load .rds file from a remote connection
#'
#' @param url a character url
#' @param ... for internal usage only
#'
#' @return
#' @export
#'
#' @examples
#' rds_from_url("https://github.com/nflverse/nfldata/blob/master/data/games.rds?raw=true")
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
#' @return
#' @export
#'
#' @examples
#' parquet_from_url("https://github.com/nflverse/nflfastR-data/blob/master/data/play_by_play_2020.parquet?raw=true")
raw_from_url <- function(url, ...){
  dots <- list(...)
  if ("p" %in% names(dots)) p <- dots$p else p <- NULL

  if (!all(is_installed("arrow"), is_installed("curl"))){
    cli::cli_abort("Packages {.code arrow} and {.code curl} required to run this function. Please install them.")
  }

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
#' @return
#' @export
#'
#' @examples
#' qs_from_url("https://github.com/nflverse/nflfastR-data/blob/master/data/play_by_play_2020.qs?raw=true")
qs_from_url <- function(url, ...){
  dots <- list(...)
  if ("p" %in% names(dots)) p <- dots$p else p <- NULL
  if (!all(is_installed("qs"), is_installed("curl"))){
    cli::cli_abort("Packages {.code qs} and {.code curl} required to run this function. Please install them.")
  }
  load <- try(curl::curl_fetch_memory(url), silent = TRUE)
  if (!is.null(p) && inherits(p, "progressor") && is_installed("progressr")) p("loading ...")
  if (inherits(load, "try-error")) return(data.frame())
  qs::qdeserialize(load$content)
}
