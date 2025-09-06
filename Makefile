.PHONY: build clean serve publish

build:
	jb build book/

clean:
	jb clean --all book/
	rm -rf book/_build docs

serve:
	python -m http.server -d book/_build/html 8080

publish: build
	rm -rf docs
	mkdir -p docs
	cp -r book/_build/html/* docs/
	touch docs/.nojekyll
