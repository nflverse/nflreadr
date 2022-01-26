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
rds_from_url <- function(url) {
  cache_message()
  con <- url(url)
  on.exit(close(con))
  load <- try(readRDS(con), silent = TRUE)

  if (inherits(load, "try-error")) {
    warning(paste0("Failed to readRDS from <", url, ">"), call. = FALSE)
    return(data.table::data.table())
  }

  data.table::setDT(load)
  load
}

#' Load .csv / .csv.gz file from a remote connection
#'
#' This is a thin wrapper on data.table::fread, but memoised & cached for twenty four hours.
#'
#' @param ... passed to data.table::fread
#' @inheritDotParams data.table::fread
#'
#' @export
#'
#' @return a dataframe as created by [`data.table::fread()`]
#'
#' @examples
#' \donttest{
#' csv_from_url("https://github.com/nflverse/nfldata/raw/master/data/games.csv")
#' }
csv_from_url <- function(...){
  cache_message()
  data.table::fread(...)
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
  cache_message()
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
  cache_message()
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
#'   lapply(urls, progressively(read.csv, p))
#' }
#'
#' progressr::with_progress(read_rosters())
#' }
#'
#' @return a function that does the same as `f` but it calls `p()` after iteration.
#'
#' @seealso <https://nflreadr.nflverse.com/articles/exporting_nflreadr.html> for vignette on exporting nflreadr in packages
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

cache_message <- function(){
  do_it <- getOption("nflreadr.verbose", default = interactive()) && getOption("nflreadr.cache_warning", default = interactive())
  if (isTRUE(do_it)){
    rlang::inform(
      message = c(
        "Note: nflreadr caches (i.e., stores a saved version) data by default.\nIf you expect different output try one of the following:",
        i = "Restart your R Session or",
        i = "Run `nflreadr::.clear_cache()`.",
        "To disable this warning, run `options(nflreadr.verbose = FALSE)` or add it to your .Rprofile"
      ),
      .frequency = "regularly",
      .frequency_id = "cache_message"
    )
  }
}
