#!/bin/bash

# TODO port to aurutils

sudo pacman -Syu  && sudo pacman --noconfirm -S --needed \
vim `#text editor` \
nano `#simpler text editor` \
emacs `#ONLY for clj/cljs development` \
git `#scm` \
gradle `#build tool` \
maven  `#build tool` \
sl `#get on the train.` \
wget `# simple http get` \
i3-wm `#window manager` \
rofi `# dmenu replacement` \
i3blocks `#i3 status bar` \
xscreensaver `#screensaver` \
baobab `#visualize disk space` \
arandr `# manage screens` \
ifplugd `#handle connecting to wired interfaces` \
xorg-xev `#check key combinations` \
xorg-server `# should work in conjunction with xorg-xinit and i3wm seamlessly` \
xorg-xbacklight `# backlight cli frontend used by i3blocks` \
xorg-xprop `# for i3blocks` \
xorg-xmodmap `#  remap keybindings, uses a ~/.xmodmap file` \
xorg-xinit `# has startx  in it...` \
fail2ban `# keep out the bad guys` \
konsole `# preferred shell` \
firefox `#browser` \
chromium `# browsers` \
youtube-dl `#need a screensaver :)` \
tmux `#terminal multiplexer` \
mplayer `# all things media` \
leiningen `# clojure build tool` \
feh `#light weight previewer` \
pulseaudio `# sound` \
openvpn `# vpn` \
tree `# to visualize directory trees` \
xclip `# access paste bugger on cli` \
acpi `# used for getting battery charge in i3blocks` \
xdotool `# for i3blocks` \
gnome-calculator `#for calculations` \
graphviz `# graph visualization/generations software` \
strace `# important for tracing system calls in linux`\
rlwrap `# important for wrapping cli programs`\
thunar `# windowed file browser` \
ranger `# cli file browser` \
simplescreenrecorder `# screen recorder` \
pavucontrol `# for volume control` \
fzf `# ctrl-r on crack` \
scrot `# simple screenshot utility for X` \
lsd `# better ls` \
ipcalc `# subnet calcuclator` \
aspell `# check spelling on the CLI` \
aspell-en `# spelling dictionary for english`\
git-crypt `#  Transparent file encryption in Git`\
smartmontools `# hdd troubleshotting utilities` \
xcape `#  configure modifier keys to act as other keys when pressed and released on their own` \
syncthing `# to sync things across computers.`


aur sync \
ponymix-git `# pulse sound cli  frontend` \
light-git `# brightness ctrl for gitj` \
burpsuite `# proxy to intercept things.` \
kindd `#  easy to use bootable usb drive creator` \
lsdesktopf `# list available desktop files or search their contents` \
fbrokendesktop `# manages multiple repositories.` \
inxi-git `# sane entrypoint for providing hardware info.` \
myrepos `# deteces broken Exec values in broken desktop files.` \
customizepkg-scripting `# tool to help maintain custom changed to installed packages.`

sudo pacman -Syu  && sudo pacman --noconfirm -S --needed \
ponymix-git `# pulse sound cli  frontend` \
light-git `# brightness ctrl for gitj` \
burpsuite `# proxy to intercept things.` \
kindd `#  easy to use bootable usb drive creator` \
lsdesktopf `# list available desktop files or search their contents` \
fbrokendesktop `# manages multiple repositories.` \
inxi-git `# sane entrypoint for providing hardware info.` \
myrepos `# deteces broken Exec values in broken desktop files.` \
customizepkg-scripting `# tool to help maintain custom changed to installed packages.`

# full list:
##############
# android-ndk                 brother-hl4150cdn       dict-moby-thesaurus    heimdall-git        jre10-openjdk           linux-wifi-hotspot    obsidian-appimage   python2-gobject2  ruby-build     syncthingtray
# android-sdk                 criu                    dict-wn                helix-git           jre10-openjdk-headless  lsdesktopf            pcmciautils         python2-pydot     ruby-ronn      udpreplay-git
# android-sdk-build-tools     customizepkg-scripting  discord_arch_electron  heroku-cli-nightly  kawa                    myrepos               perl-shell-command  python-gdbgui     runki-git      vcsh
# android-sdk-platform-tools  c++utilities            fbrokendesktop         inxi-git            kindd                   ncurses5-compat-libs  perl-test-most      qtutilities       slack-desktop  vifm-git
# aurutils                    dbeaver                 glxinfo                jdk10-openjdk       leiningen-completions   ntpdate               pritunl-client-gtk  quicklisp         sl-sh          vim
# boot                        dict-freedict-eng-spa   google-chrome          jetbrains-toolbox   linux-router            nvm-git               pygtk               rbenv             snapd          zoom
