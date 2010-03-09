# plotting voivodhips
voivPlot <- function(x, ..., matchattr=NULL)
{
    # read the shape file
    pl <- getShape("voiv")
    # merge 'x'
    o <- smartSpCbind(sp=pl, x=x, matchattr=matchattr)
    # plot
    spplot(o, "x", ...)
}
