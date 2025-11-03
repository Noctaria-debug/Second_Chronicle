#!/usr/bin/env bash
# sync_memory.sh — RightBrain Chronicle を Thoughtbook と同期する最小スクリプト
# 使い方: ./scripts/sync_memory.sh
set -euo pipefail

REPO_DIR="${REPO_DIR:-$(pwd)}"
RB_DIR="$REPO_DIR/RightBrain_Chronicle"
MANIFEST="$REPO_DIR/manifests/rightbrain_manifest.json"
THOUGHTBOOK_DIR="$REPO_DIR/Thoughtbook"

# 必要フォルダ存在確認
[ -d "$RB_DIR" ] || { echo "RightBrain_Chronicle not found: $RB_DIR"; exit 1; }
[ -f "$MANIFEST" ] || { echo "Manifest not found: $MANIFEST"; exit 1; }
[ -d "$THOUGHTBOOK_DIR" ] || { echo "Thoughtbook not found: $THOUGHTBOOK_DIR"; exit 1; }

# jq があれば使う（無ければ簡易処理）
if command -v jq >/dev/null 2>&1; then
  echo "== Manifest links =="
  jq -r '.links[] | "\(.chronicle_file) -> \(.chapter) [\(.tags|join(","))]"' "$MANIFEST"
else
  echo "jq not found; skipping pretty print"
fi

# 簡易同期: 右脳断片を docs にコピー（公開用）
DOCS_RB_DIR="$REPO_DIR/docs/chronicle"
mkdir -p "$DOCS_RB_DIR"
rsync -a "$RB_DIR/" "$DOCS_RB_DIR/"

echo "Synced RightBrain_Chronicle -> docs/chronicle"
