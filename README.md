# bayesmetaipd
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
#   library(bayesmetaipd)
#
#   # Defaults match the official Benchmark (data + RNG stream)
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
# Why default seed matches the official script
# --------------------------------------------
#
# Official code does:
#   set.seed(1001)
#   load("SimulationData_2.RData")   # created by save.image()
#
# save.image() also stores .Random.seed. So load() overwrites the seed from
# set.seed(1001). The MCMC actually starts from that saved RNG state, not from
# a fresh set.seed(1001). This package restores that state when seed = 1001
# and the bundled sim2_rep1 data are used.
#
# License: MIT
