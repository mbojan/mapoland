\name{getShape}
\alias{getShape}
\title{Wrapper for reading shape files}
\description{
This is a simple wrapper around \code{\link{readShapePoly}}
for importing shape files contained within package \pkg{mapoland}.
}
\usage{
getShape(nam = c("voiv", "polska"), ...)
}
\arguments{
  \item{nam}{character, base name of the shape file to be read}
  \item{...}{other arguments passed to \code{\link{readShapePoly}}}
}
\value{
Object of class "\linkS4class{SpatialPolygonsDataFrame}".
}
\seealso{
\code{\link{readShapePoly}}, \link{shapes}
}
\examples{
s <- getShape("voiv")
plot(s)
}
