# Alternate team abbreviation mappings, no relocation

A named character vector mapping common alternate team abbreviations,
but does not follow relocations to their current city.

## Usage

``` r
team_abbr_mapping_norelocate
```

## Format

A named character vector

- name attribute:

  The "alternate" name.

- value attribute:

  The "correct" name.

## Details

You can suggest additions to this table by [opening an issue in
nflreadr](https://github.com/nflverse/nflreadr/issues/new/choose).

## Examples

``` r
# \donttest{
team_abbr_mapping_norelocate[c("STL", "OAK","CRD","BLT", "CLV")]
#>   STL   OAK   CRD   BLT   CLV 
#> "STL" "OAK" "ARI" "BAL" "CLE" 
# }
```
