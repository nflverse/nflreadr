#' Load Arrow Dataset
#'
#' This function creates subfolders within the specified directory and downloads parquet files such that you can work with them via `arrow::open_dataset()`.
#'
#' @param dir directory to load data to
#' @param data_type requested data frame, corresponds to location of thing.
#' @param seasons seasons for data frame, defaults to TRUE and loads all data.
#' @param overwrite overwrite existing files/directories? default = TRUE
#'
#' @examples
#' \donttest {
#'   try({
#'     download_parquet(
#'       dir = tempdir(),
#'       data_type = "pbp",
#'       seasons = TRUE,
#'       overwrite = TRUE
#'     )
#'   })
#' }
#'
#' @export
#' @return a success message and the supplied path where the data folder was created (invisibly)

download_parquet <- function(dir, data_type, seasons = TRUE, overwrite = TRUE){

  # build urls
  # make subfolder in dir
  # download urls to subfolder
  # success message

  invisible(dir)
}
