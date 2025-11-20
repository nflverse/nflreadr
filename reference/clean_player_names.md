# Create Player Merge Names

Applies some name-cleaning heuristics to facilitate joins. These
heuristics may include:

- removing periods and apostrophes

- removing common suffixes, such as Jr, Sr, II, III, IV

- converting to lowercase

- using `ffscrapr::dp_name_mapping` to do common name substitutions,
  such as Mitch Trubisky to Mitchell Trubisky

## Usage

``` r
clean_player_names(
  player_name,
  lowercase = FALSE,
  convert_lastfirst = TRUE,
  use_name_database = TRUE,
  convert_to_ascii = rlang::is_installed("stringi")
)
```

## Arguments

- player_name:

  a character vector of player names

- lowercase:

  defaults to FALSE - if TRUE, converts to lowercase

- convert_lastfirst:

  defaults to TRUE - converts names from "Last, First" to "First Last"

- use_name_database:

  uses internal name database to do common substitutions (Mitchell
  Trubisky to Mitch Trubisky etc)

- convert_to_ascii:

  If `TRUE`, will transliterate to latin-ascii via the stringi package.
  Defaults to `TRUE` if the stringi package is installed.

## Value

a character vector of cleaned names

## Details

Equivalent to the operation done by `ffscrapr::dp_clean_names()` and
uses the same player name database.

## Examples

``` r
clean_player_names(c("A.J. Green", "Odell Beckham Jr.  ", "Le'Veon Bell Sr."))
#> [1] "AJ Green"      "Odell Beckham" "LeVeon Bell"  

clean_player_names(c("Trubisky,      Mitch", "Atwell, Chatarius", "Elliott, Zeke", "Elijah Moore"),
                  convert_lastfirst = TRUE)
#> [1] "Mitchell Trubisky" "Tutu Atwell"       "Ezekiel Elliott"  
#> [4] "Elijah Moore"     
```
