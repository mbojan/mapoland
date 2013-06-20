

#'Maps of Poland
#'
#'This package contains data and tools for drawing maps of Poland.
#'
#'Tools are provided for drawing data on administrative maps of Poland.
#'Functions rely on functionality of packages \pkg{sp} and \pkg{maptools}.  See
#'\code{help(package="mapoland")} for the complete list of functions.
#'
#'The package currently contains data on voivodships, i.e. top-level
#'administrative units. Future releases will include data on county and
#'municipality levels.  See \link{shapes} for information about included shape
#'files.
#'
#'We have invested some time and effort in creating this package. We hope that
#'it will be useful to you. Please cite it whenever you use it for data
#'analysis or other tasks. See \code{citation(package="mapoland")} for the
#'proper information and format.
#'
#'@name mapoland-package
#'@aliases mapoland-package mapoland
#'@docType package
#'@author Michal Bojanowski and Tomasz W. Jerzynski
#'
#'Maintainer: Michal Bojanowski \email{michal2992@@gmail.com}
#'@seealso \pkg{mapoland} on WWW: \url{http://mapoland.r-forge.r-project.org}
#'@keywords package
#'@examples
#'
#'# voivodships colored by area
#'x <- structure( voivData$area, names=rownames(voivData) )
#'voivPlot(x, main="Area of voivodships [km^2]")
#'
NULL





#'Spatial data on Poland
#'
#'Package \pkg{mapoland} provides some extra data files with spatial
#'information about Poland. These are in ESRI shape files stored in the
#'\code{shapes} folder of the package directory.
#'
#'The policy that is implemented in package \pkg{mapoland} is to: \enumerate{
#'\item Store polygon data in shape files instead of in R images (\code{rda}
#'files) of objects of class "\linkS4class{SpatialPolygonsDataFrame}". The user
#'can easily import them using \code{\link{getShape}} function in this package.
#'
#'\item Limit the number of polygon attributes in the shape files to absolute
#'minimum necessary for identifying the polygons. Currently the polygons can be
#'identified with TERYT codes as well as area names in various encodings, see
#'sections below for details.
#'
#'\item All additional polygon attributes are stored in separate data frames,
#'to be loaded with \code{\link{data}}. They can be matched with the polygons
#'"on the fly" as well as used for other purposes. }
#'
#'Quick list of available shape files (see sections below for details):
#'\describe{ \item{list("polska.shp")}{low-quality contour of Poland}
#'\item{list("voiv.shp")}{low-quality polygons for Polish voivodships} }
#'
#'See section "Accessing the shape files" at the end for how to get your hands
#'on the data.
#'
#'
#'@section polska.shp: Contour of Poland:
#'
#'\tabular{ll}{ File:\tab \code{polska.shp}\cr Source:\tab Unknown }
#'
#'This is a simple low-quality contour of Poland. Very usefull for presentation
#'purposes, not for any serious geo-/spatial purposes. Point coordinates do not
#'have any geographical interpretation and the projection is unknown. The shape
#'file does not contain any polygon attributes.
#'@references TERYT database, National Official Register of Territorial
#'Division of the Country \url{http://www.stat.gov.pl/bip/36_ENG_HTML.htm}
#'
#'Poland and its administrative units:
#'\url{http://en.wikipedia.org/wiki/Voivodeships_of_Poland}
#'@examples
#'
#'# Contour of Poland
#'plot(getShape("polska"))
#'
#'# Voivodships with their names
#'pl <- getShape("voiv")
#'plot(pl)
#'text(coordinates(pl), labels=voivNames(), cex=0.8)
#'
NULL





#'Data on Polish voivodships
#'
#'Some extra data on Polish voivodships.
#'
#'
#'@name voivData
#'@docType data
#'@format A data frame with 16 observations on the following 4 variables.
#'\describe{ \item{list("teryt")}{numeric, area code from "TERYT": official
#'Polish area classification} \item{list("area")}{numeric, area in square
#'kilometers} \item{list("perimeter")}{numeric, voivodship perimeter in
#'kilometers} \item{list("pop2001")}{numeric, voivodship population in 2001} }
#'@source Official statistics: \url{http://www.stat.gov.pl}
#'
#'TERYT database: \url{http://www.stat.gov.pl/broker/access/index.jspa}
#'@keywords datasets
#'@examples
#'
#'# areas of voivodships
#'a <- structure( voivData$area, names=rownames(voivData))
#'s <- getShape("voiv")
#'k <- coordinates(s)
#'# colors
#'x <- a - min(a)
#'kol <- x / max(x)
#'plot(s, col=gray(kol))
#'text( coordinates(s), labels=voivNames(), col=gray((1-kol)>.5),
#'    cex=.8)
#'
NULL



