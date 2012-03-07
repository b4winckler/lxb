\name{dropBadReads}
\alias{dropBadReads}
\title{Drop bad reads from LXB matrix}
\description{
    Pass to \code{filter} parameter of \code{readManyLxbs} to drop bad reads. A
    read is said to be bad when the bead ID is zero or when the doublet
    discriminator test failed.
}
\arguments{
  \item{x}{A matrix with \code{RID} and \code{DBL} columns.}
}
\seealso{
    \code{\link{readManyLxbs}}
}
