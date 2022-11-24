assets/cv_adarsh.pdf: Curriculum-Vitae/curriculum_vitae.tex Curriculum-Vitae/bibliography.bib
	cd Curriculum-Vitae; make
	cp Curriculum-Vitae/build/curriculum_vitae.pdf assets/cv_adarsh.pdf

build:
	stack exec site build

rebuild:
	stack exec site rebuild

watch:
	stack exec site watch

deploy: build assets/cv_adarsh.pdf
	stack exec site deploy
