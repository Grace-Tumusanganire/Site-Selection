#' Clip selected features
#'
#' @param data1 input dataset
#' @param data2 clip dataset
#' @param d1var variable for input dataset
#' @param d2var variable for clip dataset
#' @param d1threshold condition to be met in d1var
#' @param d2threshold condition to be met in d2var
#'
#' @return clippped features that meet condition in both datasets
#' @export
#'
#' @examples
#' counties <- sf::st_read(system.file("extdata/counties", "counties.shp",
#' package="siteselection"))
#' windpw <- sf::st_read(system.file("extdata/windPower", "windPower.shp",
#' package="siteselection"))
#' clip_selected(counties, windpw, "Population","WindPowerClass", 20000, 3 )
clip_selected <- function(data1, data2, d1var, d2var, d1threshold, d2threshold){ # (Input dataset parameters : data1, d1var, d1threshold), (target dataset parameters: data2, d2var, d2threshold)
  sf::sf_use_s2(FALSE)
  selectd1 <- data1[data1[[d1var]] > d1threshold, ]
  selectd2 <- data2[data2[[d2var]] >= d2threshold, ]
  if (sf::st_crs(selectd1) != sf::st_crs(selectd2)) { #Setting the coordinate system
    selectd1 <- sf::st_transform(selectd1, crs = sf::st_crs(selectd2))
  }
  suitablearea <- sf::st_union(selectd1, selectd2)
  sf::sf_use_s2(TRUE)
  return (suitablearea)
}
