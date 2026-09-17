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
#> ℹ Data updated: 2026-09-17 12:46:42 UTC
#> # A tibble: 4,925 × 25
#>    fp_page   page_type ecr_type player id    pos   team    ecr    sd  best worst
#>    <chr>     <chr>     <chr>    <chr>  <chr> <chr> <chr> <dbl> <dbl> <dbl> <dbl>
#>  1 /nfl/ran… dynasty-… dp       Kyle … 23494 DB    BAL     2     1       1     3
#>  2 /nfl/ran… dynasty-… dp       Nick … 27053 DB    SEA     2     0       2     2
#>  3 /nfl/ran… dynasty-… dp       Derwi… 17310 DB    LAC     4.5   0.5     4     5
#>  4 /nfl/ran… dynasty-… dp       Nick … 24198 DB    WAS     5.5   4.5     1    10
#>  5 /nfl/ran… dynasty-… dp       Kam C… 19459 DB    LAR     7     4       3    11
#>  6 /nfl/ran… dynasty-… dp       Tykee… 23751 DB    TB      9.5   1.5     8    11
#>  7 /nfl/ran… dynasty-… dp       Jessi… 17544 DB    ATL    10.5   3.5     7    14
#>  8 /nfl/ran… dynasty-… dp       Budda… 16733 DB    ARI    11     6       5    17
#>  9 /nfl/ran… dynasty-… dp       Antoi… 19266 DB    TB     11.5   5.5     6    17
#> 10 /nfl/ran… dynasty-… dp       Talan… 22817 DB    DEN    13     0      13    13
#> # ℹ 4,915 more rows
#> # ℹ 14 more variables: sportsdata_id <chr>, player_filename <chr>,
#> #   yahoo_id <chr>, cbs_id <chr>, player_owned_avg <dbl>,
#> #   player_owned_espn <dbl>, player_owned_yahoo <dbl>, player_image_url <chr>,
#> #   player_square_image_url <chr>, rank_delta <dbl>, bye <dbl>,
#> #   mergename <chr>, scrape_date <date>, tm <chr>
# }
```
