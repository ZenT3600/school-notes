outfolder := .
readmemd := README.md
raws := $(filter-out $(readmemd), $(wildcard */*.md))
pandoc := pandoc --self-contained --standalone --verbose --lua-filter diagram-generator.lua

%.md.pdf: %.md
	$(pandoc) -o "$(outfolder)/$@" $<

all: $(raws)
	@for f in $(raws); do make $${f}.pdf; done
