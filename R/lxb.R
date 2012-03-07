readLxb <- function (filename) {
    # Read one LXB file.  Returns a matrix in which each column corresponds to
    # a parameter.
    x <- .Call("read_lxb", as.character(filename))
    if (!is.null(x))
        x <- t(x)
    x
}

readManyLxbs <- function(paths) {
    # Read multiple LXB files and return a list of matrices (one for each LXB).
    filenames <- Sys.glob(paths)
    lapply(filenames, readLxb)
}
