\name{readAndCombineLxbs}
\alias{readAndCombineLxbs}
\title{Read multiple LXB files}
\description{
    Read multiple LXB files and combine them into one matrix.
}
\usage{
    readAndCombineLxbs(paths)
}
\arguments{
    \item{paths}{character vector of patterns for relative or absolute
                 filepaths.  Missing values will be ignored.}
}
\seealso{
    \code{\link{readLxb}}
}
\examples{
## Read all LXB files in current directory and combine into one matrix x
x <- readAndCombineLxbs('*.lxb')
}
\keyword{file}
