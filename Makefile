rebuild:
	cd Curriculum-Vitae; make
	mv Curriculum-Vitae/curriculum_vitae.pdf assets/cv_adarsh.pdf
	stack exec site rebuild

deploy:
	stack exec site deploy
