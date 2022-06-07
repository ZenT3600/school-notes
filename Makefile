outfolder := .
readmemd := README.md
placeholder := xyzINSERTBADGESxyz
raws := $(filter-out $(readmemd), $(wildcard */*.md))
pandoc := pandoc --pdf-engine=pdflatex --self-contained --standalone --verbose --filter pandoc-eqnos --lua-filter diagram-generator.lua

readme: $(readmemd).og

%.md.pdf: %.md
	$(pandoc) -o "$(outfolder)/$@" $<

all: $(raws)
	@for f in $(raws); do make $${f}.pdf; done
