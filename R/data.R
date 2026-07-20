#' Simulation Study 2, replicate 1 (IPD Benchmark data)
#'
#' Bundled first replicate from the Simulation Study 2 data used in the
#' Bayesian-Meta supplementary materials. Used by default in [fit_ipd()] and
#' [reproduce_sim2_benchmark()] to match the official Benchmark output.
#'
#' @format A list with components:
#' \describe{
#'   \item{X_cube}{Numeric array `L x n x p` of covariates (`L=40`, `n=200`, `p=4`).}
#'   \item{Y_mat}{Numeric matrix `L x n` of binary responses.}
#'   \item{theta_l_mat}{Numeric matrix `L x p` of true study-specific coefficients
#'     (also used as MCMC starting values in the official script).}
#'   \item{true_mu}{Numeric vector of length `p`, the true random-effects mean.}
#'   \item{random_seed}{`.Random.seed` from `SimulationData_2.RData` (via
#'     `save.image()`), used to match the official Benchmark RNG stream.}
#' }
#'
#' @source Extracted from `SimulationData_2.RData` in
#'   <https://github.com/hang-kim-stat/Bayesian-Meta>.
#'
#' @examples
#' data(sim2_rep1)
#' str(sim2_rep1, max.level = 1)
"sim2_rep1"
