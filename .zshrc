PROMPT='mac@%1~ %# '
#자동완성
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$HOME/.local/bin:$PATH"

#alias
#alias ls='lsd --no-symlink'
alias ls='exa --git --icons --color=always --group-directories-first'
alias ll='ls -alhF'

eval "$(starship init zsh)"
