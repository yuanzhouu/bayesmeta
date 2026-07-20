# bayesmeta
#
# Bayesian random-effects meta-analysis using individual participant data (IPD).
# Default settings of fit_ipd() reproduce the Simulation Study 2 Benchmark
# (rep_1) from https://github.com/hang-kim-stat/Bayesian-Meta
#
# Install
# -------
#
#   install.packages("remotes")
#   remotes::install_github("yuanzhouu/bayesmeta")
#
# Quick start
# -----------
#
#   library(bayesmeta)
#
# Defaults match the official Benchmark script, including the RNG state after
# load(SimulationData_2.RData) (that file was saved with save.image()).
#   fit <- fit_ipd()
#   colMeans(fit$posterior_mu)
#
#   # Same call, plus comparison to the bundled official posterior draws
#   fit <- reproduce_sim2_benchmark(compare_official = TRUE)
#   attr(fit, "comparison")
#
# Short demo (not the official long chain)
# ----------------------------------------
#
#   fit_short <- fit_ipd(burnin = 50, mainrun = 100, verbose = FALSE)
#   print(fit_short)
#
# Custom data
# -----------
#
#   # X: L x n x p array, Y: L x n binary matrix
#   fit <- fit_ipd(X = my_X, Y = my_Y, seed = 1)
#
# Algorithm
# ---------
#
# Hierarchical model (logistic IPD, all studies):
#   y_li | X_li, theta_l  ~ Bernoulli(logit^{-1}(X_li^T theta_l))
#   theta_l | mu, Sigma   ~ N(mu, Sigma)
#   mu                    ~ N(0, lambda I)
#   Sigma                 ~ InvWishart(nu0, phi0 I)
#
# MCMC: Metropolis-Hastings for each theta_l, then Gibbs for (mu, Sigma).
#
# Note on the package name
# ------------------------
#
# There is an unrelated CRAN package also named `bayesmeta`. Installing this
# GitHub package will mask / replace that package name in your library. If you
# need both, install this package into a separate library path.
#
# License: MIT
