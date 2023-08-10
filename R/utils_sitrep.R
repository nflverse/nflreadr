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
#' \dontshow{.for_cran()}
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
                            redact_path = TRUE) {
  .sitrep(pkg = pkg, recursive = recursive, header = "nflverse ", redact_path = redact_path)
}

#' @rdname sitrep
#' @export
ffverse_sitrep <- function(pkg = c("ffscrapr","ffsimulator","ffpros","ffopportunity"),
                           recursive = TRUE,
                           redact_path = TRUE) {
  .sitrep(pkg = pkg, recursive = recursive, header = "ffverse ", redact_path = redact_path)
}

#' @rdname sitrep
#' @export
.sitrep <- function(pkg, recursive = TRUE, header = "", redact_path = TRUE){

  out <- structure(
    list(
      system_info = list(),
      installed = list(),
      dependencies = list(),
      package_options = list(),
      not_installed = list(),
      packages = pkg,
      timestamp = Sys.time()
    ),
    class = c("nflverse_sitrep", "list")
  )

  s <- utils::sessionInfo()

  # OPERATING SYSTEM INFO
  out$system_info <- list(
    r_version = s$R.version$version.string,
    os_version = s$running
  )

  # PACKAGES FROM LIST
  which_installed <- sapply(out$packages, is_installed)
  out$not_installed <- out$packages[!which_installed]

  packages <- out$packages[which_installed]

  if (length(packages) == 0) return(out)

  s <- utils::sessionInfo(packages)

  out$installed <- lapply(s$otherPkgs, `[`, c("Package", "Version"))
  out$installed <- as.data.frame(data.table::rbindlist(out$installed))
  out$installed <- stats::setNames(out$installed, c("package","version"))

  # Relies on options for a given package being prefixed by said package name
  opts <- options()
  pkg_search_string <- paste(packages, collapse = "|")
  out$package_options <- opts[grepl(pkg_search_string, x = names(opts))]
  if(redact_path) {
    out$package_options[grepl("path|token", names(out$package_options))] <- "{redacted, use redact_path = FALSE to show}"
  }

  # Exit here if we don't want recursive deps or if no internet
  if (isFALSE(recursive)) return(out)
  if (!curl::has_internet()) {
    cli::cli_alert_warning("Requires internet access to scan recursive dependencies")
    return(out)
  }

  ## PKG DEPENDENCIES
  # using pak allows you to access the dependencies of GitHub-installed packages
  # if(is_installed("pak")) out$dependencies <- .sitrep_deps_pak(packages)
  out$dependencies <- .sitrep_deps_base(packages)

  return(out)
}

#' nflverse_sitrep data class
#'
#' `nflverse_sitrep()` returns an S3 class that was created to allow for custom
#' printing. It will otherwise dispatch to the `list` class.
#'
#' Re-exporting with `methods::setOldClass()` allows these dataframes to be used
#' in S4 generics like those from DBI and jsonlite.
#'
#' @name nflverse_sitrep-class
#' @keywords internal
#' @exportClass nflverse_sitrep
methods::setOldClass("nflverse_sitrep", "list")

#' @export
#' @noRd
print.nflverse_sitrep <- function(x, ...) {
  cli::cat_rule(cli::style_bold("System Info"), col = cli::make_ansi_style("cyan"), line = 1)
  cli::cat_bullet(glue::glue("{x$system_info$r_version} {cli::symbol$bullet} Running under: {x$system_info$os_version}")) # nolint

  cli::cat_rule(cli::style_bold("Package Status"), col = cli::make_ansi_style("cyan"), line = 1)
  .cat_packages(x$installed$package, x$installed$version)

  cli::cat_rule(cli::style_bold("Package Options"), col = cli::make_ansi_style("cyan"), line = 1)
  if (length(x$package_options) == 0) cli::cli_bullets("No options set for above packages")
  if (length(x$package_options) > 0) .cat_options(names(x$package_options), unname(x$package_options))

  if (length(x$dependencies) >= 1) {
    cli::cat_rule(cli::style_bold("Package Dependencies"), col = cli::make_ansi_style("cyan"), line = 1)
    .cat_packages(x$dependencies$package, x$dependencies$version)
  }
  if (length(x$not_installed) >= 1) {
    cli::cat_rule(cli::style_bold("Not Installed"), col = cli::make_ansi_style("cyan"), line = 1)
    .cat_packages(x$not_installed, rep_len("", length(x$not_installed)))
  }

  cli::cat_rule(col = cli::make_ansi_style("cyan"), line = 1)

  return(invisible(x))
}

