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
#> ℹ Data updated: 2026-09-07 17:11:24 UTC
#> # A tibble: 5,850 × 25
#>    fp_page   page_type ecr_type player id    pos   team    ecr    sd  best worst
#>    <chr>     <chr>     <chr>    <chr>  <chr> <chr> <chr> <dbl> <dbl> <dbl> <dbl>
#>  1 /nfl/ran… best-dst  bp       Houst… 8120  DST   HOU    1     0        1     1
#>  2 /nfl/ran… best-dst  bp       Denve… 8090  DST   DEN    2     0        2     2
#>  3 /nfl/ran… best-dst  bp       Seatt… 8260  DST   SEA    3     0        3     3
#>  4 /nfl/ran… best-dst  bp       Los A… 8280  DST   LAR    4     0        4     4
#>  5 /nfl/ran… best-dst  bp       Phila… 8230  DST   PHI    5.38  0.99     5     8
#>  6 /nfl/ran… best-dst  bp       Minne… 8170  DST   MIN    6     0        6     6
#>  7 /nfl/ran… best-dst  bp       New E… 8180  DST   NE     7.38  0.7      7     9
#>  8 /nfl/ran… best-dst  bp       Jacks… 8140  DST   JAC    8.38  0.99     8    11
#>  9 /nfl/ran… best-dst  bp       Los A… 8250  DST   LAC    9.13  0.33     9    10
#> 10 /nfl/ran… best-dst  bp       Green… 8110  DST   GB    10.5   1.32    10    14
#> # ℹ 5,840 more rows
#> # ℹ 14 more variables: sportsdata_id <chr>, player_filename <chr>,
#> #   yahoo_id <chr>, cbs_id <chr>, player_owned_avg <dbl>,
#> #   player_owned_espn <dbl>, player_owned_yahoo <dbl>, player_image_url <chr>,
#> #   player_square_image_url <chr>, rank_delta <dbl>, bye <dbl>,
#> #   mergename <chr>, scrape_date <date>, tm <chr>
# }
```
