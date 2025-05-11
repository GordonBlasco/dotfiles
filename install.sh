#!/bin/bash
set -eux

# Get the directory of the script no matter where it's called from
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Stow from the dotfiles directory into $HOME
cd "$DOTFILES_DIR"

# Run GNU stow to symlink everything
stow --target="$HOME" .
