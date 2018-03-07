# Use Beamer for slides, Minted for code highlighting.
# Minted requires Pygments: http://pygments.org/
DOCUMENT_NAME = presentation
OUTPUT_DIR    = output

#
# latexmk
#

# Build document with latexmk
all: presentation

# Remove output directory and generated document
clean:
	rm -rf $(OUTPUT_DIR)
	rm -f $(DOCUMENT_NAME).pdf
	rm -f $(DOCUMENT_NAME).synctex.gz

# Cleanup the temporary files
cleanup:
	latexmk -c

presentation:
	latexmk


.PHONY: all clean cleanup
