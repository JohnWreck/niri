#!/usr/bin/env bash

set -Eeuo pipefail

# --------------------------------------------------
# Configuration
# --------------------------------------------------

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

USER_DIR="${SCRIPT_DIR}/user"
TARGET_DIR="${HOME}"

TIMESTAMP="$(date +'%Y%m%d_%H%M%S')"

# --------------------------------------------------
# Validation
# --------------------------------------------------

if [[ ! -d "$USER_DIR" ]]; then
    echo "ERROR: user directory not found: $USER_DIR" >&2
    exit 1
fi

# --------------------------------------------------
# Backup
# --------------------------------------------------

backup() {
    local target="$1"
    local backup="${target}.bak.${TIMESTAMP}"

    # Prevent overwriting an existing backup
    if [[ -e "$backup" || -L "$backup" ]]; then
        backup="${backup}.$RANDOM"
    fi

    echo "  Backup: $target"
    mv -- "$target" "$backup"
}

# --------------------------------------------------
# Symlink
# --------------------------------------------------

link_file() {
    local source="$1"
    local relative="${source#"$USER_DIR"/}"
    local target="${TARGET_DIR}/${relative}"
    local target_parent

    target_parent="$(dirname -- "$target")"

    # Create destination directory structure
    mkdir -p -- "$target_parent"

    # Already linked correctly
    if [[ -L "$target" ]] &&
       [[ "$(readlink -- "$target")" == "$source" ]]; then
        echo "  Exists: $relative"
        return 0
    fi

    # Backup existing files, directories, or symlinks
    if [[ -e "$target" || -L "$target" ]]; then
        backup "$target"
    fi

    # Create symlink
    ln -s -- "$source" "$target"

    echo "  Linked: $relative"
}

# --------------------------------------------------
# Installation
# --------------------------------------------------

echo "======================================"
echo " user installation"
echo "======================================"
echo "Source:      $USER_DIR"
echo "Destination: $TARGET_DIR"
echo

# Discover all files recursively.
# Hidden files are included automatically by find.
while IFS= read -r -d '' source; do
    link_file "$source"
done < <(find "$USER_DIR" -type f -print0)

echo
echo "======================================"
echo " Installation complete!"
echo "======================================"

