\name{readLxb}
\alias{readLxb}
\title{Read single LXB file}
\description{
    Read a single LXB file into a matrix.
}
\usage{
    readLxb(filename)
}
\arguments{
    \item{filename}{name of the file to load.}
}
\seealso{
    \code{\link{readManyLxbs}}
}
\examples{
## Read file 'name.lxb' from current directory into matrix x
x <- readLxb('name.lxb')
}
\keyword{file}

