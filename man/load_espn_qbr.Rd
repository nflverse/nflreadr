% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_espn_qbr.R
\name{load_espn_qbr}
\alias{load_espn_qbr}
\title{Load ESPN's QBR}
\usage{
load_espn_qbr(
  seasons = most_recent_season(),
  summary_type = c("season", "week"),
  file_type = getOption("nflreadr.prefer", default = "rds")
)
}
\arguments{
\item{seasons}{a numeric vector of seasons to return, data available since 2006. Defaults to latest season available. TRUE will select all seasons.}

\item{summary_type}{One of \code{"season"} or \code{"week"}, defaults to \code{"season"}}

\item{file_type}{One of \code{c("rds", "qs", "csv", "parquet")}. Can also be set globally with
\code{options(nflreadr.prefer)}}
}
\value{
a tibble of ESPN QBR data, summarized according to \code{summary_type}
}
\description{
Load ESPN's QBR
}
\examples{
\dontshow{.for_cran()}
\donttest{
    load_espn_qbr(2020)
}

}
\seealso{
\url{https://nflreadr.nflverse.com/articles/dictionary_espn_qbr.html} for a web version of the dictionary

\code{\link{dictionary_espn_qbr}} for the data dictionary as bundled within the package

Issues with this data should be filed here: \url{https://github.com/nflverse/espnscrapeR-data}
}
