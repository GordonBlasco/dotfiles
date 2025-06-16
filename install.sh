#!/bin/bash

set -euo pipefail

# Remove existing Neovim config that conflicts with chezmoi external
rm -rf "$HOME/.config/nvim"

# Install chezmoi if not present
if ! command -v chezmoi >/dev/null; then
  echo "Installing chezmoi..."
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin
  export PATH="$HOME/.local/bin:$PATH"
fi

# Install mise if not present
if ! command -v mise >/dev/null; then
  curl https://mise.run | sh
  export PATH="$HOME/.local/bin:$PATH"
fi

# Ensure mise installs tools from .tool-versions
mise install

# Bootstrap Neovim plugins (assumes you’re using LazyVim or similar)
# if command -v nvim >/dev/null; then
#   nvim --headless "+Lazy! sync" +qa || true
# fi

##################################################################################


# --- Detect OS ---
detect_os() {
  unameOut="$(uname -s)"
  case "${unameOut}" in
    Linux*)
      if [ -f /etc/arch-release ]; then
        echo "arch"
      elif [ -f /etc/debian_version ]; then
        echo "ubuntu"
      else
        echo "linux"
      fi
      ;;
    Darwin*) echo "macos" ;;
    *)       echo "unknown" ;;
  esac
}

OS=$(detect_os)
echo "🔍 Detected OS: $OS"

# --- Install Command Wrapper ---
install_pkg() {
  local pkg="$1"
  if command -v "$pkg" >/dev/null; then
    echo "✅ $pkg already installed"
    return
  fi

  echo "📦 Installing $pkg..."

  case "$OS" in
    arch)
      sudo pacman -Sy --noconfirm "$pkg"
      ;;
    ubuntu)
      sudo apt update
      if [ "$pkg" = "alacritty" ]; then
        sudo apt install -y software-properties-common
        sudo add-apt-repository -y ppa:aslatter/ppa
        sudo apt update
      fi
      sudo apt install -y "$pkg"
      ;;
    macos)
      brew install "$pkg"
      ;;
    *)
      echo "❌ Unsupported OS"
      ;;
  esac
}

# --- Package Installs ---
install_pkg tmux
install_pkg nvim
install_pkg alacritty


##################################################################################

# Use HTTPS clone to avoid SSH key issues
chezmoi init https://github.com/gordonblasco/dotfiles.git --apply

# Set default shell to zsh if available
if command -v zsh >/dev/null; then
  sudo chsh -s "$(command -v zsh)" "$USER"
fi

# Set up pure prompt
mkdir -p "$HOME/.zsh"
if [ ! -d "$HOME/.zsh/pure" ]; then
  git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fi



# --- Optional: Set zsh as default shell ---
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "🔁 Setting default shell to zsh..."
  chsh -s "$(which zsh)" "$USER" || echo "⚠️ Could not change shell (maybe need sudo or re-login)"
fi

echo "✅ All tools installed and configured"

exit 0
