---
sphinx:
config:
html_theme_options:
use_download_button: true
repository:
url: https://github.com/YOUR_USER/YOUR_REPO
path_to_book: book
branch: main
EOF


cat > book/_toc.yml <<'EOF'
format: jb-book
root: intro
chapters:
- file: policies
- file: readiness
- file: education
- file: detection
- file: response
- file: improvements
- file: knowledge-check
- file: resources
- file: notebooks/hello
EOF


cat > book/intro.md <<'EOF'
# Overview


Welcome! This is the landing page of your Cybersecurity Program.
EOF


for p in policies readiness education detection response improvements resources; do
cat > book/${p}.md <<EOF
# ${p^}


Write your ${p} content here.
EOF
done


cat > book/knowledge-check.md <<'EOF'
# Knowledge Check


Add questions here.
EOF


cat > book/notebooks/hello.ipynb <<'EOF'
{
"cells": [
{"cell_type": "markdown", "metadata": {}, "source": ["# Hello Notebook
","This is an example page with a notebook."]},
{"cell_type": "code", "execution_count": null, "metadata": {}, "outputs": [], "source": ["print('Hello from Jupyter Book!')"]}
],
"metadata": {"kernelspec": {"display_name": "Python 3", "language": "python", "name": "python3"}},
"nbformat": 4,
"nbformat_minor": 5
}
EOF


# Makefile with publish target
cat > Makefile <<'EOF'
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
EOF


# Optional logo placeholder
mkdir -p book/_static && printf '' > book/_static/logo.png || true


# Initial build so the site can be published
jb build book/ || true
printf "
Scaffold complete. Next: update repository.url in book/_config.yml to your repo URL.
"
