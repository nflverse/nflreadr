#' Clear function cache
#'
#' This function clears the memoised cache of all functions memoised by `nflreadr`.
#'
#' @export
#' @return A success message after clearing the cache.
#' @examples
#' .clear_cache()
.clear_cache <- function(){

  functions <- list(
    raw_from_url,
    rds_from_url,
    qs_from_url
  )

  lapply(functions, memoise::forget)

  message("nflreadr function cache cleared!")
}
