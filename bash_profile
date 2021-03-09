# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

export HISTSIZE=1000
export HISTFILESIZE=${HISTSIZE}
export HISTTIMEFORMAT="%d/%m %t"
export HISTCONTROL="ignoreboth:erasedups"
export HISTFILE=$HOME/.cache/shell_history

export LESS_TERMCAP_mb=$'\e[0m'
export LESS_TERMCAP_md=$'\e[1;40m'
export LESS_TERMCAP_us=$'\e[0;32m'
export LESS_TERMCAP_so=$'\e[0;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS='-iR -j4 --shift 5 -P ?n?f%f .?m(file %i of %m) ..?ltlines %lt-%lb?L/%L. :byte %bB?s/%s. .?e(END) ?x- Next\: %x.:?pB%pB\%..%t'

export TERM=st-256color
export TERMINAL=/usr/bin/st
export PAGER=/usr/bin/less
export EDITOR=/usr/bin/nano
export BROWSER=/usr/bin/palemoon

 # autologin on tty1
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	while true; do
		echo 'Press any key to exit, or wait 3 seconds'
		if read -r -N 1 -t 3; then
			break
		else
			startx
		fi
	done
fi
