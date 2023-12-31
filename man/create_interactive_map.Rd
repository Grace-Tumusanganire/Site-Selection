% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_interactive_map.R
\name{create_interactive_map}
\alias{create_interactive_map}
\title{Create interactive Map}
\usage{
create_interactive_map(data, var1)
}
\arguments{
\item{data}{A dataset such as a shapefile, to visualize}

\item{var1}{the variable to visualize on the map}
}
\value{
an interactive map
}
\description{
Create interactive Map
}
\examples{
dataset <- sf::st_read(system.file("extdata/counties", "counties.shp",
package="siteselection"))
create_interactive_map(dataset, "POP2010")

}
