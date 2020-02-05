all: curriculum_vitae.tex bibliography.bib
	latexmk -lualatex -g -interaction=nonstopmode -outdir=build curriculum_vitae.tex 

clean:
	latexmk -C *.tex
