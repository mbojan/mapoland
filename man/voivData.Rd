\name{voivData}
\alias{voivData}
\docType{data}
\title{Data on Polish voivodships}
\description{
Some extra data on Polish voivodships.
}
\usage{data(voivData)}
\format{
  A data frame with 16 observations on the following 4 variables.
  \describe{
    \item{\code{teryt}}{numeric, area code from "TERYT": official Polish area
    classification}
    \item{\code{area}}{numeric, area in square kilometers}
    \item{\code{perimeter}}{numeric, voivodship perimeter in kilometers}
    \item{\code{pop2001}}{numeric, voivodship population in 2001}
  }
}
\source{
Official statistics: \url{http://www.stat.gov.pl}

TERYT database: \url{http://www.stat.gov.pl/broker/access/index.jspa}
}
\examples{
# areas of voivodships
a <- structure( voivData$area, names=rownames(voivData))
s <- getShape("voiv")
k <- coordinates(s)
# colors
x <- a - min(a)
kol <- x / max(x)
plot(s, col=gray(kol))
text( coordinates(s), labels=voivNames(), col=gray((1-kol)>.5),
    cex=.8)
}
\keyword{datasets}
