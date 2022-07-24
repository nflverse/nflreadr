#' Load Participation Data
#'
#' @description Loads participation data from the [nflverse-data repository](https://github.com/nflverse/nflverse-data)
#'
#' @param seasons A numeric vector of 4-digit years associated with given NFL seasons - defaults to latest season. If set to `TRUE`, returns all available data since 2016.
#' @param include_pbp a logical: download and join pbp to this data?
#' @param file_type One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @return A dataframe of participation data, optionally merged with play by play
#'
#' @examples
#' \donttest{
#' try({ # prevents cran errors
#'   load_participation(seasons = 2020, include_pbp = TRUE)
#' })
#' }
#'
#' @export
load_participation <- function(seasons = most_recent_season(),
                               include_pbp = FALSE,
                               file_type = getOption("nflreadr.prefer", default = "rds")) {

  file_type <- rlang::arg_match0(file_type, c("rds", "qs", "csv", "parquet"))

  if(isTRUE(seasons)) seasons <- 2016:most_recent_season()

  stopifnot(is.numeric(seasons),
            seasons >= 2016,
            seasons <= most_recent_season(),
            is.logical(include_pbp),
            length(include_pbp) == 1)

  urls <- paste0("https://github.com/nflverse/nflverse-data/releases/download/pbp_participation/pbp_participation_",
                 seasons, ".", file_type)

  participation <- load_from_url(urls,nflverse = TRUE, seasons = seasons)

  if(!include_pbp) return(participation)

  pbp <- load_pbp(seasons = seasons, file_type = file_type)

  data.table::setDT(participation)
  data.table::setkeyv(participation, c("old_game_id","play_id"))
  data.table::setDT(pbp)
  data.table::setkeyv(pbp, c("old_game_id","play_id"))

  pbp_participation <- data.table::merge.data.table(participation,pbp)

  pbp_participation <- make_nflverse_data(pbp_participation,
                     nflverse_type = "play-by-play participation",
                     nflverse_timestamp = attr(participation,"nflverse_timestamp"))

  return(pbp_participation)
}
