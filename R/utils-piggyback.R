#' Bulk download utilities via piggyback
#'
#' This function downloads or updates data from the nflverse-data repository releases,
#' creating subfolders that match the release structure.
#'
#' @param folder_path a folder in which subfolders will be created for each release
#' @param releases one or more of the available releases, or `TRUE` to include all available releases - defaults to `"pbp"`
#' @param seasons a numeric vector of seasons to include, or `TRUE` to include all available seasons - defaults to `TRUE`
#' @param file_type one of `c("rds","parquet", "csv", "qs")` - defaults to "rds"
#'
#' @export
download_local <- function(folder_path, releases = TRUE, seasons = TRUE, file_type = "rds"){

  rlang::check_installed(c("piggyback","fs"))


}
