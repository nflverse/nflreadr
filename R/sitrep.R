#' Get a Situation Report on System, nflverse Package Versions and Dependencies
#'
#' This function gives a quick overview of the versions of R and the operating
#' system as well as the versions of nflverse packages and their dependencies.
#' It's primarily designed to help you get a quick idea of what's going on when
#' you're helping someone else debug a problem.
#'
#' @param pkg a character vector naming installed packages, or `NULL`
#'   (the default) meaning all nflverse packages. The function checks internally
#'   if all packages are installed and informs if that is not the case.
#' @param recursive a logical indicating whether dependencies of `pkg` and their
#'  dependencies (and so on) should be included.
#'  Can also be a character vector listing the types of dependencies, a subset
#'  of `c("Depends", "Imports", "LinkingTo", "Suggests", "Enhances")`.
#'  Character string `"all"` is shorthand for that vector, character string
#'  `"most"` for the same vector without `"Enhances"`, character string `"strong"`
#'  (default) for the first three elements of that vector.
#' @examples
#' \donttest{
#' nflverse_sitrep()
#' nflverse_sitrep("nflreadr", TRUE)
#' }
#' @rdname sitrep
#' @export
nflverse_sitrep <- function(pkg = c("nflreadr","nflfastR","nflseedR","nfl4th","nflplotR"),
                            recursive = TRUE){
  .sitrep(pkg = pkg, recursive = recursive, header = "nflverse")
}

#' @rdname sitrep
#' @export
ffverse_sitrep <- function(pkg = c("ffscrapr","ffsimulator","ffpros"),
                            recursive = TRUE){
  .sitrep(pkg = pkg, recursive = recursive, header = "ffverse")
}

.sitrep <- function(pkg = NULL, recursive = TRUE, header = NA_character_){
  if (is.null(pkg)){
    packages <- c(
      "nflreadr",
      "nflfastR",
      "nflseedR",
      "nfl4th",
      "nflplotR",
      "ffsimulator",
      "ffscrapr"
    )
    header <- "nflverse "
  } else {
    packages <- pkg
  }

  installed <- lapply(packages, is_installed) %>% unlist()

  if (!is.null(pkg)){
    not_installed <- packages[!installed]
    if (length(not_installed) >= 1){
      cli::cli_alert_info("You've asked for the package{?s} {not_installed} which {?is/are} not installed. {?It/They} {?is/are} skipped.")
    }
  }

  packages <- packages[installed]

  s <- utils::sessionInfo(packages)

  cli::cat_rule("System Info")
  cli::cat_bullet(glue::glue("{s$R.version$version.string}   * Running under: {s$running}"))

  cli::cat_rule(paste(header, "Packages"))
  packages <- format(unlist(lapply(s$otherPkgs,function(pkg) pkg$Package)))
  versions <- unlist(lapply(s$otherPkgs, function(pkg) pkg$Version))

  cat_packages(packages, versions)

  # Exit here if we don't want recursive deps
  if (isFALSE(recursive)) return(invisible(NULL))

  cli::cat_rule(paste(header, "Dependencies"))

  # The checks failed because the repo option is empty sometimes
  # so we set it here to the rstudio mirror and restore the options
  # after the call to package_dependencies()
  old <- options(repos = "https://cran.rstudio.com/")
  deps <-
    tools::package_dependencies(packages, recursive = TRUE) %>%
    unlist(use.names = FALSE) %>%
    sort() %>%
    unique()

  # restore old options
  options(old)

  deps <- deps[!deps %in% packages]
  sys_pkgs <- utils::installed.packages()[,"Package"]

  if(any(!deps %in% sys_pkgs)){
    missing_pkgs <- deps[!deps %in% sys_pkgs]
    rlang::check_installed(missing_pkgs, reason = "in your dependencies.")
  }

  s <- utils::sessionInfo(deps)

  packages <- unlist(lapply(s$otherPkgs, function(pkg) pkg$Package))
  versions <- unlist(lapply(s$otherPkgs,function(pkg) pkg$Version))

  if (is.null(packages)){
    cli::cat_bullet("No non-base dependencies")
    return(invisible())
  }

  cat_packages(packages,versions)

}

cat_packages <- function(packages,versions){
  stopifnot(length(packages) == length(versions))

  if(length(packages) <= 2){
    cli::cat_bullet(glue::glue("   {packages} ({versions})"))
    return()
  }

  l <- length(packages)

  breaks <- cut(x = seq_along(packages),
                breaks = c(0, ceiling(l / 3), 2 * ceiling(l / 3), l))

  p <- split(packages, breaks)
  v <- split(versions, breaks)

  r <- length(p[[1]])-length(p[[3]])

  if(length(p[[3]])!=length(p[[1]])){
    p[[3]] <- c(p[[3]],rep("",r))
    v[[3]] <- c(v[[3]],rep("",r))
  }

  cli::cat_bullet(
    paste0(
    p[[1]] %>% format(),
    paste0(" (", v[[1]], ")") %>% format(),
    "   ",
    cli::symbol$bullet,
    " ",
    p[[2]] %>% format(),
    paste0(" (", v[[2]], ")") %>% format(),
    "   ",
    cli::symbol$bullet,
    " ",
    p[[3]] %>% format(),
    paste0(" (", v[[3]], ")") %>% format()
  ))
}
