### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/gord/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
alias k='kubectl'


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