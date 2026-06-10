#!/bin/bash

set -euo pipefail

DOTFILES="$HOME/dotfiles"

confirm() {
  local prompt="$1"
  local default="${2:-y}"
  local hint answer
  if [[ "${default,,}" == "y" ]]; then
    hint="[Y/n] (default Y)"
  else
    hint="[y/N] (dafault N)"
  fi
  read -rp "$prompt $hint " answer
  answer="${answer:-$default}"
  [[ "${answer,,}" =~ ^y(es)?$ ]]
}

backup_if_real() {
  if [[ -e "$1" && ! -L "$1" ]]; then
    mv -v "$1" "$1.bak.$(date +%s)"
  fi
}

if confirm "Intall packages?" n; then
  echo "==> Installing packages..."
  if [ -f "$DOTFILES/packages.txt" ]; then
    grep -v '^#' "$DOTFILES/packages.txt" | grep -v '^$' | awk '{print $1}' | paru -S --needed -
    # grep -vE '^\s*(#|$)' "$DOTFILES/packages.txt" | paru -S --needed -
  else
    echo "  warn: packages.txt not found, skipping"
  fi
fi

if confirm "Configure git user?" n; then
  echo "==> Configuring git user..."

  current_name=$(git config --global --default "" user.name)
  current_email=$(git config --global --default "" user.email)

  if [ -n "$current_name" ]; then
    echo "  current name: $current_name"
    read -rp "  new name (leave empty to keep): " new_name
  else
    read -rp "  git user.name: " new_name
  fi
  if [ -n "$new_name" ]; then
    git config --global user.name "$new_name"
  fi

  if [ -n "$current_email" ]; then
    echo "  current email: $current_email"
    read -rp "  new email (leave empty to keep): " new_email
  else
    read -rp "  git user.email: " new_email
  fi
  if [ -n "$new_email" ]; then
    git config --global user.email "$new_email"
  fi
fi

if confirm "Link nvim conf with LazyVim?" n; then
  echo "==> Linking nvim conf..."
  backup_if_real "$HOME/.config/nvim"
  ln -sfn "$DOTFILES/nvim/config/nvim" "$HOME/.config/nvim"
  echo "==> Restoring nvim plugins from lazy-lock.json..."
  nvim --headless "+qa" 2>/dev/null || true
  nvim --headless "+Lazy! restore" "+qa"
fi

if confirm "Link alacritty conf?" n; then
  echo "==> Linking alacritty conf..."
  backup_if_real "$HOME/.config/alacritty"
  ln -sfn "$DOTFILES/alacritty/config/alacritty" "$HOME/.config/alacritty"
fi

if confirm "Link sddm autologin conf?" n; then
  echo "==> Linking sddm autologin config..."
  sudo mkdir -p "/etc/sddm.conf.d"
  sudo ln -sfn "$DOTFILES/sddm/autologin.conf" "/etc/sddm.conf.d/autologin.conf"
fi

if confirm "Link fish config?" n; then
  echo "==> Linking fish config..."
  mkdir -p "$HOME/.config/fish/conf.d"
  mkdir -p "$HOME/.config/systemd/user"
  ln -sfn "$DOTFILES/config/systemd/user/ssh-agent.service" "$HOME/.config/systemd/user/ssh-agent.service"
  ln -sfn "$DOTFILES/fish/config/fish/conf.d/aliases.fish" "$HOME/.config/fish/conf.d/aliases.fish"
  ln -sfn "$DOTFILES/fish/config/fish/conf.d/starship.fish" "$HOME/.config/fish/conf.d/starship.fish"
  backup_if_real "$HOME/.config/starship.toml"
  ln -sfn "$DOTFILES/fish/config/starship.toml" "$HOME/.config/starship.toml"

  systemctl --user daemon-reload
  systemctl --user enable --now ssh-agent
fi

if confirm "Link hypr config?" n; then
  echo "==> Linking hypr config..."
  ln -sfn "$DOTFILES/hypr/config/hypr" "$HOME/.config/hypr"
