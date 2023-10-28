test_that("buffer_selected(data, var, threshold, bufdist)", {
  translines <- sf::st_read(system.file("extdata/transmissionLines", "transmissionLine.shp",
                                        package="siteselection"))
  expect_no_error(buffer_selected(translines, "VOLTAGE", 400, 10))
})

