\name{readManyLxbs}
\alias{readManyLxbs}
\title{Read multiple LXB files}
\description{
    Read multiple LXB files and return list of matrices.  Each item in the list
    corresponds to one LXB file (and typically there is one LXB file per well).
    The names of the LXB files are used to set the \code{names} property of the
    returned list.
}
\usage{
    readManyLxbs(paths, filter=identity)
}
\arguments{
    \item{paths}{character vector of patterns for relative or absolute
                 filepaths.  Missing values will be ignored.}
    \item{filter}{function to apply to each matrix in the returned list.  Use
                  \code{filter=dropBadReads} to drop reads with an invalid ID
                  or which did not pass the doublet discriminator test.}
}
\seealso{
    \code{\link{readLxb}}
}
\examples{
\dontrun{
## Read all LXB files in current directory. 'x' will be a list of matrices.
x <- readManyLxbs('*.lxb')
}
}
\keyword{file}
