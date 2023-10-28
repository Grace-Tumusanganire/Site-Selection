#' Basemap view
#'
#' @param data dataset to be visualized
#'
#' @return a dataset visualized on top of a basemap
#' @export
#'
#' @examples
#' counties <- sf::st_read(system.file("extdata/counties", "counties.shp",package="siteselection"))
#'basemap_view(counties)
basemap_view <- function(data) {
  mapview::mapviewOptions(fgb = FALSE)
  data_name <- deparse(substitute(data))
  mapview::mapview(data, layer.name = data_name)
}
