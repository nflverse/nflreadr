#### Internal UTILS ###

.datatable.aware <- TRUE

is_installed <- function(pkg) requireNamespace(pkg, quietly = TRUE)

#' @keywords internal
"_PACKAGE"

#' @importFrom data.table `:=`
NULL

`%c%` <- function(x,y){
  ifelse(!is.na(x),x,y)
}

#' rbindlist but maintain attributes of last file
#'
#' @export
#' @keywords internal
rbindlist_with_attrs <- function(dflist){
  nflverse_timestamp <- attr(dflist[[length(dflist)]], "nflverse_timestamp")
  nflverse_type <- attr(dflist[[length(dflist)]], "nflverse_type")
  out <- data.table::rbindlist(dflist, use.names = TRUE, fill = TRUE)
  attr(out,"nflverse_timestamp") <- nflverse_timestamp
  attr(out,"nflverse_type") <- nflverse_type
  out
}

.ignore_unused_imports <- function(){
  curl::curl_fetch_memory
  methods::setOldClass
}
