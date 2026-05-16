#!/bin/bash

set -euo pipefail

DOTFILES="$HOME/dotfiles"

echo "==> Installing packages..."
if [ -f "$DOTFILES/packages.txt" ]; then
  grep -vE '^\s*(#|$)' "$DOTFILES/packages.txt" | paru -S --needed -
else
  echo "  warn: packages.txt not found, skipping"
fi

echo "==> Creating directories..."
mkdir -p "$HOME/.config/fish/conf.d"
mkdir -p "$HOME/.local/share"

echo "==> Linking fish config..."
ln -sfn "$DOTFILES/fish/config/fish/conf.d/aliases.fish" "$HOME/.config/fish/conf.d/aliases.fish"

echo "==> Linking hypr config..."
ln -sfn "$DOTFILES/hypr/config/hypr" "$HOME/.config/hypr"

echo "==> Linking .local/share/applications..."
ln -sfn "$DOTFILES/local/share/applications" "$HOME/.local/share/applications"

echo "==> Linking .local/bin/..."
ln -sfn "$DOTFILES/local/bin" "$HOME/.local/bin"

echo "==> Linking noctalia shell settings..."
ln -sfn "$DOTFILES/noctalia-shell/config/noctalia/settings.json" "$HOME/.config/noctalia"
ln -sfn "$DOTFILES/noctalia-shell/config/noctalia/user-templates.toml" "$HOME/.config/noctalia"

echo "==> Linking chromium and obsidian flags..."
ln -sfn "$DOTFILES/chromium/config/chromium-flags.conf" "$HOME/.config/"
ln -sfn "$DOTFILES/obsidian/config/user-flags.conf" "$HOME/.config/obsidian/"
sudo mkdir -p /etc/chromium/policies/managed
sudo chown -R "$USER" /etc/chromium/policies/managed

echo "==> Done!"
