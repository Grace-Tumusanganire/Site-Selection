test_that("create_interactive_map(data, var1)", {
  dataset <- sf::st_read(system.file("extdata/counties", "counties.shp",
                                     package="siteselection"))
  expect_no_error(create_interactive_map(dataset, "POP2010"))
})
