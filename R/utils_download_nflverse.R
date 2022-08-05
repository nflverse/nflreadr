#' Bulk download utilities via piggyback
#'
#' This function downloads or updates data from the nflverse-data repository releases,
#' creating subfolders that match the release structure.
#'
#' @param ... releases to download, provided in either unquoted or character format
#' (i.e. pbp or "pbp" are both fine). Available release names can be listed with
#' [`nflverse_releases()`]
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
#'   nflverse_download(combine, contracts, folder_path = tempdir(), file_type = "parquet")
#'
#'   list.files(tempdir(),pattern = ".parquet$") # check that files were downloaded!
#' })
#' }
#' }
#' @export
nflverse_download <- function(...,
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


#' List all Available nflverse Releases
#'
#' @description This functions lists all nflverse data releases that are available
#'   in the nflverse-data repo. Release names can be used for downloads in
#'   [`nflverse_download()`].
#'
#' @return A data.table containing release names, release descriptions, and
#'   other relevant release information.
#' @export
#' @importFrom utils tail
#' @importFrom data.table .N .I ':='
#' @examples
#' \donttest{
#' try(
#' nflverse_releases()
#' )
#' }
nflverse_releases <- function() {
  rlang::check_installed("piggyback (>= 0.1.2)")
  releases <- piggyback::pb_releases(repo = "nflverse/nflverse-data")
  join_df <- data.table::data.table(
    release_name = releases$release_name,
    release_description = gsub("[\r\n]", "", releases$release_body)
  )
  assets_list <- piggyback::pb_list("nflverse/nflverse-data", releases$release_name)
  ###################################################
  # Create the following code with this dtplyr pipe
  # assets_list |>
  #   dtplyr::lazy_dt() |>
  #   dplyr::mutate(
  #     file_type = tools::file_ext(file_name),
  #     file_type = ifelse(file_type == "gz", "csv.gz", file_type)
  #   ) |>
  #   dplyr::filter(!file_type %in% c("json", "txt")) |>
  #   dplyr::group_by(release_name = tag, file_type) |>
  #   dplyr::arrange(timestamp) |>
  #   dplyr::summarise(
  #     n_files = dplyr::n(),
  #     last_update = tail(timestamp, n = 1)
  #   ) |>
  #   dplyr::group_by(release_name) |>
  #   dplyr::arrange(last_update) |>
  #   dplyr::summarise(
  #     file_types = file_type |> sort() |> paste0(collapse = ", "),
  #     files_per_type = n_files |> max(),
  #     last_update = tail(last_update, n = 1) |> format(tz = "America/New_York", usetz = TRUE)
  #   ) |>
  #   dplyr::ungroup() |>
  #   dplyr::left_join(join_df, by = "release_name") |>
  #   dplyr::show_query()
  ###################################################
  data.table::setcolorder(join_df[data.table::as.data.table(assets_list)[, `:=`(c("file_type"), {
    file_type <- tools::file_ext(file_name)
    file_type <- data.table::fifelse(file_type == "gz", "csv.gz", file_type)
    .(file_type)
  })][!file_type %in% c("json", "txt")][, `:=`(release_name = tag)][order(timestamp)][,
    .(n_files = .N, last_update = tail(timestamp, n = 1)),
    keyby = .(
      release_name,
      file_type
    )
  ][order(last_update)][, .(file_types = paste0(sort(file_type),
    collapse = ", "
  ), files_per_type = max(n_files), last_update = format(tail(last_update,
    n = 1
  ), tz = "America/New_York", usetz = TRUE)), keyby = .(release_name)],
  on = .(release_name), allow.cartesian = TRUE
  ], c(
    1L, 3L,
    4L, 5L, 2L
  ))
}

# To silence NSE check note for variables that are used in the above function
utils::globalVariables(
  names = c(
    "file_type",
    "timestamp",
    "release_name",
    "file_name",
    "tag",
    "last_update",
    "n_files"
  ),
  package = "nflreadr"
)
