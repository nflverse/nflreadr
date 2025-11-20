# Alternate player name mappings

A named character vector mapping common alternate names, re-exported
from `ffscrapr`.

## Usage

``` r
player_name_mapping
```

## Format

A named character vector

- name attribute:

  The "alternate" name.

- value attribute:

  The "correct" name.

## Details

You can suggest additions to this table by [opening an issue in
ffscrapr](https://github.com/ffverse/ffscrapr/issues/new/choose).

## Examples

``` r
# \donttest{
player_name_mapping[c("Chatarius Atwell", "Robert Kelley")]
#> Chatarius Atwell    Robert Kelley 
#>    "Tutu Atwell"     "Rob Kelley" 
# }
```
