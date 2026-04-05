alias k='kubectl'

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

eval "$(starship init zsh)"

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi

alacritty-center() {
  local cols=${1:-120}
  local lines=${2:-30}
  local screen_w=3440
  local screen_h=1440
  local char_w=10.8
  local line_h=20
  local x=$(echo "($screen_w - $cols * $char_w) / 2" | bc)
  local y=$(echo "($screen_h - $lines * $line_h) / 2" | bc)
  sed -i '' "s/position = .*/position = { x = $x, y = $y }/" ~/.config/alacritty/alacritty.toml
  echo "Set position to x=$x, y=$y"
}


unset __conda_setup
# <<< conda initialize <<<

