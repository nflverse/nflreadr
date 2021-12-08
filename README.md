
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nflreadr <a href='https://nflreadr.nflverse.com'><img src='man/figures/logo.svg' align="right" width="25%" min-width="120px" /></a>

<!-- badges: start -->

[![CRAN
status](https://img.shields.io/cran/v/nflreadr?style=flat-square&logo=R&label=CRAN)](https://CRAN.R-project.org/package=nflreadr)
[![Codecov test
coverage](https://img.shields.io/codecov/c/github/nflverse/nflreadr?label=codecov&style=flat-square&logo=codecov)](https://app.codecov.io/gh/nflverse/nflreadr?branch=main)
[![Dev
status](https://img.shields.io/github/r-package/v/nflverse/nflreadr/main?label=dev%20version&style=flat-square&logo=github)](https://nflreadr.nflverse.com/)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg?style=flat-square)](https://lifecycle.r-lib.org/articles/stages.html)
[![R build
status](https://img.shields.io/github/workflow/status/nflverse/nflreadr/R-CMD-check?label=R%20check&style=flat-square&logo=github)](https://github.com/nflverse/nflreadr/actions)
[![nflverse
discord](https://img.shields.io/discord/789805604076126219?color=7289da&label=nflverse%20discord&logo=discord&logoColor=fff&style=flat-square)](https://discord.com/invite/5Er2FBnnQa)

<!-- badges: end -->

nflreadr is a minimal package for downloading data from nflverse
repositories. It includes caching, optional progress updates, and data
dictionaries.

## Installation

Install the stable version from CRAN with:

``` r
install.packages("nflreadr")
```

Install the development version from GitHub with:

``` r
install.packages("nflreadr", repos = "https://nflverse.r-universe.dev")

# or use remotes/devtools
# install.packages("remotes")
remotes::install_github("nflverse/nflreadr")
```

## Usage

The main functions of `nflreadr` are prefixed with `load_`.

``` r
library(nflreadr)
load_pbp(2020)
#> # A tibble: 48,514 x 372
#>    play_id game_id     old_game_id home_team away_team season_type  week posteam
#>      <dbl> <chr>       <chr>       <chr>     <chr>     <chr>       <int> <chr>  
#>  1       1 2020_01_AR~ 2020091311  SF        ARI       REG             1 <NA>   
#>  2      39 2020_01_AR~ 2020091311  SF        ARI       REG             1 SF     
#>  3      54 2020_01_AR~ 2020091311  SF        ARI       REG             1 SF     
#>  4      93 2020_01_AR~ 2020091311  SF        ARI       REG             1 SF     
#>  5     118 2020_01_AR~ 2020091311  SF        ARI       REG             1 SF     
#>  6     143 2020_01_AR~ 2020091311  SF        ARI       REG             1 SF     
#>  7     165 2020_01_AR~ 2020091311  SF        ARI       REG             1 SF     
#>  8     197 2020_01_AR~ 2020091311  SF        ARI       REG             1 SF     
#>  9     226 2020_01_AR~ 2020091311  SF        ARI       REG             1 ARI    
#> 10     245 2020_01_AR~ 2020091311  SF        ARI       REG             1 ARI    
#> # ... with 48,504 more rows, and 364 more variables: posteam_type <chr>,
#> #   defteam <chr>, side_of_field <chr>, yardline_100 <dbl>, game_date <chr>,
#> #   quarter_seconds_remaining <dbl>, half_seconds_remaining <dbl>,
#> #   game_seconds_remaining <dbl>, game_half <chr>, quarter_end <dbl>,
#> #   drive <dbl>, sp <dbl>, qtr <dbl>, down <dbl>, goal_to_go <dbl>, time <chr>,
#> #   yrdln <chr>, ydstogo <dbl>, ydsnet <dbl>, desc <chr>, ...
```

## Data Sources

Data accessed by this package is stored on GitHub and can typically be
found in one of the following repositories:

-   [nflverse/nflfastR-data](https://github.com/nflverse/nflfastR-data)
-   [nflverse/nfldata](https://github.com/nflverse/nfldata)
-   [nflverse/nflfastR-roster](https://github.com/nflverse/nflfastR-roster)
-   [nflverse/espnscrapeR-data](https://github.com/nflverse/espnscrapeR-data)
-   [dynastyprocess/data](https://github.com/dynastyprocess/data)

For a full list of functions, please see the [reference
page](https://nflreadr.nflverse.com/reference/index.html).

This data is maintained by the nflverse project team and is primarily
automated via GitHub Actions. You can check the status and schedules
page here: <https://github.com/nflverse/status>

For Python access to nflverse data, please check out
[nfl-data-py](https://pypi.org/project/nfl-data-py/) which is maintained
by Cooper Adams.

## Configuration

The following options help configure default `nflreadr` behaviours.

``` r
options(nflreadr.cache) # one of "memory", "filesystem", or "off"
options(nflreadr.cache_warning) # FALSE to silence the reminder, which happens every eight hours or so.
options(nflreadr.prefer) # one of "qs" or "rds"
```

You can also configure `nflreadr` to display progress messages with the
[`progressr` package](https://progressr.futureverse.org), e.g.

``` r
progressr::with_progress(load_rosters(seasons = 2010:2020))
 |========            |  40%
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
