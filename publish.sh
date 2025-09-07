#!/usr/bin/env bash
set -euo pipefail
ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"

# 1) Build the site
pip install -r requirements.txt >/dev/null
jb clean --all book || true
jb build book/

# 2) Publish to gh-pages using a temporary worktree
rm -rf .gh-pages-work || true
git worktree add .gh-pages-work gh-pages
rsync -a --delete book/_build/html/ .gh-pages-work/
touch .gh-pages-work/.nojekyll

cd .gh-pages-work
git add -A
git commit -m "publish(site): $(date -u +'%Y-%m-%dT%H:%M:%SZ')" || true
git push
cd "$ROOT"
git worktree remove .gh-pages-work --force
echo "Published to gh-pages."
