\name{readManyLxbs}
\alias{readManyLxbs}
\title{Read multiple LXB files}
\description{
    Read multiple LXB files and return list of matrices.  Each item in the list
    corresponds to one LXB file (and typically there is one LXB file per well).
}
\usage{
    readManyLxbs(paths)
}
\arguments{
    \item{paths}{character vector of patterns for relative or absolute
                 filepaths.  Missing values will be ignored.}
}
\seealso{
    \code{\link{readLxb}}
}
\examples{
## Read all LXB files in current directory. 'x' will be a list of matrices.
x <- readManyLxbs('*.lxb')
}
\keyword{file}
