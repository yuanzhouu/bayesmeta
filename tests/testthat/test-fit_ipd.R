test_that("short fit_ipd run returns expected structure", {
  fit <- fit_ipd(burnin = 5, mainrun = 10, verbose = FALSE, seed = 1001L)
  expect_s3_class(fit, "bayesmetaipd_fit")
  expect_equal(dim(fit$posterior_mu), c(10, 4))
  expect_equal(dim(fit$posterior_Sigma_diag), c(10, 4))
  expect_true(is.finite(sum(fit$posterior_mu)))
})

test_that("sim2_rep1 data is available", {
  data(sim2_rep1, package = "bayesmetaipd")
  expect_equal(dim(sim2_rep1$X_cube), c(40, 200, 4))
  expect_equal(dim(sim2_rep1$Y_mat), c(40, 200))
})
