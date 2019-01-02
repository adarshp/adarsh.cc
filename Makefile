rebuild:
	cd Curriculum-Vitae; lualatex curriculum_vitae.tex;
	mv Curriculum-Vitae/curriculum_vitae.pdf assets/cv_adarsh.pdf
	stack exec site rebuild

deploy:
	stack exec site deploy
