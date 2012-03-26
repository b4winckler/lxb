readLxb <- function (paths, filter=identity, text=FALSE) {
    # Read multiple LXB files and return a list of matrices (one for each LXB).
    #
    # If 'text=TRUE' then each item is a list with a 'text' and 'data' entry.
    # The 'text' is the text segment of the LXB file and the 'data' entry is
    # the data segment (same as the matrix return when 'text=FALSE').
    #
    # If only one lxb is read then the head of the list is returned instead of
    # returning a list with only one element.
    #
    # The 'filter' argument is a function which will be applied to each LXB
    # matrix.  It can for example be used to drop bad reads by calling
    #
    #     readLxb('*.lxb', filter=dropBadReads)
    #
    # The name of each LXB file is used to set the 'names' attribute of the
    # returned list.

    go <- function(filename) {
        x <- .Call("read_lxb", as.character(filename), as.logical(text))
        if (!is.null(x)) {
            x$data <- filter(t(x$data))
            if (!text)
                x <- x$data
        }
        x
    }

    names <- Sys.glob(paths)
    lxbs  <- lapply(names, go)

    m <- regexec(".*([a-zA-Z])([0-9]+)[.]lxb", names)
    if (all(lapply(m, '[', 1L) != -1)) {
        # All names contain row & column information, extract into data frame
        parts <- do.call(rbind, lapply(regmatches(names, m), '[', c(2L,3L)))
        df <- data.frame(row=parts[ ,1], column=as.integer(parts[ ,2]))

        # Order LXBs by: A1, B1, ..., A2, B2, ...
        idx <- with(df, order(column, row))

        names(lxbs) <- with(df, paste(row, column, sep=""))
        lxbs <- lxbs[idx]
    } else {
        # No row & column information found, use filename
        names(lxbs) <- lapply(names, function(x) sub(".lxb", "", basename(x)))
    }

    if (length(lxbs) == 1)
        lxbs <- lxbs[[1]]
    lxbs
}

dropBadReads <- function(x) {
    # Drop reads where RID is 0 or DBL is 0
    x[x[ ,'RID'] != 0 & x[ ,'DBL'] != 0, ]
}
