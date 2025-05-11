#!/bin/bash
set -eux

# Ensure you're in the dotfiles repo root
cd "$HOME/.dotfiles"

# Run GNU stow to symlink everything
stow --target="$HOME" .
