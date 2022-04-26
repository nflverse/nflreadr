
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
stable](https://img.shields.io/badge/lifecycle-stable-green.svg?style=flat-square)](https://lifecycle.r-lib.org/articles/stages.html)
[![R build
status](https://img.shields.io/github/workflow/status/nflverse/nflreadr/R-CMD-check?label=R%20check&style=flat-square&logo=github)](https://github.com/nflverse/nflreadr/actions)
[![nflverse
discord](https://img.shields.io/discord/789805604076126219?color=7289da&label=nflverse%20discord&logo=discord&logoColor=fff&style=flat-square)](https://discord.com/invite/5Er2FBnnQa)

<!-- badges: end -->

nflreadr is a minimal package for downloading data from nflverse
repositories. It includes caching, optional progress updates, and data
dictionaries.

Please note that nflverse data repositories have been reorganized and
pushed towards the
[nflverse-data](https://github.com/nflverse/nflverse-data) repo, and
v1.2.0+ is the minimum version that supports this change. We encourage
all users to upgrade to this version immediately.

For Python access to nflverse data, please check out
[nfl-data-py](https://pypi.org/project/nfl-data-py/) - maintained by
Cooper Adams.

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

load_pbp(2021)
#> -- nflverse play by play -------------------------------------------------------
#> i Data updated: 2022-03-18 00:40:27 EDT
#> # A tibble: 50,712 x 372
#>    pla~1 gam~2 old~3 hom~4 awa~5 sea~6  week pos~7 pos~8 def~9 sid~* yar~* gam~*
#>    <dbl> <chr> <chr> <chr> <chr> <chr> <int> <chr> <chr> <chr> <chr> <dbl> <chr>
#>  1     1 2021~ 2021~ TEN   ARI   REG       1 <NA>  <NA>  <NA>  <NA>     NA 2021~
#>  2    40 2021~ 2021~ TEN   ARI   REG       1 TEN   home  ARI   ARI      35 2021~
#>  3    55 2021~ 2021~ TEN   ARI   REG       1 TEN   home  ARI   TEN      75 2021~
#>  4    76 2021~ 2021~ TEN   ARI   REG       1 TEN   home  ARI   TEN      78 2021~
#>  5   100 2021~ 2021~ TEN   ARI   REG       1 TEN   home  ARI   TEN      75 2021~
#>  6   122 2021~ 2021~ TEN   ARI   REG       1 TEN   home  ARI   TEN      75 2021~
#>  7   152 2021~ 2021~ TEN   ARI   REG       1 ARI   away  TEN   ARI      61 2021~
#>  8   181 2021~ 2021~ TEN   ARI   REG       1 ARI   away  TEN   TEN      23 2021~
#>  9   218 2021~ 2021~ TEN   ARI   REG       1 ARI   away  TEN   TEN      31 2021~
#> 10   253 2021~ 2021~ TEN   ARI   REG       1 ARI   away  TEN   TEN      30 2021~
#> # ... with 50,702 more rows, abbreviated variable names 1: play_id, 2: game_id,
#> #   3: old_game_id, 4: home_team, 5: away_team, 6: season_type, 7: posteam,
#> #   8: posteam_type, 9: defteam, *: side_of_field, *: yardline_100,
#> #   *: game_date, and 359 more variables: quarter_seconds_remaining <dbl>,
#> #   half_seconds_remaining <dbl>, game_seconds_remaining <dbl>,
#> #   game_half <chr>, quarter_end <dbl>, drive <dbl>, sp <dbl>, qtr <dbl>,
#> #   down <dbl>, goal_to_go <dbl>, ...

load_player_stats(2021)
#> -- nflverse player stats: offense ----------------------------------------------
#> i Data updated: 2022-03-09 15:34:12 EST
#> # A tibble: 5,698 x 48
#>    pla~1 pla~2 rec~3 sea~4  week sea~5 com~6 att~7 pas~8 pas~9 int~* sacks sac~*
#>    <chr> <chr> <chr> <int> <int> <chr> <int> <int> <dbl> <int> <dbl> <dbl> <dbl>
#>  1 00-0~ T.Br~ TB     2021     1 REG      32    50   379     4     2     0     0
#>  2 00-0~ T.Br~ TB     2021     2 REG      24    36   276     5     0     3    17
#>  3 00-0~ T.Br~ TB     2021     3 REG      41    55   432     1     0     3    21
#>  4 00-0~ T.Br~ TB     2021     4 REG      22    43   269     0     0     1     8
#>  5 00-0~ T.Br~ TB     2021     5 REG      30    41   411     5     0     2    15
#>  6 00-0~ T.Br~ TB     2021     6 REG      34    42   297     2     1     0     0
#>  7 00-0~ T.Br~ TB     2021     7 REG      20    36   211     4     0     0     0
#>  8 00-0~ T.Br~ TB     2021     8 REG      28    40   375     4     2     3    25
#>  9 00-0~ T.Br~ TB     2021    10 REG      23    34   220     2     2     0     0
#> 10 00-0~ T.Br~ TB     2021    11 REG      30    46   307     2     1     0     0
#> # ... with 5,688 more rows, abbreviated variable names 1: player_id,
#> #   2: player_name, 3: recent_team, 4: season, 5: season_type, 6: completions,
#> #   7: attempts, 8: passing_yards, 9: passing_tds, *: interceptions,
#> #   *: sack_yards, and 35 more variables: sack_fumbles <int>,
#> #   sack_fumbles_lost <int>, passing_air_yards <dbl>,
#> #   passing_yards_after_catch <dbl>, passing_first_downs <dbl>,
#> #   passing_epa <dbl>, passing_2pt_conversions <int>, pacr <dbl>, ...
```

## Data Sources

Data accessed by this package is stored on GitHub and can typically be
found in one of the following repositories:

-   [nflverse/nflverse-data](https://github.com/nflverse/nflverse-data)
-   [nflverse/nfldata](https://github.com/nflverse/nfldata)
-   [nflverse/espnscrapeR-data](https://github.com/nflverse/espnscrapeR-data)
-   [dynastyprocess/data](https://github.com/dynastyprocess/data)
-   [ffverse/ffopportunity](https://github.com/ffverse/ffopportunity)

For a full list of functions, please see the [reference
page](https://nflreadr.nflverse.com/reference/index.html).

This data is maintained by the nflverse project team and is primarily
automated via GitHub Actions. You can check the status and schedules
page here: <https://github.com/nflverse/nflverse-data>

## Configuration

The following options help configure default `nflreadr` behaviours.

``` r
options(nflreadr.verbose) 
# TRUE/FALSE to silence messages such as cache warnings
options(nflreadr.cache) 
# one of "memory", "filesystem", or "off"
options(nflreadr.prefer) 
# one of "qs", "rds", "parquet", or "csv"
options(nflreadr.download_path)
# defaults to current working directory - change to specify where `download_nflverse()` places data.
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
