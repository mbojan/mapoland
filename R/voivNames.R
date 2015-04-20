#' Get names of Polish voivodships
#' 
#' Get names of Polish voivodships from the shapefile in current encoding.
#' 
#' If \code{enc} is \code{NULL} the returned names do not have any polish
#' diacritics which was a ad-hoc solution to character encoding conversion
#' problems. If \code{enc} is a character, then its value is passed to \code{to}
#' argument of \code{\link{iconv}}.
#' 
#' The names are read from the attribute in the shape file \code{voiv.shp}.
#' Consequently, they are in the same order as the polygons there.
#' 
#' @param enc character or NULL, name of the encoding to which convert the names
#' of voivodships, see \code{\link{iconv}} for possibilities
#'
#' @return Character vector with voivodship names in the encoding specified by
#' \code{enc}. The names of the result are TERYT codes of the polygons.
#'
#' @seealso \code{\link{mapoland-package}} for more information on included shape files. \code{\link{iconv}}
#'
#' @export
#'
#' @examples
#' # in current encoding
#' voivNames()
#' 
#' # pure ASCII
#' voivNames(NULL)
#' 
voivNames <- function(enc="")
{
    s <- getShape("voiv")
    if(is.null(enc))
    {
        # without diacritics
        rval <- as.character( s[["names_asci"]] )
    } else
    {
        # convert to current locale
        nams <- s[["names_lati"]]
        rval <- iconv(nams, from="latin2", to=enc)
    }
    names(rval) <- s[["teryt"]]
    rval
}

