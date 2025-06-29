PROMPT='mac@%1~ %# '

#vim mode
#set -o vi
#set show-mode-in-prompt on
#set vi-cmd-mode-string "\1\e[2 q\2"
#set vi-ins-mode-string "\1\e[6 q\2"
#
#function zle-keymap-select {
#    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
#	    echo -ne '\e[1 q'
#    elif [[ ${KEYMAP} == main ]] || [[ ${KEYAMP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
#	    echo -ne '\e[5 q'
#    fi
#}
#
#zle -N zle-keymap-select

#자동완성
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# bindkey '^f' autosuggest-accept
bindkey '^_' autosuggest-accept

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$HOME/.local/bin:$PATH"

#alias
#alias ls='lsd --no-symlink'
# alias ls='exa --git --icons --color=always --group-directories-first'
#alias ll='ls -alhF'
alias ct='cargo nextest run --workspace --status-level fail'
alias cy='cargo clippy --workspace --all-targets --all-features -- -D warnings'
alias cr='cargo run'
alias call='ct && cy'
# alias ll='exa --git --icons --color=always --group-directories-first -alhF'
alias ls='lsd'
# alias ll='lsd -a -l -g'
alias ll='lsd -A -l'
alias lt='lsd --tree'

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by Windsurf
export PATH="/Users/jo/.codeium/windsurf/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

