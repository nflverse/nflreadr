#' Bulk download utilities via piggyback
#'
#' This function downloads or updates data from the nflverse-data repository releases,
#' creating subfolders that match the release structure.
#'
#' @param ... releases to download, provided in either unquoted or character format
#' (i.e. pbp or "pbp" are both fine)
#' @param folder_path a folder in which subfolders will be created for each release -
#' defaults to path specified in `options(nflreadr.download_path)` or "." (the current working directory)
#' @param file_type one of `c("rds","parquet", "csv", "qs")` -
#' defaults to file type specified in `options(nflreadr.prefer)` or "rds"
#' @param use_hive whether to create hive-style partition folders for each season, e.g. `"~/pbp/.season=2021/pbp.csv"`
#'
#' @examples {
#' \donttest{
#' try({
#'   ## could also set options like
#'   # options(nflreadr.download_path = tempdir(), nflreadr.prefer = "parquet")
#'
#'   download_nflverse(combine, contracts, folder_path = tempdir(), file_type = "parquet")
#'
#'   list.files(tempdir(),pattern = ".parquet$") # check that files were downloaded!
#' })
#' }
#' }
#' @export
download_nflverse <- function(...,
                              folder_path = getOption("nflreadr.download_path", default = "."),
                              file_type = getOption("nflreadr.prefer", default = "rds"),
                              use_hive = file_type %in% c("parquet","csv")
                              ){

  rlang::check_installed(c("piggyback (>= 0.1.2)", "fs"))

  releases <- as.character(rlang::ensyms(...))
  file_type <- rlang::arg_match0(file_type, c("rds","csv","parquet","qs"))

  stopifnot(
    length(folder_path) == 1,
    is.character(folder_path),
    length(use_hive) == 1,
    is.logical(use_hive)
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

  file_name <- NULL
  tag <- NULL
  path <- NULL
  .season <- NULL

  download_list <- file_list[grepl(paste0("\\.",file_type,"$"),file_name),
                             list(file_name, tag, path = file.path(folder_path,tag))]

  if(use_hive){
    download_list <- download_list[
      ,`:=`(.season = gsub(x = file_name, pattern = ".+([0-9]{4}).+", replacement = "\\1"))
    ][,`:=`(path = ifelse(.season == file_name, path, file.path(path, paste0("season=",.season))))]

    fs::dir_create(download_list$path)
  }

  if(any(!releases %in% download_list$tag)){
    missing <- releases[!releases %in% download_list$tag]
    cli::cli_warn("Could not find files of type {.val {file_type}} for the following {cli::qty(missing)} release{?s}: {.val {missing}}. Please try another file type.")
  }

  cli::cli_alert_info("Now downloading {.val {nrow(download_list)}} file{?s} to {.file {folder_path}}.")

  lapply(split(x = download_list, by = "path", drop = TRUE, flatten = FALSE),
         function(x){
           piggyback::pb_download(
             file = x$file_name,
             dest = x$path[[1]],
             repo = "nflverse/nflverse-data",
             tag = x$tag[[1]],
             overwrite = TRUE
           )
           invisible(NULL)
         })

  cli::cli_alert_success("Downloaded {.val {nrow(download_list)}} file{?s} to {.file {folder_path}}.")

  return(invisible(download_list))
}
