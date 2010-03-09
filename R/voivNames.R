
# get voiv names from shape file and convert to encoding
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

