#' Bulk download utilities via piggyback
#'
#' This function downloads or updates data from the nflverse-data repository releases,
#' creating subfolders that match the release structure.
#'
#' @param folder_path a folder in which subfolders will be created for each release
#' @param releases one or more of the available releases, or `TRUE` to include all available releases - defaults to `"pbp"`
#' @param file_type one of `c("rds","parquet", "csv", "qs")` - defaults to "rds"
#'
#' @export
download_local <- function(folder_path = ".", releases = "pbp", file_type = "rds"){

  file_name <- NULL
  tag <- NULL

  rlang::check_installed(c("piggyback (> 0.1.1)","fs"))
  rlang::arg_match0(file_type, c("rds","csv","parquet","qs"))

  all_releases <- piggyback::pb_releases(repo = "nflverse/nflverse-data", verbose = FALSE)

  if(!isTRUE(releases) && any(!releases %in% all_releases$release_name)){
    missing <- releases[!releases %in% all_releases$release_name]
    cli::cli_warn("Could not find {.val {missing}} in nflverse-data releases. Skipping.")
    releases <- releases[releases %in% all_releases$release_name]
  }

  if(isTRUE(releases)) releases <- all_releases$release_name

  fs::dir_create(file.path(folder_path,releases))

  file_list <- piggyback::pb_list(repo = "nflverse/nflverse-data", tag = releases)

  data.table::setDT(file_list)

  download_list <- file_list[grepl(paste0("\\.",file_type,"$"),file_name), list(file_name, tag, path = file.path(folder_path,tag))]

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
