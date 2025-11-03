set -euo pipefail

REPO_DIR="${REPO_DIR:-$(pwd)}"
DOCS_DIR="$REPO_DIR/docs/chronicle"
MANIFEST="$REPO_DIR/manifests/rightbrain_manifest.json"
mkdir -p "$DOCS_DIR"
if command -v rsync >/dev/null 2>&1; then
  rsync -a "$REPO_DIR/RightBrain_Chronicle/" "$DOCS_DIR/" || true
else
  cp -R "$REPO_DIR/RightBrain_Chronicle/." "$DOCS_DIR/" 2>/dev/null || true
fi
DATE="$(date +%F)"
LATEST_FILE="$(ls -t "$DOCS_DIR"/*.md 2>/dev/null | head -n 1 || true)"
LATEST_BASENAME="$(basename "${LATEST_FILE:-}" 2>/dev/null || true)"

mkdir -p "$(dirname "$MANIFEST")"
if [ -f "$MANIFEST" ] && command -v jq >/dev/null 2>&1; then
  jq --arg date "$DATE" --arg f "$LATEST_BASENAME" '
    .last_sync = $date
    | .latest_entry = $f
  ' "$MANIFEST" > "$MANIFEST.tmp" && mv "$MANIFEST.tmp" "$MANIFEST"
else
  cat > "$MANIFEST" <<JSON
{ "version": "1.0.0", "last_sync": "$DATE", "latest_entry": "$LATEST_BASENAME" }
JSON
fi

echo "== Memory synced =="
echo " last_sync     : $DATE"
echo " latest_entry  : ${LATEST_BASENAME:-<none>}"
echo " docs/chronicle: $(ls -1 "$DOCS_DIR" 2>/dev/null | wc -l | tr -d ' ') files"
