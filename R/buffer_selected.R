#' Buffer selected features
#'
#' @param data the dataset
#' @param var the attribute/variable to select from
#' @param threshold the value to be met by the condition
#' @param bufdist the buffer distance to create around selected features
#'
#' @return a buffer of a certain radius around selected features in a dataset
#' @export
#'
#' @examples
#' translines <- sf::st_read(system.file("extdata/transmissionLines", "transmissionLine.shp",
#'  package="siteselection"))
#'buffer_selected(translines, "VOLTAGE", 400, 10)
#'
buffer_selected <- function(data, var, threshold, bufdist) {
  #Selecting features that meet the attribute condition
  selectftr <- data[data[[var]] >= threshold, ]
  #Setting the distance units
  bufdistunit <- units::set_units(bufdist, miles)
  #create buffer for selected features
  buffered_features <- sf::st_buffer (selectftr, bufdistunit, endCapStyle = "ROUND", joinStyle = "ROUND")
  #Dissolving the resulting features to remove overlaps
  dissolved_buffer <- sf::st_union(buffered_features)
}
