## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  echo = FALSE,
  comment = "#>"
)
use_dt <- FALSE
if(requireNamespace("DT", quietly = TRUE)) use_dt <- TRUE

## ----eval = use_dt------------------------------------------------------------
DT::datatable(nflreadr::dictionary_pbp, 
              options = list(scrollX = TRUE, pageLength = 25),
              filter = "top",
              rownames = FALSE
              )

## ----eval = !use_dt-----------------------------------------------------------
#  knitr::kable(nflreadr::dictionary_pbp)

