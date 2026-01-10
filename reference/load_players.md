# Load Players

Load a dataframe of player-level information, including IDs and other
mostly-immutable data (birthdates, college, draft position etc.)

## Usage

``` r
load_players(file_type = getOption("nflreadr.prefer", default = "rds"))
```

## Arguments

- file_type:

  One of `c("rds", "qs", "csv", "parquet")`. Can also be set globally
  with `options(nflreadr.prefer)`

## Value

A tibble with one row per player.

## Details

### Contribute

Please visit
<https://github.com/nflverse/nflverse-players/blob/master/.github/CONTRIBUTING.md>
for a detailed explanation how to contribute (or correct) players data.

### Scope of Players Dataset

The nflverse players dataset aims to be the single source of truth when
it comes to NFL player IDs across various sources (relevant to the
nflverse). The following source IDs and information are considered
in-scope of the nflverse players dataset:

- Basic player information e.g. name, height, weight, age, date of
  birth, years experience, college, status, position, headshot image
  (mostly from GSIS)

- Draft information: draft year, draft round, draft pick, draft team
  (from PFR)

- PFF position and status information

- Primary source IDs from:

  - NFL (`gsis_id`, `smart_id`) - `gsis_id` is the primary key

  - Pro Football Reference (`pfr_id`)

  - Pro Football Focus (`pff_id`)

  - Over The Cap (`otc_id`)

  - Elias Sports Bureau (`esb_id`)

  - ESPN (`espn_id`)

## See also

Issues with this data should be filed here:
<https://github.com/nflverse/nflverse-players>.

[`dictionary_players`](https://nflreadr.nflverse.com/reference/dictionary_players.md)
for the data dictionary as bundled within the package

## Examples

``` r
# \donttest{
try({ # prevents cran errors
  load_players()
})
#> ── nflverse nflverse Players Data ──────────────────────────────────────────────
#> ℹ Data updated: 2026-01-10 08:20:44 UTC
#> # A tibble: 24,356 × 39
#>    gsis_id    display_name     common_first_name first_name last_name short_name
#>    <chr>      <chr>            <chr>             <chr>      <chr>     <chr>     
#>  1 00-0028830 Isaako Aaitui    Isaako            Isaako     Aaitui    NA        
#>  2 00-0038389 Israel Abanikan… Israel            Israel     Abanikan… I.Abanika…
#>  3 00-0024644 Jon Abbate       Jon               Jon        Abbate    NA        
#>  4 ABB498348  Vince Abbott     Vince             Vincent    Abbott    NA        
#>  5 00-0031021 Jared Abbrederis Jared             Jared      Abbreder… J.Abbrede…
#>  6 00-0032860 Mehdi Abdesmad   Mehdi             Mehdi      Abdesmad  M.Abdesmad
#>  7 00-0028564 Isa Abdul-Quddus Isa               Isa        Abdul-Qu… NA        
#>  8 00-0032104 Ameer Abdullah   Ameer             Ameer      Abdullah  A.Abdullah
#>  9 00-0023663 Hamza Abdullah   Hamza             Hamza      Abdullah  NA        
#> 10 00-0025940 Husain Abdullah  Husain            Husain     Abdullah  NA        
#> # ℹ 24,346 more rows
#> # ℹ 33 more variables: football_name <chr>, suffix <chr>, esb_id <chr>,
#> #   nfl_id <chr>, pfr_id <chr>, pff_id <chr>, otc_id <chr>, espn_id <chr>,
#> #   smart_id <chr>, birth_date <chr>, position_group <chr>, position <chr>,
#> #   ngs_position_group <chr>, ngs_position <chr>, height <int>, weight <int>,
#> #   headshot <chr>, college_name <chr>, college_conference <chr>,
#> #   jersey_number <chr>, rookie_season <int>, last_season <int>, …
# }
```
