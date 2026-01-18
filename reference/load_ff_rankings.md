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
#> ℹ Data updated: 2026-01-18 10:34:45 UTC
#> # A tibble: 4,962 × 25
#>    fp_page   page_type ecr_type player id    pos   team    ecr    sd  best worst
#>    <chr>     <chr>     <chr>    <chr>  <chr> <chr> <chr> <dbl> <dbl> <dbl> <dbl>
#>  1 /nfl/ran… best-dst  bp       Denve… 8090  DST   DEN     1    0        1     1
#>  2 /nfl/ran… best-dst  bp       Phila… 8230  DST   PHI     2.4  0.49     2     3
#>  3 /nfl/ran… best-dst  bp       Pitts… 8240  DST   PIT     2.8  0.4      2     3
#>  4 /nfl/ran… best-dst  bp       Balti… 8020  DST   BAL     4.6  0.49     4     5
#>  5 /nfl/ran… best-dst  bp       Minne… 8170  DST   MIN     5.4  1.2      4     7
#>  6 /nfl/ran… best-dst  bp       Kansa… 8150  DST   KC      7    1.41     5     9
#>  7 /nfl/ran… best-dst  bp       Detro… 8100  DST   DET     8    0.89     7     9
#>  8 /nfl/ran… best-dst  bp       Buffa… 8030  DST   BUF     8.2  1.6      6    10
#>  9 /nfl/ran… best-dst  bp       Los A… 8250  DST   LAC     9.2  1.47     7    11
#> 10 /nfl/ran… best-dst  bp       New Y… 8210  DST   NYJ     9.6  2.42     6    13
#> # ℹ 4,952 more rows
#> # ℹ 14 more variables: sportsdata_id <chr>, player_filename <chr>,
#> #   yahoo_id <chr>, cbs_id <chr>, player_owned_avg <dbl>,
#> #   player_owned_espn <dbl>, player_owned_yahoo <dbl>, player_image_url <chr>,
#> #   player_square_image_url <chr>, rank_delta <dbl>, bye <dbl>,
#> #   mergename <chr>, scrape_date <date>, tm <chr>
# }
```
