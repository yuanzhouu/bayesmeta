\name{fit_ipd}
\alias{fit_ipd}
\title{Fit IPD-only Bayesian random-effects meta-analysis (logistic)}
\description{
Implements the Simulation Study 2 Benchmark sampler: all studies are treated
as individual participant data (IPD), with a logistic observation model and
hierarchical prior \eqn{\theta_l \sim N(\mu,\Sigma)}.

Defaults reproduce the official Benchmark \code{rep_1} result when called as
\code{fit_ipd()} (bundled \code{sim2_rep1} data, \code{seed = 1001},
burn-in/main = 10000).
}
\usage{
fit_ipd(
  X = NULL,
  Y = NULL,
  theta_init = NULL,
  mu_init = NULL,
  Sigma_init = NULL,
  burnin = 10000L,
  mainrun = 10000L,
  step_theta = 0.15,
  lambda = 1e4,
  nu0 = 0.1,
  phi0 = 0.1,
  seed = 1001L,
  verbose = TRUE
)
}
\arguments{
\item{X}{Optional \code{L x n x p} array of covariates. If \code{NULL}, uses
\code{\link{sim2_rep1}}.}

\item{Y}{Optional \code{L x n} matrix of binary responses. If \code{NULL},
uses \code{\link{sim2_rep1}}.}

\item{theta_init}{Optional \code{L x p} starting values for study-specific
coefficients.}

\item{mu_init}{Optional length-\code{p} starting value for \code{mu}.}

\item{Sigma_init}{Optional \code{p x p} starting covariance. Default
\code{diag(1, p)}.}

\item{burnin}{Integer burn-in iterations. Default \code{10000}.}

\item{mainrun}{Integer post-burn-in iterations retained. Default \code{10000}.}

\item{step_theta}{MH proposal SD for each component of \code{theta_l}.
Default \code{0.15}.}

\item{lambda}{Prior variance for \code{mu ~ N(0, lambda * I)}. Default
\code{1e4}.}

\item{nu0}{Inverse-Wishart degrees of freedom. Default \code{0.1}.}

\item{phi0}{Inverse-Wishart scale multiplier (\code{Phi0 = phi0 * I}).
Default \code{0.1}.}

\item{seed}{Integer RNG seed. Default \code{1001}. With default bundled data,
\code{seed = 1001} restores the official \code{.Random.seed} from
\code{SimulationData_2.RData}. Set to \code{NULL} to leave the RNG state
unchanged.}

\item{verbose}{Logical; print progress every 1000 iterations.}
}
\value{
A list of class \code{bayesmeta_ipd} with \code{posterior_mu},
\code{posterior_Sigma_diag}, \code{call}, and \code{settings}.
}
\examples{
fit_short <- fit_ipd(burnin = 20, mainrun = 30, verbose = FALSE)
colMeans(fit_short$posterior_mu)
}
