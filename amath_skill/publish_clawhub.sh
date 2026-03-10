#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

SLUG="${1:-amath-skill}"
VERSION="${2:-1.0.0}"
CHANGELOG="${3:-Initial public release}"
TAGS="${4:-latest,education,math,olympiad,socratic,learning}"
NAME="${CLAWHUB_NAME:-amath skill}"

if ! command -v clawhub >/dev/null 2>&1; then
  echo "clawhub CLI not found. Install it first with: npm i -g clawhub" >&2
  exit 1
fi

cat <<EOF
Publishing to ClawHub with:
- path: $SCRIPT_DIR
- slug: $SLUG
- name: $NAME
- version: $VERSION
- tags: $TAGS
EOF

clawhub publish . \
  --slug "$SLUG" \
  --name "$NAME" \
  --version "$VERSION" \
  --changelog "$CHANGELOG" \
  --tags "$TAGS"
