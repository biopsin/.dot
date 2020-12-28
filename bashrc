# .bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable partial path completion features
source "$HOME/.config/bash-completion/partial-path"

# quick help
function qh() (
    function qh1 () {
      out="$(help "$1" 2>&1 )"
      [ $? -ne 0 ] && return 1
      echo "$out"
    }

    type -all "$1" ; { qh1 "$1" || "$1" --help 2>/dev/null || man "$1" 2>/dev/null ;} | egrep -i -- "$2"
)

# list zombies
defunct() {
    echo "Children:"
    ps -ef | head -n1
    ps -ef | grep defunct
    echo "------------------------------"
    echo "Parents:"
    ppids="$(ps -ef | grep defunct | awk '{ print $3 }')"
    echo "$ppids" | while read ppid; do
        ps -A | grep "$ppid"
    done
}

# extract file
extract() {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)	tar xjvf $1 ;;
        *.tar.gz)	tar xzvf $1 ;;
        *.tar.xz)	tar xJvf $1 ;;
        *.tbz2)	tar xjvf $1 ;;
        *.tgz)	tar xzvf $1 ;;
        *.tar)	tar xfv $1 ;;
        *.rar)	7z x $1 ;;
        *.zip)	7z $1 ;;
        *.gz)	gzip $1 ;;
        *.lz)		lzip $1 ;;
        *.xz)	7z x $1 ;;
        *.7z)	7z x $1 ;;
        *)	echo "'$1' cannot be extracted via extract()" ;;
	esac
     else
	echo "'$1' is not a valid file"
     fi
}

# Enable color and handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color'
    alias ll='ls -lha --color'
    alias lld='ls -ld */ --color'
    alias grep='grep --color'
fi

# General
alias startx='startx -- :0 vt3'
alias xx='exit'
alias ..='cd ..'
alias gh='history | grep -i $1'
alias catn='cat -n'
alias nano="nano -l"
alias df='df -H'
alias du='du -sh'
alias free='free -h && ps -e -orss=,%mem,args= | sort -nr | head'
alias pstree='pstree -l'
alias ping='ping -4 -c 5'
alias xp='xprop | egrep -w "WM_CLASS|WM_NAME|WM_WINDOW_ROLE"'
alias colr="sed 's/^-/\x1b[41m-/;s/^+/\x1b[42m+/;s/^@/\x1b[34m@/;s/$/\x1b[0m/'"
alias top="top -U userx"
alias aria-dl='aria2c --conf-path=$HOME/.config/aria2/aria2c.conf'

# Container
alias c-user='contain -n -u 1000:1000:1 -g 1000:1000:1 /media/workr/void-contain/ /bin/bash'
alias c-root='contain -n /media/workr/void-contain/ /bin/bash'

# xbps
alias xbps-q='/usr/bin/xbps-query -vRs'
alias xbps-lrh='/usr/bin/xbps-query -p repolock -s "" && /usr/bin/xbps-query -p hold -s "" '
alias xbps-u='/usr/bin/doas xbps-install -Su'
alias xbps-i='/usr/bin/doas xbps-install -S'
alias xbps-li='/usr/bin/doas xbps-install -R .'
alias xbps-r='/usr/bin/doas xbps-remove -R'
alias xbps-h='/usr/bin/doas xbps-pkgdb -m hold'
alias xbps-uh='/usr/bin/doas xbps-pkgdb -m unhold'
alias xbps-rl='/usr/bin/doas xbps-pkgdb -m repolock'
alias xbps-rul='/usr/bin/doas xbps-pkgdb -m repounlock'
alias xbps-clean='/usr/bin/doas xbps-remove -Oo'

alias rindex-add='xbps-rindex -a . *.xbps'
alias rindex-clean='xbps-rindex -c .'
alias rindex-remove='xbps-rindex -r .'
alias vkpurge-clean='/usr/bin/doas vkpurge rm all'

# System
alias updb='doas mupdatedb'
alias vcsdump='doas fold /dev/vcs1'
alias dmesg-last='doas dmesg --color | tail -n 100'
alias dmesg-error='doas dmesg | egrep -i --color "error|critical|failed"'
alias rebooot='/usr/bin/doas reboot'

export HISTSIZE=1000
export HISTFILESIZE=${HISTSIZE}
export HISTTIMEFORMAT="%d/%m %t"
export HISTCONTROL="ignoreboth:erasedups"
shopt -s checkwinsize
shopt -s histappend
shopt -s autocd
shopt -s extglob

export LESS_TERMCAP_mb=$'\e[6m'
export LESS_TERMCAP_md=$'\e[32m'
export LESS_TERMCAP_us=$'\e[4;32m'
export LESS_TERMCAP_so=$'\e[30;41m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS='-iR -j4 --shift 5 -P ?n?f%f .?m(file %i of %m) ..?ltlines %lt-%lb?L/%L. :byte %bB?s/%s. .?e(END) ?x- Next\: %x.:?pB%pB\%..%t'

export TERM="st-256color"
export EDITOR="/usr/bin/nano"
export BROWSER="/usr/bin/palemoon"

# Fix del in st
tput smkx

# shell
PS1="\e]0;\W\a\e[0m\n \[$(tput setaf 2)\]\w \$ \[$(tput sgr0)\]"
