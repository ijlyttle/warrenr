% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/persistently.R
\name{persistently}
\alias{persistently}
\title{Capture side effects.}
\usage{
persistently(.f, quiet = TRUE, max_attempts = 5, wait_seconds = 0.1)
}
\arguments{
\item{.f}{A function, formula, or atomic vector. See \code{\link[purrr:map]{purrr::map()}}}

\item{quiet}{Hide errors (\code{TRUE}, the default), or display them
as they occur?}

\item{max_attempts}{Positive integer. \code{persistent} functions will try
to run this many times before giving up.}

\item{wait_seconds}{Positive number. Base multiplier for time in seconds to
wait between attempts. The time increases exponentially, with a wait time
randomly chosen from a uniform distribution between \code{0} and
\code{wait_seconds * 2 ^ (i - 1)} seconds, between the \code{i}th and
\code{i + 1}th attempts.}
}
\value{
wrapped function uses a default value (\code{otherwise})
whenever an error occurs max_attempts times.
}
\description{
These functions wrap functions so that instead of generating side effects
through printed output, messages, warnings, and errors, they return enhanced
output. They are all adverbs because they modify the action of a verb (a
function).
}
\examples{

# persistently() makes a function repeatedly try to work

risky_runif <- function(lo = 0, hi = 1) {
  y <- stats::runif(1, lo, hi)
  if(y < 0.9) {
    stop(y, " is too small")
  }
  y
}

persistent_risky_runif <- persistently(
  risky_runif, quiet = FALSE, wait_seconds = 0.01)

\dontrun{
  set.seed(1)
  persistent_risky_runif()
  set.seed(3)
  persistent_risky_runif()
}


}
\seealso{
\code{\link[httr:RETRY]{httr::RETRY()}} is a special case of \code{\link[=persistently]{persistently()}}
}
