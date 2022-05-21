#' Get a Situation Report on System, nflverse/ffverse Package Versions and Dependencies
#'
#' This function gives a quick overview of the versions of R and the operating
#' system as well as the versions of nflverse/ffverse packages, options, and their dependencies.
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
#' @param header a string that is printed in the horizontal separation lines and
#'   used to differentiate between nflverse and ffverse output.
#' @param redact_path a logical indicating whether options that contain "path"
#' in the name should be redacted, default = TRUE
#' @examples
#' \donttest{
#' try({
#' nflverse_sitrep()
#' ffverse_sitrep()
#' .sitrep("cachem")
#' })
#' }
#' @rdname sitrep
#' @export
nflverse_sitrep <- function(pkg = c("nflreadr","nflfastR","nflseedR","nfl4th","nflplotR","nflverse"),
                            recursive = TRUE,
                            redact_path = TRUE
                            ){
  .sitrep(pkg = pkg, recursive = recursive, header = "nflverse ", redact_path = redact_path)
}

#' @rdname sitrep
#' @export
ffverse_sitrep <- function(pkg = c("ffscrapr","ffsimulator","ffpros","ffopportunity"),
                           recursive = TRUE,
                           redact_path = TRUE
                           ){
  .sitrep(pkg = pkg, recursive = recursive, header = "ffverse ", redact_path = redact_path)
}

#' @rdname sitrep
#' @export
.sitrep <- function(pkg, recursive = TRUE, header = "", redact_path = TRUE){
  packages <- pkg

  installed <- unlist(lapply(packages, is_installed))

  if (!is.null(pkg)){
    not_installed <- packages[!installed]
    if (length(not_installed) >= 1){
      cli::cli_alert_info("You've asked for the package{?s} {not_installed} which {?is/are} not installed. \n {?It/They} {?is/are} skipped.")
    }
  }

  packages <- packages[installed]

  s <- utils::sessionInfo(packages)

  cli::cat_rule(cli::style_bold("System Info"), col = cli::make_ansi_style("cyan"), line = 1)
  cli::cat_bullet(glue::glue("{s$R.version$version.string}   {cli::symbol$bullet} Running under: {s$running}"))

  cli::cat_rule(cli::style_bold(paste0(header, "Packages")), col = cli::make_ansi_style("cyan"), line = 1)
  packages <- unlist(lapply(s$otherPkgs,function(pkg) pkg$Package))
  versions <- unlist(lapply(s$otherPkgs, function(pkg) pkg$Version))

  cat_packages(packages, versions)

  # Relies on options for a given package being prefixed by said package name
  opts <- options()
  package_opts <- opts[Reduce(lapply(packages, function(package) grepl(package, x = names(opts), fixed = TRUE)),f = `|`)]

  if(redact_path) package_opts[grepl("path", names(package_opts))] <- "{redacted, use redact_path = FALSE to show}"

  cli::cat_rule(cli::style_bold(paste0(header, "Options")), col = cli::make_ansi_style("cyan"), line = 1)

  if(length(package_opts) == 0) cli::cli_bullets("No options set for {packages}")
  if(length(package_opts) > 0) cat_options(names(package_opts), unname(package_opts))

  # Exit here if we don't want recursive deps
  if (isFALSE(recursive)) return(invisible(NULL))

  cli::cat_rule(cli::style_bold(paste0(header, "Dependencies")), col = cli::make_ansi_style("cyan"), line = 1)

  # The checks failed because the repo option is empty sometimes
  # so we set it here to the rstudio mirror and restore the options
  # after the call to package_dependencies()
  old <- options(repos = "https://cran.rstudio.com/")
  deps <-
    sort(
      unique(
        unlist(
          tools::package_dependencies(packages, recursive = TRUE),
          use.names = FALSE)
      )
    )

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

  cli::cat_rule(col = cli::make_ansi_style("cyan"), line = 1)

}

cat_packages <- function(packages,versions){
  stopifnot(length(packages) == length(versions))

  if(length(packages) <= 2){
    cli::cat_bullet(glue::glue("{format(packages)} ({format(versions)})"))
    return(invisible())
  }

  l <- length(packages)

  breaks <- cut(x = seq_along(packages),
                breaks = c(0, ceiling(l / 3), 2 * ceiling(l / 3), l+1))

  p <- split(packages, breaks)
  v <- split(versions, breaks)

  r <- length(p[[1]])-length(p[[3]])

  if(r != 0){
    p[[3]] <- c(p[[3]],rep("",r))
    v[[3]] <- c(v[[3]],rep("",r))
  }

  p <- lapply(p, function(x) ifelse(x!="",format(paste(cli::symbol$bullet,x)),""))
  v <- lapply(v, function(x) ifelse(x!="",format(paste0(" (",x,")")),""))

  cli::cat_line(
    paste0(
      p[[1]],v[[1]],"  ",
      p[[2]],v[[2]],"  ",
      p[[3]],v[[3]],"  "
    ))
}

cat_options <- function(option_names, option_values){
  stopifnot(length(option_names) == length(option_values))

  cli::cat_bullet(glue::glue("{format(option_names)}: {format(option_values)}"))
}
