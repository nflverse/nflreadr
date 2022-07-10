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
#' try({ # prevents cran errors
#'   rds_from_url("https://github.com/nflverse/nfldata/raw/master/data/games.rds")
#' })
#' }
rds_from_url <- function(url) {
  cache_message()
  con <- url(url)
  on.exit(close(con))
  load <- try(readRDS(con), silent = TRUE)

  if (inherits(load, "try-error")) {
    cli::cli_warn("Failed to readRDS from {.url {url}}")
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
#' try({ # prevents cran errors
#'   csv_from_url("https://github.com/nflverse/nfldata/raw/master/data/games.csv")
#' })
#' }
csv_from_url <- function(...){
  cache_message()
  data.table::fread(...)
}

#' Load raw filedata from a remote connection
#'
#' This function allows you to retrieve data from a URL into raw format, which
#' can then be passed into the appropriate file-reading function. Data is memoised/cached for 24 hours.
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
#'   "https://github.com/nflverse/nflverse-data/releases/download/player_stats/player_stats.parquet"
#'   ),
#' 50)
#' }
raw_from_url <- function(url){
  cache_message()
  load <- try(curl::curl_fetch_memory(url), silent = TRUE)

  if(inherits(load, "try-error")) {
    cli::cli_warn("Failed to retrieve data from {.url {url}}")
    return(invisible(load))
  }

  if (load$status_code!=200) {
    cli::cli_warn("HTTP error {.emph {load$status_code}} while retrieving data from {.url {url}}\nReturning request payload.")
    return(invisible(load))
  }

  load$content
}

#' Load .parquet file from a remote connection
#'
#' Retrieves a parquet file from URL. This function is cached
#'
#' @param url a character url
#'
#' @export
#'
#' @return a dataframe as parsed by [`arrow::read_parquet()`]
#'
#' @examples
#' \donttest{
#' try({
#'   parquet_from_url(
#'     "https://github.com/nflverse/nflverse-data/releases/download/player_stats/player_stats.parquet"
#'   )
#' })
#' }
parquet_from_url <- function(url){
  rlang::check_installed("arrow")
  cache_message()
  load <- try(curl::curl_fetch_memory(url), silent = TRUE)

  if (inherits(load, "try-error")) {
    cli::cli_warn("Failed to retrieve data from {.url {url}}")
    return(data.table::data.table())
  }

  content <- try(arrow::read_parquet(load$content), silent = TRUE)

  if (inherits(content, "try-error")) {
    cli::cli_warn("Failed to parse file with {.fun arrow::read_parquet()} from {.url {url}}")
    return(data.table::data.table())
  }

  data.table::setDT(content)
  return(content)
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
#' try({
#'   qs_from_url(
#'     "https://github.com/nflverse/nflverse-data/releases/download/player_stats/player_stats.qs"
#'   )
#' })
#' }
qs_from_url <- function(url){
  rlang::check_installed("qs")
  cache_message()
  load <- try(curl::curl_fetch_memory(url), silent = TRUE)

  if (inherits(load, "try-error")) {
    cli::cli_warn("Failed to retrieve data from {.url {url}}")
    return(data.table::data.table())
  }

  content <- try(qs::qdeserialize(load$content), silent = TRUE)

  if (inherits(content, "try-error")) {
    cli::cli_warn("Failed to parse file with {.fun qs::qdeserialize()} from {.url {url}}")

    rlang::check_installed(
      pkg = c("Rcpp (>= 1.0.8)","RcppParallel (>= 5.1.5)"),
      reason = "- updating these packages frequently resolves qs-related issues.")

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
#' try({ # prevents cran errors
#'
#' read_rosters <- function(){
#'   urls <- c("https://github.com/nflverse/nflfastR-roster/raw/master/data/seasons/roster_2020.csv",
#'             "https://github.com/nflverse/nflfastR-roster/raw/master/data/seasons/roster_2021.csv")
#'
#'   p <- progressr::progressor(along = urls)
#'   lapply(urls, progressively(read.csv, p))
#' }
#'
#' progressr::with_progress(read_rosters())
#'
#' })
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

load_from_url <- function(url, ..., seasons = TRUE, nflverse = FALSE){

  url <- as.character(url)

  if(length(url) == 1) {
    out <- loader(url)
    if(!isTRUE(seasons)) stopifnot(is.numeric(seasons))
    if(!isTRUE(seasons) && "season" %in% names(out)) out <- out[out$season %in% seasons]
  }

  if(length(url) > 1) {
    p <- NULL
    if (is_installed("progressr")) p <- progressr::progressor(along = url)
    out <- lapply(url, progressively(loader, p))
    out <- rbindlist_with_attrs(out)
  }

  if(nflverse) out <- make_nflverse_data(out,...)
  return(out)
}

loader <- function(url){
  switch(detect_filetype(url),
         "rds" = rds_from_url(url),
         "qs" = qs_from_url(url),
         "parquet" = parquet_from_url(url),
         "csv" = csv_from_url(url)
         )
}

detect_filetype <- function(url){
  tools::file_ext(gsub(x = url, pattern = ".gz$", replacement = ""))
}

make_nflverse_data <- function(dataframe, nflverse_type = NULL, ...){

  class(dataframe) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")

  dots <- rlang::dots_list(..., .named = TRUE)

  for(i in seq_along(dots)){
    attr(dataframe, names(dots)[[i]]) <- dots[[i]]
  }

  if(!is.null(nflverse_type)) attr(dataframe, "nflverse_type") <- nflverse_type

  if(
    (length(dots) > 0 | !is.null(nflverse_type)) &&
    is.null(attr(dataframe, "nflverse_timestamp"))
  ){
    attr(dataframe, "nflverse_timestamp") <- Sys.time()
  }

  return(dataframe)
}
