getShape <- function(nam=c("voiv", "polska"), ...)
{
    n <- match.arg(nam)
    fname <- system.file("shapes", paste(n, ".shp", sep=""), package="mapoland")
    readShapePoly(fname, ...)
}
