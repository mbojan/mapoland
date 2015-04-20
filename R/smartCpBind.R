# given a vector and a polygondataframe add the vector to attribute table
# matching it by names with the other attributes in the polygon
# sp = SpatialPolygonsDataFrame
# x = numeric vector
# matchattr = name of the attribute in sp which should be used for matching
smartSpCbind <- function(sp, x, matchattr=NULL)
{
    stopifnot(inherits(sp, "SpatialPolygonsDataFrame"))
    stopifnot(length(x) == nrow(sp))
    # matching on names or not
    if( !is.null(names(x)) )
    {
        # match names with attributes
        nams <- names(x)
        if( is.null(matchattr) )
        {
            # match against all available and choose best (least NAs)
            mvl <- lapply( sp@data, function(v) match( v, nams ))
            isna <- lapply(mvl, is.na)
            i <- which.min(sapply(isna, sum))
            matchattr <- names(sp)[i]
            message("matching on attribute ", matchattr)
            mv <- mvl[[i]]
        } else
        {
            # match against specific attribute
            stopifnot( matchattr %in% names(sp))
            mv <- match( sp[[matchattr]], nams )
        }
        if(any(is.na(mv)))
            warning("non-perfect match between vector names and attribute ",
                sQuote(matchattr), ", there are ", 
                sum(is.na(mv)), " (", 
                round(sum(is.na(mv)) / length(mv) * 100, 1),
                "%) non-matches")
        x <- x[mv]
    } else {
        warning("vector 'x' has no names, using as is")
    }
    names(x) <- rownames(sp@data)
    dat <- data.frame("x"=x)
    maptools::spCbind(sp, dat)
}
