#' Bulk download utilities via piggyback
#'
#' This function downloads or updates data from the nflverse-data repository releases,
#' creating subfolders that match the release structure.
#'
#' @param ... releases to download, provided in either unquoted or character format
#' (i.e. pbp or "pbp" are both fine)
#' @param folder_path a folder in which subfolders will be created for each release -
#' defaults to path specified in `options("nflreadr.download_path)` or "." (the current working directory)
#' @param file_type one of `c("rds","parquet", "csv", "qs")` -
#' defaults to file type specified in `options(nflreadr.prefer)` or "rds"
#'
#' @examples {
#' \donttest{
#' try({
#'   temp_dir <- tempdir()
#'
#'   download_nflverse(combine, contracts, folder_path = temp_dir, file_type = "parquet")
#'
#'   unlink(temp_dir) # cleanup
#' })
#' }
#' }
#' @export
download_nflverse <- function(...,
                              folder_path = getOption("nflreadr.download_path", default = "."),
                              file_type = getOption("nflreadr.prefer", default = "rds")){

  releases <- as.character(rlang::ensyms(...))
  file_name <- NULL
  tag <- NULL

  rlang::check_installed(c("piggyback (> 0.1.1)","fs"))
  rlang::arg_match0(file_type, c("rds","csv","parquet","qs"))
  stopifnot(
    length(folder_path) == 1,
    is.character(folder_path)
  )

  all_releases <- piggyback::pb_releases(repo = "nflverse/nflverse-data", verbose = FALSE)

  if(!isTRUE(releases) && any(!releases %in% all_releases$release_name)){
    missing <- releases[!releases %in% all_releases$release_name]
    cli::cli_warn("Could not find {.val {missing}} in nflverse-data releases. Skipping.")
    releases <- releases[releases %in% all_releases$release_name]
  }

  if(isTRUE(releases)) releases <- all_releases$release_name

  if(length(releases)==0) cli::cli_abort("No matching releases to download.")

  fs::dir_create(file.path(folder_path,releases))

  file_list <- piggyback::pb_list(repo = "nflverse/nflverse-data", tag = releases)

  data.table::setDT(file_list)

  download_list <- file_list[grepl(paste0("\\.",file_type,"$"),file_name), list(file_name, tag, path = file.path(folder_path,tag))]

  if(any(!releases %in% download_list$tag)){
    missing <- releases[!releases %in% download_list$tag]
    cli::cli_warn("Could not find files of type {.val file_type} for the following releases: {.val {missing}}. Skipping.")
  }

  cli::cli_alert_info("Now downloading {.val {nrow(download_list)}} file(s) to {.file {folder_path}}.")

  lapply(split(download_list,download_list$tag),
         function(x){
           piggyback::pb_download(
             file = x$file_name,
             dest = x$path[[1]],
             repo = "nflverse/nflverse-data",
             tag = x$tag[[1]],
             overwrite = TRUE
           )
         })

  cli::cli_alert_success("Downloaded {.val {nrow(download_list)}} file(s) to {.file {folder_path}}.")

  return(invisible(download_list))
}
