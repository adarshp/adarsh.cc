rebuild: 
	cd Curriculum-Vitae; make
	cp Curriculum-Vitae/build/curriculum_vitae.pdf assets/cv_adarsh.pdf
	stack exec site rebuild

deploy: rebuild
	stack exec site deploy
