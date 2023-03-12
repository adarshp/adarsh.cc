.PHONY: assets/cv_adarsh.pdf
assets/cv_adarsh.pdf:
	cd Curriculum-Vitae; make
	cp Curriculum-Vitae/build/curriculum_vitae.pdf assets/cv_adarsh.pdf

build:
	stack exec generator build

rebuild:
	stack exec generator rebuild

watch:
	stack exec generator watch

deploy: build assets/cv_adarsh.pdf
	stack exec generator deploy
# Not sure why but we need to do this twice
	stack exec generator deploy
