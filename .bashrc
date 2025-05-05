# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

feh --bg-scale /home/price/gentoo-tenyearscompiling.jpg

# Put your fun stuff here.
. "$HOME/.cargo/env"

export PATH="${PATH}:${HOME}/bin"

## $> xrandr --listproviders
## Providers: number : 2
## Provider 0: id: 0x45 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs: 5 outputs: 2 associated providers: 1 name:Intel
## Provider 1: id: 0x242 cap: 0x2, Sink Output crtcs: 4 outputs: 5 associated providers: 1 name:NVIDIA-G0

alias ll="ls -lathr"
alias tmuxls="tmux list-sessions"
# [graphics hell](https://wiki.gentoo.org/wiki/Hybrid_graphics)
#price@brumal ~ $ sudo  nvidia-xconfig --prime
#
#WARNING: Unable to locate/open X configuration file.
#
#X Configuration file set up for PRIME. Please run "xrandr --setprovideroutputsource modesetting NVIDIA-0" and "xrandr --auto" to enable. See the README for more details.
#Option "AllowEmptyInitialConfiguration" "True" added to Screen "Screen0".
#New X configuration file written to '/etc/X11/xorg.conf'
#
#
# which graphics cards/drivers are being used?
#
# # $ glxinfo | grep -E "OpenGL vendor|OpenGL renderer"
#
#
# Just type nvidia-smi in the terminal. Then check for the percentage of usage.
# That will indicate which GPU is in us
xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
#xrandr --setprovideroffloadsink  1 0
#~/.screenlayout/i3_apt205_sitting_desk.sh  || ~/.screenlayout/i3_apt205_right_only_sitting_desk.sh || ~/.screenlayout/i3_apt205_small_standing_desk.sh  || ~/.screenlayout/i3_apt205_standing_desk.sh  || ~/.screenlayout/i3_blackweave_lenovo.sh
#
export BROWSER="/usr/bin/firefox"
export PATH=$HOME/.local/bin:$PATH

# let's just make sure we don't decide to go to sleep unless I say so!
xset s off && xset -dpms

# pnpm
export PNPM_HOME="/home/price/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
