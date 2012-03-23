\name{readLxb}
\alias{readLxb}
\title{Read single LXB file}
\description{
    Read a single LXB file into a matrix.
}
\usage{
    readLxb(filename, text=FALSE)
}
\arguments{
    \item{filename}{name of the file to load.}
    \item{text}{include text segment in output if TRUE.}
}
\seealso{
    \code{\link{readManyLxbs}}
}
\examples{
\dontrun{
## Read file 'name.lxb' from current directory into list x
x <- readLxb('name.lxb', text=TRUE)
dim(x$data)
names(x$text)
}
}
\keyword{file}

