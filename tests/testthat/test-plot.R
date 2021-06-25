context("test_plot")

testthat::test_that("test plot", {
  vcr::use_cassette("test_plot", {

    library(ggalluvial)

    # skip cran check test
    testthat::skip_on_cran()

    # use the example data
    data("mt_500_mapbiomas_cerrado")

    # error in provide wrong object
    testthat::expect_error(
      object = plot_sankey(mt_500_mapbiomas_cerrado$result)
    )

    testthat::expect_s3_class(
      object = plot_sankey(mt_500_mapbiomas_cerrado),
      class = "gg")

    testthat::expect_s3_class(
      object = plot_sankey(mt_500_mapbiomas_cerrado,
                           show_count_transition = TRUE),
      class = "gg")


    wlts_bdc <- "https://brazildatacube.dpi.inpe.br/wlts/"
    example_2_pts <- get_trajectory(wlts_bdc,
                                    latitude = c(-12, -11.01),
                                    longitude = c(-54, -54),
                                    start_date = "2003-01-01",
                                    end_date = "2008-01-01",
                                    collections = c("mapbiomas5_amazonia",
                                                    "terraclass_amazonia"))
    testthat::expect_s3_class(
      object = plot_sankey(example_2_pts),
      class = "gg")


  })
})
