#!/bin/bash

set -euo pipefail

DOTFILES="$HOME/dotfiles"

confirm() {
  local prompt="$1"
  local answer
  read -rp "$prompt [Y/n] " answer
  [[ -z "$answer" || "${answer,,}" =~ ^y(es)?$ ]]
}

if confirm "Intall packages?"; then
  echo "==> Installing packages..."
  if [ -f "$DOTFILES/packages.txt" ]; then
    grep -vE '^\s*(#|$)' "$DOTFILES/packages.txt" | paru -S --needed -
  else
    echo "  warn: packages.txt not found, skipping"
  fi
fi

if confirm "Link sddm autologin conf?"; then
  echo "==> Linking sddm autologin config..."
  sudo mkdir -p "/etc/sddm.conf.d"
  sudo ln -sfn "$DOTFILES/sddm/autologin.conf" "/etc/sddm.conf.d/autologin.conf"
fi

if confirm "Link fish config?"; then
  echo "==> Linking fish config..."
  mkdir -p "$HOME/.config/fish/conf.d"
  ln -sfn "$DOTFILES/fish/config/fish/conf.d/aliases.fish" "$HOME/.config/fish/conf.d/aliases.fish"
fi

if confirm "Link hypr config?"; then
  echo "==> Linking hypr config..."
  ln -sfn "$DOTFILES/hypr/config/hypr" "$HOME/.config/hypr"
fi

if confirm "Link .local/share/applications?"; then
  echo "==> Linking .local/share/applications..."
  mkdir -p "$HOME/.local/share"
  ln -sfn "$DOTFILES/local/share/applications" "$HOME/.local/share/applications"
fi

if confirm "Link .local/bin?"; then
  echo "==> Linking .local/bin/..."
  ln -sfn "$DOTFILES/local/bin" "$HOME/.local/bin"
fi

if confirm "Link noctalia-shell settings?"; then
  echo "==> Linking noctalia shell settings..."
  ln -sfn "$DOTFILES/noctalia-shell/config/noctalia/settings.json" "$HOME/.config/noctalia/settings.json"
  ln -sfn "$DOTFILES/noctalia-shell/config/noctalia/user-templates.toml" "$HOME/.config/noctalia/user-templates.toml"
fi

if confirm "Link chromium and obsidian flags?"; then
  echo "==> Linking chromium and obsidian flags..."
  ln -sfn "$DOTFILES/chromium/config/chromium-flags.conf" "$HOME/.config/"
  ln -sfn "$DOTFILES/obsidian/config/user-flags.conf" "$HOME/.config/obsidian/"
fi

if confirm "Install noctalia chromium theme?"; then
  echo "==> installing chromium theme..."
  sudo mkdir -p /etc/chromium/policies/managed
  sudo chown -R "$USER" /etc/chromium/policies/managed
  "$DOTFILES"/local/bin/update-chromium-theme
fi

echo "==> Done!"
