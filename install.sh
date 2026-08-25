#!/usr/bin/env bash
set -euo pipefail

prefix="${PREFIX:-$HOME/.local}"
data_home="${XDG_DATA_HOME:-$HOME/.local/share}"
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_name="$(basename "$repo_dir")"

install_bin() {
    local file="$1"
    install -Dm755 "$file" "$prefix/bin/$(basename "$file")"
    echo "installed: $prefix/bin/$(basename "$file")"
}

install_data_file() {
    local source_root="$1"
    local target_root="$2"
    local file="$3"
    local rel="${file#"$source_root"/}"

    install -Dm644 "$file" "$target_root/$rel"
    echo "installed: $target_root/$rel"
}

if [[ -d "$repo_dir/bin" ]]; then
    for file in "$repo_dir"/bin/*; do
        [[ -f "$file" ]] || continue
        install_bin "$file"
    done
fi

if [[ -d "$repo_dir/share" ]]; then
    while IFS= read -r -d '' file; do
        install_data_file "$repo_dir/share" "$data_home" "$file"
    done < <(find "$repo_dir/share" -type f -print0)
fi

if [[ -d "$repo_dir/shell" ]]; then
    while IFS= read -r -d '' file; do
        install_data_file "$repo_dir/shell" "$prefix/share/$repo_name/shell" "$file"
    done < <(find "$repo_dir/shell" -type f -print0)
fi
