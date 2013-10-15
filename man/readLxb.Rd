\name{readLxb}
\alias{readLxb}
\title{Read LXB files}
\description{
    Read one or more LXB files.
}
\usage{
    readLxb(paths, filter=TRUE, text=FALSE)
}
\arguments{
    \item{paths}{character vector of patterns for relative or absolute
                 filepaths.  Missing values will be ignored.}
    \item{filter}{set \code{filter=TRUE} to drop reads with an invalid
                  bead ID or which did not pass the doublet
                  discriminator test.  If \code{filter=FALSE} then all
                  data is included in the ouput.}
    \item{text}{include text segment in output if TRUE.}
}
\value{
    Returns a list of LXB files read.  Each item in the list may consist of a
    \code{text} component and a \code{data} component.  The former is a vector
    of the values in the text segment of the LXB file, the latter is a matrix
    of all parameters in the LXB file where each column corresponds to one
    parameter.

    If \code{text=FALSE} then each item only consists of the data matrix.  Set
    \code{text=TRUE} to return the text segment of the LXB file as well.  This
    can be useful for debugging purposes.

    If only one LXB file was read then the first item of the list is returned
    instead of a list with only one item.

    The \code{names} attribute of the returned list is set to the well
    names, if all LXB files have names of the form \code{XXX_B1.lxb}
    (i.e. if they end in a letter and a number).  Otherwise the file
    names are used.
}
\examples{
\dontrun{
## Read file 'name.lxb' from current directory and include all
## information about the LXB file
x <- readLxb('name.lxb', filter=FALSE, text=TRUE)
dim(x$data)
names(x$text)

## Read all LXB files from current directory
xs <- readLxb('*.lxb')
length(xs)
dim(xs[[1]])

## If the LXB files end in a letter and digit, then this can be used to
## index 'xs', e.g. to inspect the first few rows of well "C10", type:
head(xs$C10)
}
}
\keyword{file}

