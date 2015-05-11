ASCIIDOC=asciidoc
ASCIIDOC_OPTS=-a data-uri -a stylesdir=$(PWD)/stylesheets

GENERATED_METAFILES= \
	TOC.html

GENERATED_CHAPTERS= \
	01_Kernel_Crypto_API_Interface_Specification.html \
	02_Kernel_Crypto_API_Architecture.html \
	03_Developing_Cipher_Algorithms.html \
	04_User_Space_Interface.html \
	05_Programming_Interface.html \
	06_Code_Examples.html

GENERATED_HTML=$(GENERATED_METAFILES) $(GENERATED_CHAPTERS)

all: html pdf

pdf: Linux_Kernel_Crypto_API.pdf

Linux_Kernel_Crypto_API.pdf: *.txt
	a2x -f pdf --asciidoc-opts "$(ASCIIDOC_OPTS)" Linux_Kernel_Crypto_API.txt --no-xmllint

html: $(GENERATED_HTML)

.SUFFIXES: .txt .html

.txt.html:
	$(ASCIIDOC) $(ASCIIDOC_OPTS) $<

clean:
	rm -f *~
	rm -f Linux_Kernel_Crypto_API.pdf $(GENERATED_HTML)
