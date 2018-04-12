context("reading and cleaning")
test_that("reading and cleaning works", {

  x <- epub_to_text(system.file("extdat", "augustine.epub", package="pubcrawl"))

  testthat::expect_equal(nrow(x), 10)

  testthat::expect_equal(
    nchar(x$content),
    c(58288L, 67188L, 78944L, 50752L, 78883L, 79292L, 64705L, 55906L, 68353L, 18471L)
  )

  testthat::expect_true(all(!grepl("<", x$content)))

})


