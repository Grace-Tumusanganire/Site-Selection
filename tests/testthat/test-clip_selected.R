test_that("clip_selected(data1, data2, d1var, d2var, d1threshold, d2threshold)", {
  counties <- sf::st_read(system.file("extdata/counties", "counties.shp",
                                      package="siteselection"))
  windpw <- sf::st_read(system.file("extdata/windPower", "windPower.shp",
                                      package="siteselection"))
  expect_no_error(clip_selected(counties, windpw, "Population", "WindPowerClass",20000,3))
})
