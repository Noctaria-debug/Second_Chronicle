#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_DIR"

git init
git add .
git commit -m "chore: seed Second_Chronicle"
echo "Initialized local repo. To add remote:"
echo "  git remote add origin <YOUR_REMOTE_URL>"
echo "  git branch -M main && git push -u origin main"
