.PHONY: assets/cv_adarsh.pdf
assets/cv_adarsh.pdf:
	cd Curriculum-Vitae; make
	cp Curriculum-Vitae/curriculum_vitae.pdf assets/cv_adarsh.pdf

build:
	stack exec generator build

rebuild:
	stack exec generator rebuild

watch:
	stack exec generator watch

deploy: build assets/cv_adarsh.pdf
	rsync -avzdP _site/ starfish:adarsh_cc
