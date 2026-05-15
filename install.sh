#!/bin/bash

set -euo pipefail

echo "==> Installing packages..."
if [ -f "$DOTFILES/packages.txt" ]; then
  grep -vE '^\s*(#|$)' "$DOTFILES/packages.txt" | paru -S --needed -
else
  echo "  warn: packages.txt not found, skipping"
fi

DOTFILES="$HOME/dotfiles"

echo "==> Creating directories..."
mkdir -p "$HOME/.config/fish/conf.d"
mkdir -p "$HOME/.config/hypr"
mkdir -p "$HOME/.local/share"

echo "==> Linking fish config..."
ln -sfn "$DOTFILES/fish/.config/fish/conf.d/aliases.fish" "$HOME/.config/fish/conf.d/aliases.fish"

echo "==> Linking hypr config..."
ln -sfn "$DOTFILES/hypr/.config/hypr" "$HOME/.config/hypr"

echo "==> Linking .local/share/applications..."
ln -sfn "$DOTFILES/.local/share/applications" "$HOME/.local/share/applications"

echo "==> Done!"
