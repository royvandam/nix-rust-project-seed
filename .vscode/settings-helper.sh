#!/usr/bin/env bash

set -euo pipefail

# Find nearest flake directory (i.e., with flake.nix)
find_flake_root() {
  local dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/flake.nix" ]]; then
      echo "$dir"
      return 0
    fi
    dir="$(dirname "$dir")"
  done
  echo "Error: No flake.nix found in any parent directory." >&2
  exit 1
}

flake_dir="$(find_flake_root)"

if [[ -z "${IN_NIX_SHELL:-}" ]]; then
  exec nix develop "$flake_dir" --command "$0" "$@"
fi

show_usage() {
  echo "Usage: $0 [--get-rust-analyzer-path | --get-nix-formatter-path | --get-env-path]"
  exit 1
}

if [[ $# -ne 1 ]]; then
  show_usage
fi


case "$1" in
  --get-rust-analyzer-path)
    which rust-analyzer || { echo "rust-analyzer not found" >&2; exit 1; }
    ;;

  --get-nix-formatter-path)
    which nixfmt || { echo "nixfmt not found" >&2; exit 1; }
    ;;

  --get-env-path)
    echo "$PATH"
    ;;

  *)
    show_usage
    ;;
esac