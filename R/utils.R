#### Internal UTILS ###

.datatable.aware <- TRUE

is_installed <- function(pkg) requireNamespace(pkg, quietly = TRUE)

#' @keywords internal
"_PACKAGE"

#' @importFrom data.table `:=`
NULL

`%c%` <- function(x,y){
  data.table::fifelse(!is.na(x), x, y)
}

#' rbindlist but maintain attributes of last file
#'
#' @export
#' @keywords internal
rbindlist_with_attrs <- function(dflist){
  nflverse_timestamp <- attr(dflist[[length(dflist)]], "nflverse_timestamp")
  nflverse_type <- attr(dflist[[length(dflist)]], "nflverse_type")
  out <- data.table::rbindlist(dflist, use.names = TRUE, fill = TRUE)
  data.table::setattr(out, "nflverse_timestamp", format(nflverse_timestamp, usetz = TRUE, tz = "America/New_York"))
  data.table::setattr(out, "nflverse_type",      nflverse_type)
  out
}

.ignore_unused_imports <- function(){
  curl::curl_fetch_memory
  methods::setOldClass
}

# additional release issue bullets for usethis::use_release_issue()
release_bullets <- function() {
  c(
    '`devtools::check_mac_release()`',
    '`c <- rhub::check_for_cran(show_status = FALSE)`',
    '`pkgdown::check_pkgdown()`',
    '`usethis::use_tidy_thanks()`',
    NULL
  )
}
