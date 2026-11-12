#!/usr/bin/env bash

set -e

fonts=(
    "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
)

FONT_DIR="$HOME/.local/share/fonts"

echo "==> Creating fonts directory..."
mkdir -p "$FONT_DIR" 2>/dev/null

for font in "${fonts[@]}"; do
    name=$(basename "$font" .zip)
    file="/tmp/$name.zip"

    echo "==> Downloading $name..."
    curl -fsSL "$font" -o "$file"

    echo "==> Installing $name..."
    unzip -oq "$file" -d "$FONT_DIR"

    rm "$file"
    echo "==> $name installed successfully!"
done

echo "==> Refreshing font cache..."
fc-cache -f

echo "==> All fonts installed successfully!"
