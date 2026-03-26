# Statistical Mode

Computes the statistical mode, i.e. the value that appears most often in
a vector. Returns the first match, if TRUE for multiple values.

## Usage

``` r
stat_mode(x, ..., na.rm = FALSE)
```

## Arguments

- x:

  A vector of data values.

- ...:

  Further arguments, currently unused.

- na.rm:

  a logical evaluating to `TRUE` or `FALSE` indicating whether `NA`
  values should be stripped before the computation proceeds.

## Value

The statistical mode with the same type as the input vector x.

## Examples

``` r
vector_numeric <- sample(1:5, 15, TRUE)
vector_numeric
#>  [1] 5 4 5 4 1 5 5 5 2 3 3 5 5 4 5
stat_mode(vector_numeric)
#> [1] 5

vector_character <- sample(LETTERS[1:5], 15, TRUE)
vector_character
#>  [1] "B" "D" "B" "C" "A" "C" "E" "A" "B" "E" "B" "A" "D" "A" "B"
stat_mode(vector_character)
#> [1] "B"
```
