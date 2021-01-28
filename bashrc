# .bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# User specific aliases and functions
[ -f $HOME/.config/bash/aliasrc ] && . $HOME/.config/bash/aliasrc
[ -f $HOME/.config/bash/funrc ] && . $HOME/.config/bash/funrc

# User spesific completion features
source $HOME/.config/bash/completion/partial-path

# shell
PS1="\e]0;\W\a\e[0m\n \[$(tput setaf 6)\]\w \$ \[$(tput sgr0)\]"

shopt -s checkwinsize
shopt -s histappend
shopt -s autocd
shopt -s extglob

# Fix del in st
tput smkx
