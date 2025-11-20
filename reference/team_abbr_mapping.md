# Alternate team abbreviation mappings

A named character vector mapping common alternate team abbreviations.

## Usage

``` r
team_abbr_mapping
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

## See also

`team_abbr_mapping_norelocate` for the same thing but relocations stay
in their original cities.

## Examples

``` r
# \donttest{
team_abbr_mapping[c("STL", "OAK","CRD","BLT", "CLV")]
#>   STL   OAK   CRD   BLT   CLV 
#>  "LA"  "LV" "ARI" "BAL" "CLE" 
# }
```
