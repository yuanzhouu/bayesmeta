\name{sim2_rep1}
\alias{sim2_rep1}
\docType{data}
\title{Simulation Study 2, replicate 1 (IPD Benchmark data)}
\description{
Bundled first replicate from the Simulation Study 2 data used in the
Bayesian-Meta supplementary materials. Used by default in \code{\link{fit_ipd}}
and \code{\link{reproduce_sim2_benchmark}} to match the official Benchmark
output.
}
\format{
A list with components:
\describe{
  \item{X_cube}{Numeric array \code{L x n x p} of covariates
    (\code{L=40}, \code{n=200}, \code{p=4}).}
  \item{Y_mat}{Numeric matrix \code{L x n} of binary responses.}
  \item{theta_l_mat}{Numeric matrix \code{L x p} of true study-specific
    coefficients (also used as MCMC starting values in the official script).}
  \item{true_mu}{Numeric vector of length \code{p}, the true random-effects mean.}
  \item{random_seed}{Integer vector: the \code{.Random.seed} restored by
    \code{load(SimulationData_2.RData)} in the official Benchmark script
    (needed to reproduce official posterior draws).}
}
}
\source{
Extracted from \code{SimulationData_2.RData} in
\url{https://github.com/hang-kim-stat/Bayesian-Meta}.
}
\examples{
data(sim2_rep1)
str(sim2_rep1, max.level = 1)
}
\keyword{datasets}
