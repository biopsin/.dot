#!/usr/bin/sh

[ -d /etc/X11/xinit/xinitrc.d ] && \
for f in /etc/X11/xinit/xinitrc.d/*; do [ -x "$f" ] && . "$f"; done && unset f

# Start dbus-daemon
pidof -s dbus-daemon || export $(dbus-launch)

# Dim screen 40% 
/usr/bin/xcalib -co 40 -gc 1.25 /usr/share/xcalib/gamma_1_0.icc

# Set random bg
/usr/local/bin/rngbd &

# Compositor
xcompmgr -cCb

# Enable clipmenu
/usr/local/bin/clipmenud &

# Run userx services
runsvdir -P "$HOME/.local/service" &

# Start wm
exec pekwm --config "$HOME/.config/pekwm/config"
