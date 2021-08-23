#' Load .rds file from a remote connection
#'
#' @param url a character url
#'
#' @export
#'
#' @return a dataframe as created by [`readRDS()`]
#'
#' @examples
#' \donttest{
#' rds_from_url("https://github.com/nflverse/nfldata/raw/master/data/games.rds")
#' }
rds_from_url <- function(url){
  con <- url(url)
  on.exit(close(con))
  load <- try(readRDS(con), silent = TRUE)

  if (inherits(load, "try-error")) {
    warning(paste0("Failed to readRDS from <",url,">"), call. = FALSE)
    return(data.frame())
  }

  data.table::setDT(load)
  load
}

#' Load raw filedata from a remote connection
#'
#' This function allows you to retrieve data from a URL into raw format, which
#' can then be passed into the appropriate file-reading function, such as `arrow::read_parquet()`
#'
#' @param url a character url
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
raw_from_url <- function(url){
  load <- try(curl::curl_fetch_memory(url), silent = TRUE)

  if (load$status_code!=200) {
    warning(paste0("HTTP error",load$status_code," while retrieving data from <",url,"> \n Returning request payload."), call. = FALSE)
    return(load)
  }

  load$content
}

#' Load .qs file from a remote connection
#'
#' @param url a character url
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
qs_from_url <- function(url){
  load <- try(curl::curl_fetch_memory(url), silent = TRUE)


  if (inherits(load, "try-error")) {
    warning(paste0("Failed to retrieve data from <",url,">"), call. = FALSE)
    return(data.table::data.table())
  }

  content <- try(qs::qdeserialize(load$content), silent = TRUE)

  if (inherits(content, "try-error")) {
    warning(paste0("Failed to parse file with qs::qdeserialize() from <",url,">"), call. = FALSE)
    return(data.table::data.table())
  }

  data.table::setDT(content)
  return(content)
}

#' Progressively
#'
#' This function helps add progress-reporting to any function - given function `f()` and progressor `p()`, it will return a new function that calls `f()` and then (on-exiting) will call `p()` after every iteration.
#'
#' This is inspired by purrr's `safely`, `quietly`, and `possibly` function decorators.
#'
#' @param f a function to add progressr functionality to.
#' @param p a progressor function as created by `progressr::progressor()`
#'
#' @examples
#'
#' \donttest{
#' read_rosters <- function(){
#'   urls <- c("https://github.com/nflverse/nflfastR-roster/raw/master/data/seasons/roster_2020.csv",
#'             "https://github.com/nflverse/nflfastR-roster/raw/master/data/seasons/roster_2021.csv")
#'
#'   p <- progressr::progressor(along = urls)
#'   purrr::map_dfr(urls, progressively(read.csv, p))
#' }
#'
#' progressr::with_progress(read_rosters())
#' }
#'
#' @return a function that does the same as `f` but it calls `p()` after iteration.
#'
#' @seealso `vignette("Using nflreadr in packages")`
#' @seealso <https://nflreadr.nflverse.com/articles/exporting_nflreadr.html> for web version of vignette
#'
#' @export
progressively <- function(f, p = NULL){
  if(!is.null(p) && !inherits(p, "progressor")) stop("`p` must be a progressor function!")
  if(is.null(p)) p <- function(...) NULL
  force(f)

  function(...){
    on.exit(p("loading..."))
    f(...)
  }

}
