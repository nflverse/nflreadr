#### Internal UTILS ###

.datatable.aware <- TRUE

is_installed <- function(pkg) requireNamespace(pkg, quietly = TRUE)

#' @keywords internal
"_PACKAGE"

#' @importFrom data.table `:=`
NULL

`%c%` <- function(x, y) {
  data.table::fifelse(!is.na(x), x, y)
}

#' rbindlist but maintain attributes of last file
#'
#' @export
#' @keywords internal
rbindlist_with_attrs <- function(dflist) {
  nflverse_timestamp <- attr(dflist[[length(dflist)]], "nflverse_timestamp")
  nflverse_type <- attr(dflist[[length(dflist)]], "nflverse_type")
  out <- data.table::rbindlist(dflist, use.names = TRUE, fill = TRUE)
  data.table::setattr(out, "nflverse_timestamp", nflverse_timestamp)
  data.table::setattr(out, "nflverse_type", nflverse_type)
  out
}

.ignore_unused_imports <- function() {
  curl::curl_fetch_memory
  methods::setOldClass
}

my_rhub_check <- function() {
  cli::cli_text("Please run the following code")
  cli::cli_text(
    "{.run rhub::rhub_check(platforms = nflreadr:::rhub_check_platforms())}"
  )
}

rhub_check_platforms <- function() {
  # plts created with
  # out <- paste0('"', rhub::rhub_platforms()$name, '"', collapse = ",\n")
  # cli::cli_code(paste0(
  #   "plts <- c(\n", out, "\n)"
  # ))

  plts <- c(
    "linux",
    "m1-san",
    "macos",
    "macos-arm64",
    "windows",
    "atlas",
    "c23",
    "clang-asan",
    "clang-ubsan",
    "clang16",
    "clang17",
    "clang18",
    "clang19",
    "clang20",
    "donttest",
    "gcc-asan",
    "gcc13",
    "gcc14",
    "gcc15",
    "intel",
    "mkl",
    "nold",
    "noremap",
    "nosuggests",
    "rchk",
    "ubuntu-clang",
    "ubuntu-gcc12",
    "ubuntu-next",
    "ubuntu-release",
    "valgrind"
  )
  exclude <- c("rchk", "nosuggests", "valgrind")
  plts[!plts %in% exclude]
}

nflverse_thanks <- function() {
  cli::cli_text("Run the following code and copy/paste its output to NEWS.md")

  cli::cli_code(
    '
    contributors <- usethis::use_tidy_thanks()
    paste(
      "Thank you to",
      glue::glue_collapse(
        paste0("&#x0040;", contributors), sep = ", ", last = ", and "
      ),
      "for their questions, feedback, and contributions towards this release."
    )'
  )
}

# additional release issue bullets for usethis::use_release_issue()
release_bullets <- function() {
  c(
    '`devtools::check_mac_release()`',
    '`nflreadr:::my_rhub_check()`',
    '`pkgdown::check_pkgdown()`',
    '`nflreadr:::nflverse_thanks()`',
    NULL
  )
}
