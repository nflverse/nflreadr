# nocov start
.onLoad <- function(libname,pkgname){

  memoise_option <- getOption("nflreadr.cache", default = "memory")

  if(!memoise_option %in% c("memory", "filesystem", "off")) memoise_option <- "memory"

  if(memoise_option == "filesystem"){
    cache_dir <- rappdirs::user_cache_dir(appname = "nflreadr")
    dir.create(cache_dir, recursive = TRUE, showWarnings = FALSE)
    cache <- cachem::cache_disk(dir = cache_dir)
  }

  if(memoise_option == "memory") cache <- cachem::cache_mem()

  if(memoise_option != "off"){

    assign(x = "rds_from_url",
           value = memoise::memoise(rds_from_url, ~ memoise::timeout(86400), cache = cache),
           envir = rlang::ns_env("nflreadr"))
    assign(x = "csv_from_url",
           value = memoise::memoise(csv_from_url, ~ memoise::timeout(86400), cache = cache),
           envir = rlang::ns_env("nflreadr"))
    assign(x = "qs_from_url",
           value = memoise::memoise(qs_from_url, ~ memoise::timeout(86400), cache = cache),
           envir = rlang::ns_env("nflreadr"))
    assign(x = "raw_from_url",
           value = memoise::memoise(raw_from_url, ~ memoise::timeout(86400), cache = cache),
           envir = rlang::ns_env("nflreadr"))
    assign(x = "parquet_from_url",
           value = memoise::memoise(parquet_from_url, ~ memoise::timeout(86400), cache = cache),
           envir = rlang::ns_env("nflreadr"))

  }

  if(is.null(getOption("nflreadr.verbose")) && isFALSE(getOption("nflreadr.cache_warning"))) {
    options("nflreadr.verbose" = TRUE)
  }

  # validate suggested package installation
  if(!is.null(getOption("nflreadr.prefer")) && getOption("nflreadr.prefer") %in% c("qs","parquet")){

    switch(getOption("nflreadr.prefer"),
           "qs" = {
             rlang::check_installed(
               pkg = c("qs","Rcpp (>= 1.0.7)","RcppParallel (>= 5.1.4)"),
               reason = "these packages are required to use options(nflreadr.prefer = 'qs')")

             options("nflreadr.qs_ok" = TRUE)
           },
           "parquet" = {
             rlang::check_installed(
               pkg = "arrow (>= 6.0.0)",
               reason = "these packages are required to use options(nflreadr.prefer = 'parquet')")

             options("nflreadr.arrow_ok" = TRUE)
           }
    )
  }

}

.onAttach <- function(libname, pkgname){

  # validate nflreadr.prefer

  prefer_type <- getOption("nflreadr.prefer", default = "rds")

  if(!prefer_type %in% c("rds", "parquet", "qs", "csv")) {

    packageStartupMessage("Note: nflreadr.prefer is set to ",
                          prefer_type,
                          'and should be one of c("qs", "parquet", "rds", "csv"). \n,',
                          'Defaulting back to "rds"')

    options("nflreadr.prefer" = "rds")
  }

  # validate nflreadr.cache

  memoise_option <- getOption("nflreadr.cache",default = "memory")

  if (!memoise_option %in% c("memory", "filesystem", "off")) {

    packageStartupMessage('Note: nflreadr.cache is set to "',
                          memoise_option,
                          '" and should be one of c("memory","filesystem", "off"). \n',
                          'Defaulting to "memory".')

    options("nflreadr.cache" = "memory")
  }

  if(memoise_option == "off") packageStartupMessage('Note: nflreadr.cache is set to "off"')
}

# nocov end
