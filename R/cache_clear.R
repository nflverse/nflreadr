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
    load_schedules,
    load_ff_playerids,
    load_ff_rankings,
    load_depth_charts,
    load_injuries,
    load_pfr_passing
  )

  purrr::walk(functions, memoise::forget)

  message("nflreadr function cache cleared!")
}
