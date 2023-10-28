test_that("basemap_view(data)", {
  counties <- sf::st_read(system.file("extdata/counties", "counties.shp",package="siteselection"))
  expect_no_error(basemap_view(counties))
})
