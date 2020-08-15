# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# set zsh theme
ZSH_THEME="nord"
# source oh my
source $ZSH/oh-my-zsh.sh
# PATH
export PATH=$PATH":$HOME/bin" # add ~/bin to path
export PATH=$PATH":$HOME/.local/bin" # add ~/bin to path
# Vi in zsh
bindkey -v # vim in cli
export KEYTIMEOUT=1
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
# FUNCTIONS
dl () {
    curl $1 --output $2
}

# ALIASES
alias lst="exa -a --tree" # tree list
alias cl="clear" # clear
alias v="nvim" # e -> neovim
# git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push origin master"
alias gpl="git pull origin master"




# Syntax highlighting
source ~/.scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh


