#!/usr/bin/env bash
set -euo pipefail

# safety: must be on main
branch="$(git rev-parse --abbrev-ref HEAD)"
if [[ "$branch" != "main" ]]; then
  echo "❌ publish.sh: run from 'main' (current: $branch)"; exit 1;
fi

# deps (quiet, no pip nags)
if [[ -f requirements.txt ]]; then
  python3 -m pip install --disable-pip-version-check -q -r requirements.txt
else
  python3 -m pip install --disable-pip-version-check -q jupyter-book
fi

# clean + build
jb clean --all book || true
jb build book/

# prepare gh-pages branch (create if missing) via worktree
git show-ref --verify --quiet refs/heads/gh-pages || git branch gh-pages
rm -rf .gh-pages-work || true
git worktree add .gh-pages-work gh-pages

# publish built HTML
rsync -a --delete book/_build/html/ .gh-pages-work/
touch .gh-pages-work/.nojekyll

pushd .gh-pages-work >/dev/null
git add -A
git commit -m "publish(site): $(date -u +'%Y-%m-%dT%H:%M:%SZ')" || true
git push -u origin gh-pages
popd >/dev/null

git worktree remove .gh-pages-work --force
echo "✅ Published to gh-pages."
