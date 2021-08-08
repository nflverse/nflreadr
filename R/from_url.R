#' Load .rds file from a remote connection
#'
#' @param url a character url
#' @param ... for internal usage only
#'
#' @export
#'
#' @return a dataframe as created by [`readRDS()`]
#'
#' @examples
#' \donttest{
#' rds_from_url("https://github.com/nflverse/nfldata/raw/master/data/games.rds")
#' }
rds_from_url <- function(url, ...){
  dots <- list(...)
  if ("p" %in% names(dots)) p <- dots$p else p <- NULL

  con <- url(url)
  on.exit(close(con))
  load <- try(readRDS(con), silent = TRUE)

  if (!is.null(p) && inherits(p, "progressor") && is_installed("progressr")) p("loading ...")
  if (inherits(load, "try-error")) {
    warning(paste0("Failed to readRDS from <",url,">"), call. = FALSE)
    return(data.frame())
  }

  load
}

#' Load raw filedata from a remote connection
#'
#' This function allows you to retrieve data from a URL into raw format, which
#' can then be passed into the appropriate file-reading function, such as `arrow::read_parquet()`
#'
#' @param url a character url
#' @param ... for internal usage only
#'
#' @export
#'
#' @return a raw vector
#'
#' @examples
#' \donttest{
#' head(raw_from_url(
#'   "https://github.com/nflverse/nflfastR-data/raw/master/data/play_by_play_2020.parquet"
#'   ),
#' 50)
#' }
raw_from_url <- function(url, ...){
  dots <- list(...)
  if ("p" %in% names(dots)) p <- dots$p else p <- NULL

  load <- try(curl::curl_fetch_memory(url), silent = TRUE)

  if (!is.null(p) && inherits(p, "progressor") && is_installed("progressr")) p("loading ...")

  if (load$status_code!=200) {
    warning(paste0("HTTP error",load$status_code," while retrieving data from <",url,"> \n Returning request payload."), call. = FALSE)
    return(load)
  }

  load$content
}

#' Load .qs file from a remote connection
#'
#' @param url a character url
#' @param ... for internal usage only
#'
#' @export
#'
#' @return a dataframe as parsed by [`qs::qdeserialize()`]
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

  if (inherits(load, "try-error")) {
    warning(paste0("Failed to retrieve data from <",url,">"), call. = FALSE)
    return(data.frame())
  }
  content <- try(qs::qdeserialize(load$content), silent = TRUE)

  if (inherits(content, "try-error")) {
    warning(paste0("Failed to parse file with qs::qdeserialize() from <",url,">"), call. = FALSE)
    return(data.frame())
  }

  return(content)
}
