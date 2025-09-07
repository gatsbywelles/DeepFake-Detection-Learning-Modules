#!/usr/bin/env bash
set -euo pipefail

# safety: must be on main
branch="$(git rev-parse --abbrev-ref HEAD)"
if [[ "$branch" != "main" ]]; then
  echo "❌ publish.sh: run from 'main' (current: $branch)"; exit 1;
fi

# deps
if [[ -f requirements.txt ]]; then
  python3 -m pip install --disable-pip-version-check -q -r requirements.txt
else
  python3 -m pip install --disable-pip-version-check -q jupyter-book
fi

# clean + build
jb clean --all book || true
jb build book/

# ensure gh-pages exists and is up-to-date (create if missing)
git fetch origin --prune
git show-ref --verify --quiet refs/remotes/origin/gh-pages || {
  # first-time init
  tmpdir="$(mktemp -d)"
  git worktree add "$tmpdir" main
  ( cd "$tmpdir" && rm -rf ./* && printf "init\n" > .init && git add -A && git commit -m "init gh-pages" )
  ( cd "$tmpdir" && git branch -M gh-pages && git push -u origin gh-pages )
  git worktree remove "$tmpdir" --force
}

# use a worktree checked out at origin/gh-pages tip
rm -rf .gh-pages-work || true
git worktree add -B gh-pages .gh-pages-work origin/gh-pages

# publish built HTML (keep .git intact!)
rsync -a --delete \
  --exclude '.git' \
  --exclude '.gitignore' \
  book/_build/html/ .gh-pages-work/
touch .gh-pages-work/.nojekyll

# commit & push site
git -C .gh-pages-work add -A
git -C .gh-pages-work commit -m "publish(site): $(date -u +'%Y-%m-%dT%H:%M:%SZ')" || true
git -C .gh-pages-work push -u origin gh-pages

# cleanup worktree (fallback to rm if .git was removed for any reason)
git worktree remove .gh-pages-work --force 2>/dev/null || rm -rf .gh-pages-work

echo "✅ Published to gh-pages."
