.PHONY: build clean serve

build: jb build book/

clean: jb clean --all book/ rm -rf book/_build

serve: python -m http.server -d book/_build/html 8080
