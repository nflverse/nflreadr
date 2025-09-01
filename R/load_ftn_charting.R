#' Load FTN Charting Data
#'
#' FTN Data manually charts plays and has graciously provided a subset of their
#' charting data to be published via the nflverse. Data is available from the 2022
#' season onwards and is charted within 48 hours following each game. This data
#' is released under the [CC-BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)
#' Creative Commons license and attribution must be made to **FTN Data via nflverse**
#'
#' @param seasons a numeric vector of seasons to return, defaults to most recent season.
#' If set to `TRUE`, returns all available data. Data available from 2022 onwards.
#' @param file_type One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally with
#' `options(nflreadr.prefer)`
#'
#' @author FTN Data
#' @source FTNData.com
#'
#' @examples
#' \donttest{
#'   try({ # prevents cran errors
#'   load_ftn_charting()
#'   })
#' }
#'
#' @return Play-level manual charting data from FTN Data
#'
#' @seealso <https://www.ftndata.com>
#' @seealso `vignette("Data Dictionary - FTN Charting")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_ftn_charting.html> for the web data dictionary
#' @family ftn_charting
#'
#' @export
load_ftn_charting <- function(
  seasons = most_recent_season(),
  file_type = getOption("nflreadr.prefer", default = "rds")
) {
  if (isTRUE(seasons)) {
    seasons <- 2022:most_recent_season()
  }

  stopifnot(
    is.numeric(seasons),
    seasons >= 2022,
    seasons <= most_recent_season()
  )

  file_type <- rlang::arg_match0(file_type, c("rds", "csv", "parquet", "qs"))

  urls <- glue::glue(
    "https://github.com/nflverse/nflverse-data/releases/download/ftn_charting/ftn_charting_{seasons}.{file_type}"
  )

  out <- load_from_url(
    urls,
    nflverse = TRUE,
    nflverse_type = glue::glue(
      "FTN Charting Data - please attribute to 'ftndata.com via nflverse'"
    )
  )
  return(out)
}

#' Data Dictionary: FTN Charting Data
#'
#' A dataframe containing the data dictionary for [`load_ftn_charting()`]
#'
#' @family ftn_charting
#' @seealso `vignette("Data Dictionary - FTN Charting")`
#' @seealso <https://nflreadr.nflverse.com/articles/dictionary_ftn_charting.html>
"dictionary_ftn_charting"
