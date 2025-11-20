# Coalescing join

EXPERIMENTAL! This function joins two dataframes together by key, and
then coalesces any columns that have shared names (i.e. fills in NAs). A
utility function primarily used internally within nflverse to help build
player IDs

## Usage

``` r
join_coalesce(
  x,
  y,
  by = NULL,
  type = c("left", "inner", "full"),
  ...,
  by.x = NULL,
  by.y = NULL,
  sort = TRUE,
  incomparables = c(NA, NaN)
)
```

## Arguments

- x, y:

  dataframes. Will be coerced to data.table

- by:

  keys to join on, as a plain or named character vector

- type:

  one of "left" (all rows of x and matching rows of y), "inner"
  (matching rows of x and y), "full" (all rows of x and y)

- ...:

  other args passed to
  [`merge.data.frame()`](https://rdrr.io/r/base/merge.html)

- by.x, by.y:

  alternate form of keys to join on - if provided, will override `by`.

- sort:

  whether to sort output by the join keys

- incomparables:

  keys to NOT match on, i.e. NA should not match on NA.

## Value

a data.frame joining x and y dataframes together, with every column from
both x and y and patching NA values in x with those in y.

## Examples

``` r
x <- data.frame(id1 = c(NA_character_,letters[1:4]), a = c(1,NA,3,NA,5), b = 1:5 * 10)
y <- data.frame(id2 = c(letters[3:11],NA_character_), a = -(1:10), c = 1:10 * 100)

join_coalesce(x,y, by = c("id1"="id2"))
#> Warning: Join `by` keys in x have NAs
#> Join `by` keys in y have NAs
#>    id1  a  b   c
#> 1    a NA 20  NA
#> 2    b  3 30  NA
#> 3    c -1 40 100
#> 4    d  5 50 200
#> 5 <NA>  1 10  NA
join_coalesce(x,y, by.x = "id1", by.y = "id2")
#> Warning: Join `by` keys in x have NAs
#> Join `by` keys in y have NAs
#>    id1  a  b   c
#> 1    a NA 20  NA
#> 2    b  3 30  NA
#> 3    c -1 40 100
#> 4    d  5 50 200
#> 5 <NA>  1 10  NA
join_coalesce(x,y, by = c("id1"="id2"), type = "inner")
#> Warning: Join `by` keys in x have NAs
#> Join `by` keys in y have NAs
#>   id1  a  b   c
#> 1   c -1 40 100
#> 2   d  5 50 200
join_coalesce(x,y, by = c("id1"="id2"), type = "full")
#> Warning: Join `by` keys in x have NAs
#> Join `by` keys in y have NAs
#>     id1   a  b    c
#> 1     a  NA 20   NA
#> 2     b   3 30   NA
#> 3     c  -1 40  100
#> 4     d   5 50  200
#> 5     e  -3 NA  300
#> 6     f  -4 NA  400
#> 7     g  -5 NA  500
#> 8     h  -6 NA  600
#> 9     i  -7 NA  700
#> 10    j  -8 NA  800
#> 11    k  -9 NA  900
#> 12 <NA>   1 10   NA
#> 13 <NA> -10 NA 1000
```
