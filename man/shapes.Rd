\name{shapes}
\alias{shapes}
\title{Spatial data on Poland}
\description{
Package \pkg{mapoland} provides some extra data files with spatial
information about Poland. These are in ESRI shape files stored in the \code{shapes}
folder of the package directory.

The policy that is implemented in package \pkg{mapoland} is to:
\enumerate{
  \item Store polygon data in shape files instead of in R images (\code{rda}
  files) of objects of class "\linkS4class{SpatialPolygonsDataFrame}".

  \item Limit the number of polygon attributes in the shape files to absolute
  minimum necessary for identifying the polygons.

  \item All additional polygon attributes are stored in separate data frames,
  to be loaded with \code{\link{data}}, that can be matched with the polygons
  "on the fly" as well as used for other purposes.
}

Available shape files (see sections below for details):
\describe{
  \item{polska.shp}{low-quality contour of Poland}
  \item{voiv.shp}{low-quality polygons for Polish voivodships}
}

See section "Accessing the shape files" at the end for how to get your hands on
the data.
}

\section{Contour of Poland}{
File: \code{polska.shp}.

This is a simple low-quality contour of Poland. Point coordinates
do not have any geographical interpretation and the projection
is unknown. The shape file does not contain any polygon attributes.
}

\section{Voivodships}{
File: \code{voiv.shp}.

16 low-quality polygons of polish voivodships (top administrative units).
Point coordinates do not have any geographical interpretation and the
projection is unknown. The shape has the following polygon attributes:
\describe{
  \item{teryt}{Area code from TERYT database, official territorial
  classification (\url{http://www.stat.gov.pl})}

  \item{names_asci}{Voivodship names in plain ASCII, without Polish diacritics}

  \item{names_utf8}{Voivodship names in UTF-8 encoding}

  \item{names_lati}{Voivodship names in Latin2 encoding}
}
}


\section{Accessing the shape files}{
The files can be accessed directly with, for example:
\preformatted{
system.file("shapes", "voiv.shp", package="mapoland")
}
or using the \code{\link{getShape}} wrapper function which returns
objects inherting from class "\linkS4class{Spatial}" (package \pkg{sp}).
}

\source{
\describe{
  \item{voiv.shp}{unknown, points were read-off from a low-quality
  administrative map of Poland}

  \item{polska.shp}{unknown, points were read-off from a low-quality
  administrative map of Poland}
}
}

\references{
TERYT database \url{http://www.stat.gov.pl}

Poland and its administrative units:
\url{http://en.wikipedia.org/wiki/Voivodeships_of_Poland}
}



\examples{
# Contour of Poland
plot(getShape("polska"))

# Voivodships
pl <- getShape("voiv")
plot(pl)
text(coordinates(pl), labels=voivNames(), cex=0.8)
}
