\name{reproduce_sim2_benchmark}
\alias{reproduce_sim2_benchmark}
\title{Reproduce official Simulation 2 Benchmark (rep_1) draws}
\description{
Convenience wrapper around \code{\link{fit_ipd}} with the exact default
settings used in \code{Code/Simulation_2/1_Benchmark.R} of the Bayesian-Meta
repository.
}
\usage{
reproduce_sim2_benchmark(..., compare_official = FALSE)
}
\arguments{
\item{...}{Passed to \code{\link{fit_ipd}} (e.g. \code{verbose = FALSE}).}

\item{compare_official}{If \code{TRUE}, also load bundled official draws and
report \code{all.equal} comparisons.}
}
\value{
A \code{bayesmeta_ipd} fit object. If \code{compare_official = TRUE}, an
attribute \code{comparison} is attached with equality checks.
}
\examples{
\dontrun{
fit <- reproduce_sim2_benchmark(compare_official = TRUE)
attr(fit, "comparison")
}
}
