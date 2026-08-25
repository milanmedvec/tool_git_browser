# tool_git_browser

Small gitk-like terminal browser built with git, bash, fzf, and less.

## Commands

- `gitm` - browse git history and diffs interactively
- `git-show-pager` - pager helper that separates file diffs
- `gml` - repeat a previous commit message in an editable commit
- `gbb` - checkout a branch selected from recent checkout reflog entries

## Dependencies

Required commands:
- `bash`
- `git`
- `fzf`
- `dialog`
- `less`
- `awk`
- `sed`
- `tput`

Check required commands in your shell:

```bash
need() {
    command -v "$1" >/dev/null || echo "missing: $1"
}

for cmd in bash git fzf dialog less awk sed tput; do
    need "$cmd"
done
```

## Install

```bash
./install.sh
```

Install to a custom prefix:

```bash
PREFIX="$HOME/.local" ./install.sh
```

## Usage

```bash
gitm
gitm --first-parent main
gitm -- path/to/file
gml
gbb
```

## Configuration

- Override pager with `GGB_GIT_SHOW_PAGER=/path/to/pager`.

## Notes

These scripts were extracted from a personal Arch Linux + i3 workspace. Review dependencies and paths before using them on another machine.
