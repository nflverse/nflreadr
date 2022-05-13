#' Load Historical Player Contracts from OverTheCap.com
#'
#' @description Loads player contracts from OverTheCap.com
#'
#' @param file_type One of `"rds"`, `"qs"`, `"csv"`, or `"parquet"`.
#'   Can also be set globally with options(nflreadr.prefer)
#'
#' @examples
#' \donttest{
#' try({ # prevents cran errors
#'   load_contracts()
#' })
#' }
#'
#' @return A tibble of active and non-active NFL player contracts.
#'
#' @seealso <https://overthecap.com/contract-history/> for a web version of the data
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_contracts.html> for a web version of the dictionary
#' @seealso [`dictionary_contracts`] for the data dictionary as bundled within the package
#' @seealso Issues with this data should be filed here: <https://github.com/nflverse/rotc>
#'
#' @export
load_contracts <- function(file_type = getOption("nflreadr.prefer", default = "rds")){
  file_type <- rlang::arg_match0(file_type, c("rds", "qs", "parquet","csv"))
  loader <- choose_loader(file_type)
  url <- paste0("https://github.com/nflverse/nflverse-data/releases/download/",
                "contracts/historical_contracts.", file_type)
  out <- loader(url)
  class(out) <- c("nflverse_data","tbl_df","tbl","data.table","data.frame")
  out
}
