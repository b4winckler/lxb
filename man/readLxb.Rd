\name{readLxb}
\alias{readLxb}
\title{Read LXB files}
\description{
    Read one or more LXB files.
}
\usage{
    readLxb(paths, filter=identity, text=FALSE)
}
\arguments{
    \item{paths}{character vector of patterns for relative or absolute
                 filepaths.  Missing values will be ignored.}
    \item{filter}{function to apply to each matrix in the returned list.  Use
                  \code{filter=dropBadReads} to drop reads with an invalid ID
                  or which did not pass the doublet discriminator test.}
    \item{text}{include text segment in output if TRUE.}
}
\value{
    Returns a list of LXB files read.  Each item in the list may consist of a
    \code{text} component and a \code{data} component.  The former is a vector
    of the values in the text segment of the LXB file, the latter is a matrix
    of all parameters in the LXB file where each column corresponds to one
    parameter.

    If \code{text=FALSE} then each item only consists of the data matrix.

    If only one LXB file was read then the first item of the list is returned
    instead of a list with only one item.
}
\examples{
\dontrun{
## Read file 'name.lxb' from current directory
x <- readLxb('name.lxb', text=TRUE)
dim(x$data)
names(x$text)

## Read all LXB files from current directory
xs <- readLxb('*.lxb', filter=dropBadReads)
length(xs)
dim(xs[[1]])
}
}
\keyword{file}

