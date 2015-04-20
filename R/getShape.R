#' Wrapper for reading shape files
#' 
#' This is a simple wrapper around \code{\link{readShapePoly}} for importing
#' shape files contained within package \pkg{mapoland}.
#' 
#' 
#' @param nam character, base name of the shape file to be read
#' @param ... other arguments passed to \code{\link{readShapePoly}}
#'
#' @return Object of class "\linkS4class{SpatialPolygonsDataFrame}".
#'
#' @seealso \code{\link{readShapePoly}}, \link{mapoland}
#'
#' @export
#'
#' @examples
#'
#' s <- getShape("voiv")
#' # plot(s)
#'
getShape <- function(nam=c("voiv", "polska"), ...)
{
    n <- match.arg(nam)
    fname <- system.file("shapes", paste(n, ".shp", sep=""), package="mapoland")
    maptools::readShapePoly(fname, ...)
}
