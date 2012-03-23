readLxb <- function (filename, text=FALSE) {
    # Read one LXB file.  Returns a matrix in which each column corresponds to
    # a parameter.
    x <- .Call("read_lxb", as.character(filename), as.logical(text))
    if (!is.null(x))
        x$data <- t(x$data)
    x
}

readManyLxbs <- function(paths, filter=identity) {
    # Read multiple LXB files and return a list of matrices (one for each LXB).
    #
    # The 'filter' argument is a function which will be applied to each LXB
    # matrix.  It can for example be used to drop bad reads by calling
    #
    #     readManyLxbs('*.lxb', filter=dropBadReads)
    #
    # The name of each LXB file is used to set the 'names' attribute of the
    # returned list.
    filenames  <- Sys.glob(paths)
    res        <- lapply(filenames, function(x) filter(readLxb(x)$data))
    names(res) <- lapply(filenames, function(x) sub(".lxb", "", basename(x)))
    res
}

dropBadReads <- function(x) {
    # Drop reads where RID is 0 or DBL is 0
    x[x[ ,'RID'] != 0 & x[ ,'DBL'] != 0, ]
}
