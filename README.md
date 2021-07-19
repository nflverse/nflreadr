
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nflreadr

<!-- badges: start -->
<!-- [![CRAN status](https://img.shields.io/cran/v/nflreadr?style=flat-square&logo=R&label=CRAN)](https://CRAN.R-project.org/package=nflreadr)  -->

[![Dev
status](https://img.shields.io/github/r-package/v/nflverse/nflreadr/main?label=dev&style=flat-square&logo=github)](https://nflreadr.nflverse.com/)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg?style=flat-square)](https://lifecycle.r-lib.org/articles/stages.html)
[![R build
status](https://img.shields.io/github/workflow/status/nflverse/nflreadr/R-CMD-check?label=R%20check&style=flat-square&logo=github)](https://github.com/nflverse/nflreadr/actions)
[![Codecov test
coverage](https://img.shields.io/codecov/c/github/nflverse/nflloadr?label=codecov&style=flat-square&logo=codecov)](https://codecov.io/gh/nflverse/nflloadr?branch=main)
[![nflverse
discord](https://img.shields.io/discord/591914197219016707.svg?color=5865F2&label=nflverse%20discord&logo=discord&logoColor=5865F2&style=flat-square)](https://discord.com/invite/5Er2FBnnQa)

<!-- badges: end -->

nflloadr is a low-level package for downloading data from nflverse
repositories.

## Installation

Install the development version from GitHub with:

``` r
install.packages("nflloadr", repos = "https://nflverse.r-universe.dev")

# or use remotes/devtools
# install.packages("remotes")
remotes::install_github("nflverse/nflloadr", ref = "dev")
```

## Roadmap

This package `must` include:

-   Functions for loading:
    -   pbp
    -   player\_stats (aggregated by week or season)
    -   team\_stats (aggregated by week or season)
    -   schedules (aka Lee’s game data)
    -   rosters
    -   Next Gen Stats data
    -   export general `rds_from_url()` function (without littering
        connections) for future files
    -   … ?
-   CRAN (because we want to introduce it as a dependency for other
    packages)

It would be nice if this package included:

-   Memoised/cached data by default
-   Optional parallel processing (?) -&gt; we can do this with
    `parallel::mclapply()` in combination with `do.call("rbind", ...)`
    to avoid the `future` and `furrr` dependencies

Design decisions:

-   Optimize for minimum dependencies (?)
-   Optimize for speed (?)
