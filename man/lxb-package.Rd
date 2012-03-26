\name{lxb-package}
\alias{lxb-package}
\alias{lxb}
\docType{package}
\title{Fast LXB file reader}
\description{
This package provides functions to quickly read LXB parameter data.  LXB is the
format used by Luminex bead arrays and is based on the FCS v3.0 standard.
}
\details{
Note that the functions in this package were written to run as fast as possible
and with very specific LXB files in mind. It will not work with general files
based on the FCS v3.0 standard and it must run on a little endian machine (e.g.
Intel is ok, PowerPC is not). Adding support for more features of FCS v3.0 and
other machines should be simple.

Here are some assumptions made:
\itemize{
  \item The LXB file must be smaller than 100 Mb (\code{$BEGINDATA} and
        \code{$ENDDATA} are ignored)
  \item The data must be integral, in list mode, and in little endian byte
        order (\code{$DATATYPE = I}, \code{$MODE = L},
        \code{$BYTEORD = 1,2,3,4})
  \item All parameters must be 32 bit (\code{$PnB = 32})
  \item At most 99 parameters are supported
  \item Unicode in the text segment is not supported
  \item Keys or values containing the separator character are not supported
}
}
\author{Björn Winckler <bjorn.winckler@gmail.com>}
\keyword{package}
\examples{
\dontrun{
## Typically your LXB files should be organized with one folder per
## plate, with each plate consisting of multiple wells and each well
## corresponding to one LXB file.  Assuming the folder 'plate1' contains
## all LXB files for the first plate here is how to read all parameter
## data for plate 1 into a list of matrices (each list item is one well,
## each column in a matrix corresponds to one parameter):
y <- readLxb('plate1/*.lxb', filter=dropBadReads)

## The argument 'filter=dropBadReads' ensures that bad reads are
## ignored.

## It is now possible inspect individual wells, e.g. the dimensions of
## the first well are given by
dim(y[[1]])

## .. and the names of the parameters for well 1 are given by
colnames(y[[1]])

## You can also inspect which LXB file each item corresponds to by
## typing
names(y)
}
}
