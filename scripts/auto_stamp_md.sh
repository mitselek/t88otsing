#!/usr/bin/env bash
set -euo pipefail

# Usage: auto_stamp_md.sh <files...>
# For each .md file: update an existing "Last updated:" line near the top,
# or insert it just after the first H1 (# ...) with proper blank lines.

now=$(date --iso-8601=seconds 2>/dev/null || date -Iseconds 2>/dev/null || date)

stamp_file() {
  local f="$1"
  # Only .md files that exist
  [[ -f "$f" ]] || return 0
  [[ "${f##*.}" == "md" ]] || return 0

  # If a Last updated line exists in first 30 lines, replace it in-place
  if grep -m1 -n '^Last updated:' "$f" >/dev/null; then
    # Replace the first occurrence anywhere (GNU sed compatible)
    sed -i "0,/^Last updated:.*$/s//Last updated: ${now}/" "$f"
    return 0
  fi

  # Find first H1 header line
  local h1_line
  h1_line=$(grep -n '^# ' "$f" | head -n1 | cut -d: -f1 || true)

  if [[ -n "${h1_line}" ]]; then
    # Insert after the H1 with surrounding blank lines
    awk -v insert_line="${h1_line}" -v ts="${now}" '
      NR==insert_line {
        print $0
        print ""
        print "Last updated: " ts
        print ""
        next
      }
      { print $0 }
    ' "$f" >"$f.__stamp__" && mv "$f.__stamp__" "$f"
  else
    # No H1: prepend at top with a blank line after
    printf "Last updated: %s\n\n" "$now" | cat - "$f" >"$f.__stamp__" && mv "$f.__stamp__" "$f"
  fi
}

for path in "$@"; do
  stamp_file "$path"
done
