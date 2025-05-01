all: non_pt pt

non_pt:
	typst compile curriculum_vitae.typ \
		--font-path "/Users/adarsh/Library/Application Support/Adobe/CoreSync/plugins/livetype/.r"

pt:
	typst compile curriculum_vitae.typ \
		--font-path "/Users/adarsh/Library/Application Support/Adobe/CoreSync/plugins/livetype/.r" \
		--input promotion_and_tenure=true cv_adarsh_pt.pdf

# For live previewing
watch:
	typst watch curriculum_vitae.typ \
		--font-path "/Users/adarsh/Library/Application Support/Adobe/CoreSync/plugins/livetype/.r"

watch_pt:
	typst watch curriculum_vitae.typ \
		--font-path "/Users/adarsh/Library/Application Support/Adobe/CoreSync/plugins/livetype/.r" \
		--input promotion_and_tenure=true cv_adarsh_pt.pdf

clean:
	rm curriculum_vitae.pdf
