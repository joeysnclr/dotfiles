# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# set zsh theme
ZSH_THEME="nord"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# PATH
export PATH=$PATH":$HOME/bin" # add ~/bin to path
export PATH=$PATH":$HOME/.local/bin" # add ~/bin to path

# Vim 
bindkey -v # vim in cli
alias e="nvim" # vim -> neovim

# tools
alias lst="exa -a --tree" # tree list
alias cl="clear" # clear
dl () {
    curl $1 --output $2
}

# shortcuts
alias ubs="cd ~/Library/Application\ Support/Übersicht/widgets/" # cd to ubersicht widgets

# git aliases
alias ga="git add"
alias gc="git commit -m"
alias gp="git push origin master"

