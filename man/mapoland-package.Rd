\name{mapoland-package}
\alias{mapoland-package}
\alias{mapoland}
\docType{package}
\title{Maps of Poland}
\description{
This package contains data and tools for drawing maps of Poland.
}
\details{
Tools are provided for drawing data on administrative maps of Poland. Functions
rely on functionality of packages \pkg{sp} and \pkg{maptools}.  See
\code{help(package="mapoland")} for the complete list of functions.

The package currently contains data on voivodships, i.e. top-level
administrative units. Future releases will include data on county and
municipality levels.  See \link{shapes} for information about included shape
files.

We have invested some time and effort in creating this package. We hope that it
will be useful to you. Please cite it whenever you use it for data analysis or
other tasks. See \code{citation(package="mapoland")} for the proper information
and format.
}
\author{
Michal Bojanowski and Tomasz W. Jerzynski

Maintainer: Michal Bojanowski \email{michal2992@gmail.com}
}
\seealso{
\pkg{mapoland} on WWW: \url{http://mapoland.r-forge.r-project.org}
}
\examples{
# voivodships colored by area
x <- structure( voivData$area, names=rownames(voivData) )
voivPlot(x, main="Area of voivodships [km^2]")
}
\keyword{package}
