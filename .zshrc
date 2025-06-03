# Auto-install Zinit if not present
if [ ! -f "${HOME}/.local/share/zinit/zinit.git/zinit.zsh" ]; then
  echo "Installing Zinit plugin manager..."
  sh -c "$(curl -fsSL https://git.io/zinit-install)"
fi

# Load Zinit from new path
source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"


# Fast completions
zinit light zsh-users/zsh-completions

# Autosuggestions
zinit light zsh-users/zsh-autosuggestions

# Syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/gord/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
# Source env file if it exists
. "$HOME/.local/bin/env"

### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
alias k='kubectl'


if command -v direnv > /dev/null ; then
  eval "$(direnv hook zsh)"
fi

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
