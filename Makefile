# Build both templates by default. Output stays in the repository root.
PDFLATEX ?= pdflatex
TEXFLAGS = -interaction=nonstopmode -halt-on-error -file-line-error -synctex=1
DOCUMENTS = slides poster
GENERATED_EXTENSIONS = aux log nav out pdf snm toc vrb synctex.gz fdb_latexmk fls

.PHONY: all $(DOCUMENTS) clean clean-aux
all: $(DOCUMENTS)

# Two passes resolve slide totals, contents, and references.
$(DOCUMENTS):
	$(PDFLATEX) $(TEXFLAGS) $@.tex
	$(PDFLATEX) $(TEXFLAGS) $@.tex

# Remove only these documents' generated files in the repository root.
clean:
	rm -f $(foreach document,$(DOCUMENTS),$(addprefix ./$(document).,$(GENERATED_EXTENSIONS)))

# Remove auxiliary files while keeping the generated PDFs.
clean-aux:
	rm -f $(foreach document,$(DOCUMENTS),$(addprefix ./$(document).,$(filter-out pdf,$(GENERATED_EXTENSIONS))))
