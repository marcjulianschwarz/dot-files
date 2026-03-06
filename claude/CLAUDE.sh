#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ -f "DOCUMENTATION.md" ]; then
  cat "DOCUMENTATION.md"
fi

if [ $# -eq 0 ]; then
  for file in "$SCRIPT_DIR"/CLAUDE_*.md; do
    [ -f "$file" ] && cat "$file"
  done
  exit 0
fi

for type in "$@"; do
  file="$SCRIPT_DIR/CLAUDE_${type}.md"
  if [ -f "$file" ]; then
    cat "$file"
  else
    echo "Error: CLAUDE_${type}.md not found" >&2
  fi
done
