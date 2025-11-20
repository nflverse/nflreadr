# List all available nflverse releases

This functions lists all nflverse data releases that are available in
the nflverse-data repo. Release names can be used for downloads in
[`nflverse_download()`](https://nflreadr.nflverse.com/reference/nflverse_download.md).

## Usage

``` r
nflverse_releases(.token = "default")
```

## Arguments

- .token:

  a GitHub API token, `"default"` uses
  [`gh::gh_token()`](https://gh.r-lib.org/reference/gh_token.html)

## Value

A dataframe containing release names, release descriptions, and other
relevant release information.

## Examples

``` r
# \donttest{

try( # avoids cran failures, can skip in normal usage
nflverse_releases()
)
#> ── nflverse release listing ────────────────────────────────────────────────────
#> ℹ Data updated: 2025-11-20 13:48:05 UTC
#> # A tibble: 25 × 8
#>    release_name  release_description  timestamp   rds parquet   csv csv_gz   zip
#>    <chr>         <chr>                <chr>     <int>   <int> <int>  <int> <int>
#>  1 schedules      NA                  2025-11-…     1       1     1      1     0
#>  2 pfr_advstats  "PFR Adv Stats data… 2025-11-…    68      36    36     12     0
#>  3 misc          "Various bits of da… 2025-11-…     7       1     6      0     0
#>  4 stats_team     NA                  2025-11-…   107     107   107    107     0
#>  5 stats_player   NA                  2025-11-…   107     107   107    107     0
#>  6 pbp           "Play by play data,… 2025-11-…    27      27    27     27    23
#>  7 espn_data     "ESPN Stats"         2025-11-…     2       2     2      2     0
#>  8 players       "Player information… 2025-11-…     1       1     1      1     0
#>  9 contracts     "OverTheCap contrac… 2025-11-…     2       1     0      1     0
#> 10 nextgen_stats "NFL Next Gen Stats… 2025-11-…    30       3     0     30     0
#> # ℹ 15 more rows
# }
```
