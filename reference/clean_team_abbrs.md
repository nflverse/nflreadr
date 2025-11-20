# Standardize NFL Team Abbreviations

This function standardizes NFL team names, abbreviations, and nicknames
to nflverse defaults. This helps for joins and plotting, especially with
the nflplotR package!

## Usage

``` r
clean_team_abbrs(abbr, current_location = TRUE, keep_non_matches = TRUE)
```

## Arguments

- abbr:

  a character vector of abbreviations, full team names, or team
  nicknames

- current_location:

  If `TRUE` (the default), the abbreviation of the most recent team
  location will be used.

- keep_non_matches:

  If `TRUE` (the default) an element of `abbr` that can't be matched to
  any of the internal mapping vectors will be kept as is. Otherwise it
  will be replaced with `NA`.

## Value

A character vector with the length of `abbr` and cleaned team
abbreviations if they are included in
[`team_abbr_mapping`](https://nflreadr.nflverse.com/reference/team_abbr_mapping.md)
or
[`team_abbr_mapping_norelocate`](https://nflreadr.nflverse.com/reference/team_abbr_mapping_norelocate.md)
(depending on the value of `current_location`). Non matches may be
replaced with `NA` (depending on the value of `keep_non_matches`).

## Examples

``` r
x <- c("PIE", "LAR", "PIT", "CRD", "OAK", "SL", "Niners", "San Diego Chargers")
# use current location and keep non matches
clean_team_abbrs(x)
#> [1] "PIE" "LA"  "PIT" "ARI" "LV"  "LA"  "SF"  "LAC"

# keep old location and replace non matches
clean_team_abbrs(x, current_location = FALSE, keep_non_matches = FALSE)
#> [1] NA    "LA"  "PIT" "ARI" "OAK" "STL" "SF"  "SD" 
```
