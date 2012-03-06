readLxb <- function (filename) {
    # Read one LXB file.  Returns a matrix in which each column corresponds to
    # a parameter.
    x <- .Call("read_lxb", as.character(filename))
    if (!is.null(x))
        x <- t(x)
    x
}

readAndCombineLxbs <- function(paths) {
    # Read multiple LXB files and combine into one matrix.  It is assumed that
    # all LXB files have the same number of columns (with the same names).
    filenames <- Sys.glob(paths)

    # Option 1: Output diagnostic messages while reading
    # n   <- length(filenames)
    # res <- vector("list", n)
    # for (k in 1:n) {
    #     name <- filenames[k]
    #     message(c("Reading file [", k, " of ", n, "]: ", name))
    #     res[[k]] <- readLxb(name)
    # }

    # Option 2: No diagnostics
    res <- lapply(filenames, readLxb)

    # Combine list of matrices into one big matrix
    do.call(rbind, res)
}
