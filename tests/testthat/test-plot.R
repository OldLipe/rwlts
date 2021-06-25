context("test_plot")

testthat::test_that("test plot", {

  library(ggalluvial)

  # skip cran check test
  testthat::skip_on_cran()

  # use the example data
  data("mt_500_mapbiomas_cerrado")

  # error in provide wrong object
  testthat::expect_error(
    object = plot_sankey(mt_500_mapbiomas_cerrado$result)
  )

  # error in provide a null trajectory
  testthat::expect_s3_class(
    object = plot_sankey(mt_500_mapbiomas_cerrado),
    class = "gg")

  # error in provide a null trajectory
  testthat::expect_s3_class(
    object = plot_sankey(mt_500_mapbiomas_cerrado,
                         show_count_transition = TRUE),
    class = "gg")
})
