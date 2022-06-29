#' Load Combine Data from PFR
#'
#' @description Loads combine data since 2000 courtesy of PFR.
#'
#' @param seasons a numeric vector of seasons to return, default `TRUE` returns all available data
#' @param file_type One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally with
#' `options(nflreadr.prefer)`
#' @examples
#' \donttest{
#' try({ # prevents cran errors
#'   load_combine()
#' })
#' }
#'
#' @return A tibble of NFL combine data provided by Pro Football Reference.
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/nflverse-data>
#'
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_combine.html> for a web version of the dictionary
#' @seealso [`dictionary_combine`] for the data dictionary as bundled within the package
#'
#' @export
load_combine <- function(seasons = TRUE, file_type = getOption("nflreadr.prefer", default = "rds")){

  file_type <- rlang::arg_match0(file_type, c("rds", "csv", "parquet", "qs"))
  loader <- choose_loader(file_type)

  url <- glue::glue("https://github.com/nflverse/nflverse-data/releases/download/combine/combine.{file_type}")
  out <- loader(url)
  if(!isTRUE(seasons)) stopifnot(is.numeric(seasons))
  if(!isTRUE(seasons)) out <- out[out$season %in% seasons]
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  out
}
