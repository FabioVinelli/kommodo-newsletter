#!/usr/bin/env bash
set -euo pipefail

EDITION_PATH="${1:-}"
COMMIT_MSG="${2:-}"

if [[ -z "$EDITION_PATH" || -z "$COMMIT_MSG" ]]; then
  echo "ERROR: Missing args."
  echo "Usage: $0 <edition_path> <commit_message>"
  exit 1
fi

if [[ ! -f "$EDITION_PATH" ]]; then
  echo "ERROR: Edition file not found: $EDITION_PATH"
  exit 1
fi

# Cheap sanity checks
grep -q "KOMMODO DIGITAL" "$EDITION_PATH" || { echo "ERROR: Missing KOMMODO DIGITAL marker"; exit 1; }

echo "==> Preflight: ensure we're on main"
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo "ERROR: Not a git repo"; exit 1; }
git checkout main >/dev/null 2>&1 || true

# If dirty, stash (including untracked) so pull --rebase won't fail
if ! git diff --quiet || ! git diff --cached --quiet || [[ -n "$(git ls-files --others --exclude-standard)" ]]; then
  echo "==> Working tree not clean. Stashing changes..."
  git stash push -u -m "auto-stash before publish"
  STASHED=1
else
  STASHED=0
fi

echo "==> Pull latest (rebase)"
git pull --rebase origin main

# Re-apply stashed changes if we stashed
if [[ "$STASHED" -eq 1 ]]; then
  echo "==> Restoring stashed changes..."
  git stash pop || {
    echo "ERROR: Stash pop produced conflicts. Resolve, then rerun publish."
    exit 1
  }
fi

echo "==> Stage edition + index"
git add "$EDITION_PATH" index.html || true

if git diff --cached --quiet; then
  echo "No staged changes. Nothing to commit."
  exit 0
fi

echo "==> Commit + push"
git commit -m "$COMMIT_MSG"
git push origin main

echo "==> Done. Verify live:"
echo "https://newsletter.kommodo.io/${EDITION_PATH}"
