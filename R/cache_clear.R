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
    load_pbp,
    load_rosters,
    load_player_stats,
    load_nextgen_stats,
    load_schedules
  )

  purrr::walk(functions, memoise::forget)

  message("nflreadr function cache cleared!")
}
