# Load Latest FantasyPros Rankings

Accesses DynastyProcess.com's repository of the latest FP expert
consensus rankings - updated on a weekly basis.

## Usage

``` r
load_ff_rankings(type = c("draft", "week", "all"))
```

## Arguments

- type:

  one of "draft" (preseason), "week" (this week, inseason), or "all"
  (full archive)

## Value

a dataframe of expert consensus rankings

## See also

<https://nflreadr.nflverse.com/articles/dictionary_ff_rankings.html> for
the web data dictionary

<https://www.fantasypros.com> for the source of data

Issues with this data should be filed here:
<https://github.com/dynastyprocess/data>

## Examples

``` r
# \donttest{
try({ # prevents cran errors
load_ff_rankings()
})
#> ── nflverse FP expert rankings ─────────────────────────────────────────────────
#> ℹ Data updated: 2025-11-20 13:47:31 UTC
#> # A tibble: 5,500 × 25
#>    fp_page   page_type ecr_type player id    pos   team    ecr    sd  best worst
#>    <chr>     <chr>     <chr>    <chr>  <chr> <chr> <chr> <dbl> <dbl> <dbl> <dbl>
#>  1 /nfl/ran… dynasty-… dp       Derwi… 17310 DB    LAC    2.67  1.7      1     5
#>  2 /nfl/ran… dynasty-… dp       Kyle … 23494 DB    BAL    2.83  1.34     1     5
#>  3 /nfl/ran… dynasty-… dp       Brian… 25235 DB    DET    2.83  1.07     1     4
#>  4 /nfl/ran… dynasty-… dp       Antoi… 19266 DB    TB     3.33  0.75     2     4
#>  5 /nfl/ran… dynasty-… dp       Xavie… 19216 DB    GB     8.33  5.09     5    19
#>  6 /nfl/ran… dynasty-… dp       Budda… 16733 DB    ARI    9.17  3.76     6    16
#>  7 /nfl/ran… dynasty-… dp       Jessi… 17544 DB    ATL    9.67  2.81     7    14
#>  8 /nfl/ran… dynasty-… dp       Jaqua… 23719 DB    CHI   11     1.63     8    13
#>  9 /nfl/ran… dynasty-… dp       Joshu… 19580 DB    MIN   13     3.32     7    17
#> 10 /nfl/ran… dynasty-… dp       Kyle … 19337 DB    PIT   15.2  14.2      8    47
#> # ℹ 5,490 more rows
#> # ℹ 14 more variables: sportsdata_id <chr>, player_filename <chr>,
#> #   yahoo_id <chr>, cbs_id <chr>, player_owned_avg <dbl>,
#> #   player_owned_espn <dbl>, player_owned_yahoo <dbl>, player_image_url <chr>,
#> #   player_square_image_url <chr>, rank_delta <dbl>, bye <dbl>,
#> #   mergename <chr>, scrape_date <date>, tm <chr>
# }
```
