#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_DIR"

MSG=${1:-"chore: update chronicles"}

git add .
git commit -m "$MSG" || echo "Nothing to commit."
echo "Tip: git push origin main"
