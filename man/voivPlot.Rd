\name{voivPlot}
\alias{voivPlot}
\title{Plot data on Polish voivodships}
\description{
Plot numeric data on Polish voivodships
}
\usage{
voivPlot(x, ..., matchattr = NULL)
}
\arguments{
  \item{x}{named numeric vector, data to be plotted}
  \item{\dots}{other arguments passed to \code{\link[sp]{spplot}}}
  \item{matchattr}{character or \code{NULL}, name of the polygon attribute
  that should be used for matching against names of \code{x}, see Details}
}
\details{
The data vector \code{x} should be named to match it against polygon names in
the underlying spatial object so that values in \code{x} are properly assigned
to voivodships. If there are no names \code{x} is assumed to be properly
ordered, but a warning is thrown.

If \code{x} has names then, depending on the value of \code{matchattr}, the
names are matched against attribute(s) of the underlying spatial object. If
\code{matchattr} is \code{NULL} then names of \code{x} are matched against all
available attributes and best match (least number of NAs in the matching
vector) is used for the match. If \code{matchattr} is a character scalar, then
it is assumed to be the name of the attribute to be used for matching.

The underlying shapefile has the following polygon attributes that can be used
for matching: "teryt", "names_asci", "names_utf8", "names_lati".  See
\link{shapes} for further details.

The plot is produced using \code{\link[sp]{spplot}}.
}
\value{
Object of class "trellis" returned invisibly containing the plotting structure.
The plot is produced.
}
\seealso{
\link{shapes} for the documentation of available shapes in package \pkg{mapoland}.

\code{\link[sp]{spplot}}, \code{\link{spCbind}}
}
