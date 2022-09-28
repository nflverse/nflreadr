#' Clear function cache
#'
#' This function clears the memoised cache of all functions memoised by `nflreadr`.
#'
#' @rdname clear_cache
#' @export
#' @return A success message after clearing the cache.
#' @examples
#' clear_cache()
clear_cache <- function(){

  functions <- list(
    raw_from_url,
    csv_from_url,
    rds_from_url,
    qs_from_url
  )

  lapply(functions, memoise::forget)

  cli::cli_alert_success("nflreadr function cache cleared!")

  invisible(TRUE)
}

#' @rdname clear_cache
#' @export
.clear_cache <- clear_cache
