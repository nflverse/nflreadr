# Load NFL Team Graphics, Colors, and Logos

Loads team graphics, colors, and logos - useful for plots!

## Usage

``` r
load_teams(
  current = TRUE,
  file_type = getOption("nflreadr.prefer", default = "rds")
)
```

## Arguments

- current:

  If `TRUE` (the default), returns a standardized list of current teams
  only, with abbreviations as per
  [team_abbr_mapping](https://nflreadr.nflverse.com/reference/team_abbr_mapping.md).

- file_type:

  One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally
  with `options(nflreadr.prefer)`

## Value

A tibble of team-level image URLs and hex color codes.

## See also

Issues with this data should be filed here:
<https://github.com/nflverse/nflverse-pbp>

## Examples

``` r
# \donttest{
try({ # prevents cran errors
  load_teams()
})
#> ── nflverse teams data ─────────────────────────────────────────────────────────
#> ℹ Data updated: 2025-10-01 08:03:15 UTC
#> # A tibble: 32 × 16
#>    team_abbr team_name      team_id team_nick team_conf team_division team_color
#>    <chr>     <chr>            <int> <chr>     <chr>     <chr>         <chr>     
#>  1 ARI       Arizona Cardi…    3800 Cardinals NFC       NFC West      #97233F   
#>  2 ATL       Atlanta Falco…     200 Falcons   NFC       NFC South     #A71930   
#>  3 BAL       Baltimore Rav…     325 Ravens    AFC       AFC North     #241773   
#>  4 BUF       Buffalo Bills      610 Bills     AFC       AFC East      #00338D   
#>  5 CAR       Carolina Pant…     750 Panthers  NFC       NFC South     #0085CA   
#>  6 CHI       Chicago Bears      810 Bears     NFC       NFC North     #0B162A   
#>  7 CIN       Cincinnati Be…     920 Bengals   AFC       AFC North     #FB4F14   
#>  8 CLE       Cleveland Bro…    1050 Browns    AFC       AFC North     #FF3C00   
#>  9 DAL       Dallas Cowboys    1200 Cowboys   NFC       NFC East      #002244   
#> 10 DEN       Denver Broncos    1400 Broncos   AFC       AFC West      #002244   
#> # ℹ 22 more rows
#> # ℹ 9 more variables: team_color2 <chr>, team_color3 <chr>, team_color4 <chr>,
#> #   team_logo_wikipedia <chr>, team_logo_espn <chr>, team_wordmark <chr>,
#> #   team_conference_logo <chr>, team_league_logo <chr>, team_logo_squared <chr>
# }
```