# .sitrep_deps_pak <- function(packages){
#   ref <- NULL
#   pak_status <- rlang::env_get(rlang::ns_env("pak"), "pkg_status")
#   pak_deps <- rlang::env_get(rlang::ns_env("pak"), "pkg_deps")
#   pkg_status <- data.table::as.data.table(pak_status(packages))
#   pkg_status <- unique(pkg_status, by = "package")
#   pkg_spec <- data.table::fcoalesce(pkg_status$remotepkgref, pkg_status$package)
#
#   # Add any repositories found by pkg_status to the search list
#   # as well as cran.rstudio.com
#   pkg_repos <- unique(c(stats::na.omit(pkg_status$repos), getOption("repos"), "https://cran.rstudio.com"))
#   old_repos <- options(repos = pkg_repos)
#   on.exit(options(old_repos))
#
#   deps <- data.table::as.data.table(pak_deps(pkg_spec))[!ref %in% pkg_spec][["package"]]
#   dep_status <- data.table::as.data.table(pak_status(deps))[,c("package", "version")]
#
#   if(any(!deps %in% dep_status$package)) {
#     missing_pkgs <- data.table::data.table(
#       package = setdiff(deps, dep_status$package),
#       version = "missing"
#     )
#     data.table::rbindlist(list(dep_status, missing_pkgs))
#   }
#
#   return(dep_status)
# }

.sitrep_deps_base <- function(packages){
  # The checks failed because the repo option is empty sometimes
  # so we set it here to the rstudio mirror and restore the options
  # after the call to package_dependencies()
  old <- options(repos = unique(c(getOption("repos"), "https://cran.rstudio.com/")))
  on.exit(options(old))

  deps <-
    sort(
      unique(
        unlist(
          tools::package_dependencies(packages, recursive = TRUE),
          use.names = FALSE
        )
      )
    )

  deps <- deps[!deps %in% packages]
  sys_pkgs <- utils::installed.packages()[,"Package"]
  missing_pkgs <- setdiff(deps, sys_pkgs)

  deps <- intersect(deps, sys_pkgs)
  dep_status <- utils::sessionInfo(deps)$otherPkgs
  dep_status <- data.table::rbindlist(dep_status, fill = TRUE)[, c("Package", "Version")]
  dep_status <- stats::setNames(dep_status, c("package","version"))
  if(length(missing_pkgs) > 0) {
    dep_status <- data.table::rbindlist(
      list(
        dep_status,
        data.table::data.table(package = missing_pkgs, version = "missing")
      )
    )
  }

  return(dep_status)
}

.cat_packages <- function(packages, versions) {
  stopifnot(length(packages) == length(versions))

  if (length(packages) <= 2) {
    cli::cat_bullet(glue::glue("{format(packages)} ({format(versions)})"))
    return(invisible())
  }

  l <- length(packages)

  breaks <- cut(
    x = seq_along(packages),
    breaks = c(0, ceiling(l / 3), 2 * ceiling(l / 3), l + 1)
  )

  p <- split(packages, breaks)
  v <- split(versions, breaks)

  r <- length(p[[1]]) - length(p[[3]])

  if (r != 0) {
    p[[3]] <- c(p[[3]], rep("", r))
    v[[3]] <- c(v[[3]], rep("", r))
  }

  p <- lapply(p, function(x) ifelse(x != "", format(paste(cli::symbol$bullet, x)), ""))
  v <- lapply(v, function(x) ifelse(x != "", format(paste0(" (", x, ")")), ""))

  cli::cat_line(
    paste0(
      p[[1]], v[[1]], "  ",
      p[[2]], v[[2]], "  ",
      p[[3]], v[[3]], "  "
    )
  )
}

.cat_options <- function(option_names, option_values) {
  stopifnot(length(option_names) == length(option_values))
  cli::cat_bullet(glue::glue("{format(option_names)}: {format(option_values)}"))
}
