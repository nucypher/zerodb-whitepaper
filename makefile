SVG = $(wildcard svg/*.svg)
PDF = $(SVG:svg/%.svg=pdf/%.pdf)

all: $(PDF) zerodb.pdf zerodb.lof

zerodb.pdf:	zerodb.lof
		bibtex zerodb && pdflatex -halt-on-error zerodb.tex && pdflatex -halt-on-error zerodb.tex && rm -f *.aux *.log *.blg *.bbl *.toc *.out
zerodb.lof:	*.tex
		pdflatex -halt-on-error zerodb.tex
$(PDF):	pdf/%.pdf: svg/%.svg
		inkscape "$<" --export-pdf="$@"
