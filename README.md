
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nflreadr <a href='https:://nflreadr.nflverse.com'><img src='man/figures/logo.svg' align="right" width="25%" min-width="120px" /></a>

<!-- badges: start -->

[![CRAN
status](https://img.shields.io/cran/v/nflreadr?style=flat-square&logo=R&label=CRAN)](https://CRAN.R-project.org/package=nflreadr)
[![Codecov test
coverage](https://img.shields.io/codecov/c/github/nflverse/nflreadr?label=codecov&style=flat-square&logo=codecov)](https://codecov.io/gh/nflverse/nflreadr?branch=main)
[![Dev
status](https://img.shields.io/github/r-package/v/nflverse/nflreadr/main?label=dev%20version&style=flat-square&logo=github)](https://nflreadr.nflverse.com/)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg?style=flat-square)](https://lifecycle.r-lib.org/articles/stages.html)
[![R build
status](https://img.shields.io/github/workflow/status/nflverse/nflreadr/R-CMD-check?label=R%20check&style=flat-square&logo=github)](https://github.com/nflverse/nflreadr/actions)
[![nflverse
discord](https://img.shields.io/discord/591914197219016707.svg?color=5865F2&label=nflverse%20discord&logo=discord&logoColor=5865F2&style=flat-square)](https://discord.com/invite/5Er2FBnnQa)

<!-- badges: end -->

nflreadr is a low-level package for downloading data from nflverse
repositories.

## Installation

Install the development version from GitHub with:

``` r
install.packages("nflreadr", repos = "https://nflverse.r-universe.dev")

# or use remotes/devtools
# install.packages("remotes")
remotes::install_github("nflverse/nflreadr")
```

## Usage

The main functions of `nflreadr` are prefixed with load.

``` r
library(nflreadr)
load_pbp(2020)
```

The following options help configure default `nflreadr` behaviours.

``` r
options(nflreadr.cache) # one of "memory", "filesystem", or "off"
options(nflreadr.prefer) # one of "qs" or "rds"
```

You can also configure `nflreadr` to display progress messages with the
`progressr` package, e.g.

``` r
progressr::with_progress(load_rosters(seasons = 2010:2020))
 |========             |  40%
```

## Getting help

The best places to get help on this package are:

-   the [nflverse discord](https://discord.com/invite/5Er2FBnnQa) (for
    both this package as well as anything R/NFL related)
-   opening [an
    issue](https://github.com/nflverse/nflreadr/issues/new/choose)

## Contributing

Many hands make light work! Here are some ways you can contribute to
this project:

-   You can [open an
    issue](https://github.com/nflverse/nflreadr/issues/new/choose) if
    you’d like to request specific data or report a bug/error.

-   If you’d like to contribute code, please check out [the contribution
    guidelines](https://nflreadr.nflverse.com/CONTRIBUTING.html).

## Terms of Use

The R code for this package is released as open source under the [MIT
License](https://nflreadr.nflverse.com/LICENSE.html). NFL data accessed
by this package belong to their respective owners, and are governed by
their terms of use.
