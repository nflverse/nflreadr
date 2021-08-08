
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nflreadr <a href='https://nflreadr.nflverse.com'><img src='man/figures/logo.svg' align="right" width="25%" min-width="120px" /></a>

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
#> #   yrdln <chr>, ydstogo <dbl>, ydsnet <dbl>, desc <chr>, play_type <chr>,
#> #   yards_gained <dbl>, shotgun <dbl>, no_huddle <dbl>, qb_dropback <dbl>,
#> #   qb_kneel <dbl>, qb_spike <dbl>, qb_scramble <dbl>, pass_length <chr>,
#> #   pass_location <chr>, air_yards <dbl>, yards_after_catch <dbl>,
#> #   run_location <chr>, run_gap <chr>, field_goal_result <chr>,
#> #   kick_distance <dbl>, extra_point_result <chr>, two_point_conv_result <chr>,
#> #   home_timeouts_remaining <dbl>, away_timeouts_remaining <dbl>,
#> #   timeout <dbl>, timeout_team <chr>, td_team <chr>, td_player_name <chr>,
#> #   td_player_id <chr>, posteam_timeouts_remaining <dbl>,
#> #   defteam_timeouts_remaining <dbl>, total_home_score <dbl>,
#> #   total_away_score <dbl>, posteam_score <dbl>, defteam_score <dbl>,
#> #   score_differential <dbl>, posteam_score_post <dbl>,
#> #   defteam_score_post <dbl>, score_differential_post <dbl>,
#> #   no_score_prob <dbl>, opp_fg_prob <dbl>, opp_safety_prob <dbl>,
#> #   opp_td_prob <dbl>, fg_prob <dbl>, safety_prob <dbl>, td_prob <dbl>,
#> #   extra_point_prob <dbl>, two_point_conversion_prob <dbl>, ep <dbl>,
#> #   epa <dbl>, total_home_epa <dbl>, total_away_epa <dbl>,
#> #   total_home_rush_epa <dbl>, total_away_rush_epa <dbl>,
#> #   total_home_pass_epa <dbl>, total_away_pass_epa <dbl>, air_epa <dbl>,
#> #   yac_epa <dbl>, comp_air_epa <dbl>, comp_yac_epa <dbl>,
#> #   total_home_comp_air_epa <dbl>, total_away_comp_air_epa <dbl>,
#> #   total_home_comp_yac_epa <dbl>, total_away_comp_yac_epa <dbl>,
#> #   total_home_raw_air_epa <dbl>, total_away_raw_air_epa <dbl>,
#> #   total_home_raw_yac_epa <dbl>, total_away_raw_yac_epa <dbl>, wp <dbl>,
#> #   def_wp <dbl>, home_wp <dbl>, away_wp <dbl>, wpa <dbl>, vegas_wpa <dbl>,
#> #   vegas_home_wpa <dbl>, home_wp_post <dbl>, away_wp_post <dbl>,
#> #   vegas_wp <dbl>, vegas_home_wp <dbl>, total_home_rush_wpa <dbl>,
#> #   total_away_rush_wpa <dbl>, total_home_pass_wpa <dbl>,
#> #   total_away_pass_wpa <dbl>, air_wpa <dbl>, ...
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

## Configuration

The following options help configure default `nflreadr` behaviours.

``` r
options(nflreadr.cache) # one of "memory", "filesystem", or "off"
options(nflreadr.prefer) # one of "qs" or "rds"
```

You can also configure `nflreadr` to display progress messages with the
[`progressr` package](https://progressr.futureverse.org), e.g.

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
