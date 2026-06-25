alias k='kubectl'
alias claude="npx @anthropic-ai/claude-code"

# add scripts
export PATH="$HOME/dotfiles/scripts:$PATH"


# OS Specific Section
case "$OSTYPE" in
  darwin*)
    # macOS-specific commands
    export PATH="/opt/homebrew/bin:$PATH"
    ;;
  linux*)
    # Linux-specific commands
    if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi
    ;;
esac

export MANPAGER="sh -c 'col -bx | nvim -R'"

if command -v direnv > /dev/null ; then
  eval "$(direnv hook zsh)"
fi

# History
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions

# VI mode
bindkey -v # enable vi mode in ZSH

# Using bindkey -v may take over functionality such as 
# history search with control+R and control+S. 
# To restore that particular behavior, 
# add the following lines after bindkey -v:
bindkey ^R history-incremental-search-backward 
bindkey ^S history-incremental-search-forward

_cache_init() {
  local cache="$HOME/.cache/zsh-${1}-init.zsh"
  if [[ ! -f "$cache" || "$(command -v $1)" -nt "$cache" ]]; then
    "$1" init zsh > "$cache"
  fi
  source "$cache"
}
_cache_init starship
_cache_init zoxide

PS1=$'\n\n\n\n\n\n\n\n\e[8A'"$PS1"
 

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/gord/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Created by `pipx` on 2025-11-22 20:59:30
export PATH="$PATH:/Users/gord/.local/bin"
export PATH="$HOME/.pyenv/bin:$PATH"
pyenv() {
  unset -f pyenv
  eval "$(command pyenv init -)"
  pyenv "$@"
}

conda() {
  unset -f conda
  local __conda_setup
  __conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  elif [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
    . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
  else
    export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
  fi
  conda "$@"
}
