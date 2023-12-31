% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/basemap_view.R
\name{basemap_view}
\alias{basemap_view}
\title{Basemap view}
\usage{
basemap_view(data)
}
\arguments{
\item{data}{dataset to be visualized}
}
\value{
a dataset visualized on top of a basemap
}
\description{
Basemap view
}
\examples{
counties <- sf::st_read(system.file("extdata/counties", "counties.shp",package="siteselection"))
basemap_view(counties)
}
