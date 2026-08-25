#!/usr/bin/env bash
set -euo pipefail

prefix="${PREFIX:-$HOME/.local}"
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -d "$repo_dir/bin" ]]; then
    for file in "$repo_dir"/bin/*; do
        [[ -f "$file" ]] || continue
        install -Dm755 "$file" "$prefix/bin/$(basename "$file")"
        echo "installed: $prefix/bin/$(basename "$file")"
    done
fi

if [[ -d "$repo_dir/share/applications" ]]; then
    app_dir="${XDG_DATA_HOME:-$HOME/.local/share}/applications"
    for file in "$repo_dir"/share/applications/*.desktop; do
        [[ -f "$file" ]] || continue
        install -Dm644 "$file" "$app_dir/$(basename "$file")"
        echo "installed: $app_dir/$(basename "$file")"
    done
fi
