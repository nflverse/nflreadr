# Get a Situation Report on System, nflverse/ffverse Package Versions and Dependencies

This function gives a quick overview of the versions of R and the
operating system as well as the versions of nflverse/ffverse packages,
options, and their dependencies. It's primarily designed to help you get
a quick idea of what's going on when you're helping someone else debug a
problem.

## Usage

``` r
nflverse_sitrep(
  pkg = c("nflreadr", "nflfastR", "nflseedR", "nfl4th", "nflplotR", "nflverse"),
  recursive = TRUE,
  redact_path = TRUE
)

ffverse_sitrep(
  pkg = c("ffscrapr", "ffsimulator", "ffpros", "ffopportunity"),
  recursive = TRUE,
  redact_path = TRUE
)

.sitrep(
  pkg,
  recursive = TRUE,
  redact_path = TRUE,
  dev_repos = c("https://nflverse.r-universe.dev", "https://ffverse.r-universe.dev")
)
```

## Arguments

- pkg:

  a character vector naming installed packages, or `NULL` (the default)
  meaning all nflverse packages. The function checks internally if all
  packages are installed and informs if that is not the case.

- recursive:

  a logical indicating whether dependencies of `pkg` and their
  dependencies (and so on) should be included. Can also be a character
  vector listing the types of dependencies, a subset of
  `c("Depends", "Imports", "LinkingTo", "Suggests", "Enhances")`.
  Character string `"all"` is shorthand for that vector, character
  string `"most"` for the same vector without `"Enhances"`, character
  string `"strong"` (default) for the first three elements of that
  vector.

- redact_path:

  a logical indicating whether options that contain "path" in the name
  should be redacted, default = TRUE

- dev_repos:

  Developmental cran-like repos to check, e.g. r-universe repos

## Examples

``` r
# \donttest{
try({
nflverse_sitrep()
ffverse_sitrep()
.sitrep("cachem")
})
#> ── System Info ─────────────────────────────────────────────────────────────────
#> • R version 4.5.2 (2025-10-31) • Running under: Ubuntu 24.04.3 LTS
#> ── Package Status ──────────────────────────────────────────────────────────────
#>   package installed  cran  dev behind
#> 1  cachem     1.1.0 1.1.0 <NA>       
#> ── Package Options ─────────────────────────────────────────────────────────────
#> • No options set for above packages
#> ── Package Dependencies ────────────────────────────────────────────────────────
#> • fastmap (1.2.0)  • rlang (1.1.6)  • utils (4.5.2)  
#> ────────────────────────────────────────────────────────────────────────────────
# }
```