fi

if confirm "Link .local/share/applications?" n; then
  echo "==> Linking .local/share/applications..."
  mkdir -p "$HOME/.local/share"
  ln -sfn "$DOTFILES/local/share/applications" "$HOME/.local/share/applications"
fi

if confirm "Link .local/bin?" n; then
  echo "==> Linking .local/bin/..."
  ln -sfn "$DOTFILES/local/bin" "$HOME/.local/bin"
fi

if confirm "Link noctalia-shell settings?" n; then
  mkdir -p "$HOME/.config/noctalia"
  echo "==> Linking noctalia shell settings..."
  ln -sfn "$DOTFILES/noctalia-shell/config/noctalia/settings.json" "$HOME/.config/noctalia/settings.json"
  ln -sfn "$DOTFILES/noctalia-shell/config/noctalia/user-templates.toml" "$HOME/.config/noctalia/user-templates.toml"
fi

if confirm "Link chromium and obsidian flags?" n; then
  mkdir -p "$HOME/.config/obsidian"
  echo "==> Linking chromium and obsidian flags..."
  ln -sfn "$DOTFILES/chromium/config/chromium-flags.conf" "$HOME/.config/chromium-flags.conf"
  ln -sfn "$DOTFILES/obsidian/config/user-flags.conf" "$HOME/.config/obsidian/user-flags.conf"
fi

if confirm "Install noctalia chromium theme?" n; then
  echo "==> installing chromium theme..."
  sudo mkdir -p /etc/chromium/policies/managed
  sudo chown -R "$USER" /etc/chromium/policies/managed
  "$DOTFILES"/local/bin/update-chromium-theme
fi

if confirm "Link spotify-launcher.conf (or check hypr wiki and do yourself)?" n; then
  echo "==> Linking spotify-launcher.conf..."
  ln -sfn "$DOTFILES/spotify/config/spotify-launcher.conf" "$HOME/.config/spotify-launcher.conf"
fi

if confirm "Replace cachyos plymouth splash with chocola?" n; then
  echo "==> Replacing plymouth splash..."
  sudo plymouth-set-default-theme -R chocola
fi

if confirm "Link mimeapps.list?" n; then
  echo "==> Linking mimeapps.list..."
  sudo ln -sfn "$DOTFILES/config/mimeapps.list" "$HOME/.config/mimeapps.list"
fi

if confirm "Link uwsm/env?" n; then
  echo "==> Linking uwsm/env..."
  sudo ln -sfn "$DOTFILES/config/uwsm/env" "$HOME/.config/uwsm/env"
fi

if confirm "Ling font config?" n; then
  echo "==> Linking font config..."
  sudo mkdir -p ~/.config/fontconfig
  sudo ln -sfn "$DOTFILES/config/fontconfig/fonts.conf" "$HOME/.config/fontconfig/fonts.conf"
fi

# TODO: add qt6ct settings and configs
# Configuration path: "/home/airwar/.config/qt6ct"
# Shared QSS paths: QList("/home/airwar/.local/share/qt6ct/qss", "/usr/local/share/qt6ct/qss", "/usr/share/qt6ct/qss")
# Shared color scheme paths: QList("/home/airwar/.local/share/qt6ct/colors", "/usr/local/share/qt6ct/colors", "/usr/share/qt6ct/colors")

echo "==> Done!"
echo ""
echo "==> [WARNING!] Dont forget to add:"
echo "==> [WARNING!] MODULES=(i915 nvidia nvidia_modeset nvidia_uvm nvidia_drm ...)"
echo "==> [WARNING!] to file /etc/mkinitcpio.conf "
echo "==> [WARNING!] Dont forget to check /etc/modprobe.d/nvidia.conf"
echo "==> [WARNING!] it should has:"
echo "==> [WARNING!] options nvidia_drm modeset=1"
echo "==> [WARNING!] then do 'sudo mkinitcpio -P'"
echo "==> Done!"
