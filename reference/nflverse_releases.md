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
#> ℹ Data updated: 2026-01-18 10:35:24 UTC
#> # A tibble: 25 × 8
#>    release_name   release_description timestamp   rds parquet   csv csv_gz   zip
#>    <chr>          <chr>               <chr>     <int>   <int> <int>  <int> <int>
#>  1 pbp            "Play by play data… 2026-01-…    27      27    27     27    23
#>  2 contracts      "OverTheCap contra… 2026-01-…     2       1     0      1     0
#>  3 schedules      "NFL game/schedule… 2026-01-…     1       1     1      1     0
#>  4 pfr_advstats   "PFR Adv Stats dat… 2026-01-…    68      36    36     12     0
#>  5 misc           "Various bits of d… 2026-01-…     7       1     6      0     0
#>  6 stats_team     "Team stats in dif… 2026-01-…   108     108   108    108     0
#>  7 stats_player   "Player stats in d… 2026-01-…   108     108   108    108     0
#>  8 espn_data      "ESPN Stats"        2026-01-…     2       2     2      2     0
#>  9 players        "Player informatio… 2026-01-…     1       1     1      1     0
#> 10 players_compo… "Component files f… 2026-01-…     2       2     2      2     0
#> # ℹ 15 more rows
# }
```
