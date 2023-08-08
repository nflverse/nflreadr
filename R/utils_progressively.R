#' Progressively
#'
#' This function helps add progress-reporting to any function - given function `f()` and progressor `p()`,
#' it will return a new function that calls `f()` and then (on exiting) will call `p()` after every iteration.
#' This is inspired by purrr's `safely`, `quietly`, and `possibly` function decorators.
#'
#' @param f a function to add progressor functionality to.
#' @param p a function such as one created by `progressr::progressor()` - also accepts purrr-style lambda functions.
#'
#' @examples
#' \dontshow{.for_cran()}
#' \donttest{
#' try({ # prevents cran errors
#'
#' urls <- rep("https://github.com/nflverse/nflverse-data/releases/download/test/combines.csv",3)
#'
#' lapply(urls, progressively(read.csv, ~cli::cli_progress_step('Loading...')))
#'
#' read_rosters <- function(urls){
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
  if(is.null(p)) p <- function(...) NULL
  p <- rlang::as_function(p)
  f <- rlang::as_function(f)

  function(...){
    on.exit(p())
    f(...)
  }

}
