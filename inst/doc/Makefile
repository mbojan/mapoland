FILES=mapoland
TEXIDVI=texi2dvi --pdf
RSWEAVE=R CMD Sweave
RM=rm -f

# latex and other rubbish to clean-up
AUX=$(FILES:=.log) $(FILES:=.aux) $(FILES:=.svn) $(FILES:=.tex) $(FILES:=.toc) Rplots.pdf

# figure files
FIG=$(FILES:=-*.pdf) $(FILES:=-*.eps)

#============================================================================

all:
	$(MAKE) $(FILES:=.pdf)
	$(MAKE) clean


%.tex: %.Rnw
	$(RSWEAVE) $<

%.pdf: %.tex
	$(TEXIDVI) $<

.PHONY: clean
clean:
	$(RM) $(AUX) $(FIG)


.PHONY: cleanall
cleanall:
	$(MAKE) clean
	$(RM) $(FILES:=.pdf)
