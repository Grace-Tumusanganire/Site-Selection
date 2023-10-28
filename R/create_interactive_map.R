#' Create interactive Map
#'
#' @param data A dataset such as a shapefile, to visualize
#' @param var1 the variable to visualize on the map
#'
#' @return an interactive map
#' @export
#'
#' @examples
#'dataset <- sf::st_read(system.file("extdata/counties", "counties.shp",
#' package="siteselection"))
#'create_interactive_map(dataset, "POP2010")
#'
create_interactive_map <- function(data, var1) {
  # Check the geometry types
  geometry_types <- unique(sf::st_geometry_type(data))


  # Plotting points
  if ("POINT" %in% geometry_types) {
    # Create the labels attribute for points
    attr <- paste0(
      "Value: ", data[[var1]]
    )

    mapInt <-
      ggplot2::ggplot(data) +
      ggplot2::geom_sf(ggplot2::aes(color = .data[[var1]], label = attr), size = 1) +
      ggplot2::scale_color_viridis_c() +
      ggplot2::labs(title = paste( "Layer by ", var1),
                    subtitle = "Point color corresponds to variable",
                    caption = "Source: Your Data Source")


    # Plotting lines or multilines
  } else if ("LINESTRING" %in% geometry_types || "MULTILINESTRING" %in% geometry_types) {
    attr <- paste0(
      "Value: ", data[[var1]]
    )

    mapInt <-
      ggplot2::ggplot(data) +
      ggplot2::geom_sf(ggplot2::aes(size = .data[[var1]], color = .data[[var1]], label = attr)) +
      ggplot2::scale_size_continuous() +
      ggplot2::scale_color_viridis_c() +
      ggplot2::labs(title = paste("Layer by ", var1),
                    subtitle = "Line size and color correspond to variable",
                    caption = "Source: Your Data Source")


    #Plotting polygon or multipolygons
  } else if ("POLYGON" %in% geometry_types || "MULTIPOLYGON" %in% geometry_types) {

    attr <- paste0(
      "Value: ", data[[var1]]
    )

    mapInt <-
      ggplot2::ggplot(data) +
      ggplot2::geom_sf(ggplot2::aes(fill = .data[[var1]], label = attr)) +
      ggplot2::scale_fill_viridis_c() +
      ggplot2::labs(title = paste("Layer by ", var1),
                    subtitle = "Polygon fill corresponds to variable",
                    caption = "Source: Your Data Source")

  } else {
    stop("Unsupported geometry types in the shapefile")
  }


  # Converting ggplot2 static plot to an interactive plotly plot
  intmap <- plotly::ggplotly(mapInt, tooltip = "label")

  return(intmap)
}
