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
if command -v nvim >/dev/null; then
  nvim --headless "+Lazy! sync" +qa || true
fi

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

exit 0
