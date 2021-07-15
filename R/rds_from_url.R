#' Load .rds file from a remote connection
#'
#' @param url a character url
#'
#' @return
#' @export
#'
#' @examples
#' rds_from_url("https://github.com/nflverse/nfldata/blob/master/data/games.rds?raw=true")
rds_from_url <- function(url){
  con <- url(url)
  on.exit(close(con))
  load <- try(readRDS(con), silent = TRUE)
  if (inherits(load, "try-error")) return(data.frame())
  load
}
