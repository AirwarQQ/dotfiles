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
  ln -sfn "$DOTFILES/chromium/config/chromium-flags.conf" "$HOME/.config/chromium-flags.conf"
  ln -sfn "$DOTFILES/obsidian/config/user-flags.conf" "$HOME/.config/obsidian/user-flags.conf"
fi

if confirm "Install noctalia chromium theme?"; then
  echo "==> installing chromium theme..."
  sudo mkdir -p /etc/chromium/policies/managed
  sudo chown -R "$USER" /etc/chromium/policies/managed
  "$DOTFILES"/local/bin/update-chromium-theme
fi

if confirm "Link spotify-launcher.conf (or check hypr wiki and do yourself)?"; then
  echo "==> Linking spotify-launcher.conf..."
  ln -sfn "$DOTFILES/spotify/config/spotify-launcher.conf" "$HOME/.config/spotify-launcher.conf"
fi

if confirm "Replace cachyos plymouth splash with chocola?"; then
  echo "==> Replacing plymouth splash..."
  sudo plymouth-set-default-theme -R themename
fi

echo "==> [WARINING!] Dont forget to add:"
echo "==> [WARINING!] MODULES=(i915 nvidia nvidia_modeset nvidia_uvm nvidia_drm ...)"
echo "==> [WARINING!] to file /etc/mkinitcpio.conf "
echo "==> [WARINING!] Dont forget to check /etc/modprobe.d/nvidia.conf"
echo "==> [WARINING!] it should has:"
echo "==> [WARINING!] options nvidia_drm modeset=1"
echo "==> [WARINING!] then do 'sudo mkinitcpio -P'"
echo ""
echo "==> Done!"
