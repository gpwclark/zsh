#!/bin/bash

#install vim/git
yay -Syu  && yay --noconfirm -S \
         vim `#text editor` \
        emacs `#ONLY for clj/cljs development` \
        git `#scm` \
        gradle `#build tool` \
        maven  `#build tool` \
        sl `#get on the train.` \
        wget `# simple http get` \
        slim `# login manager` \
        i3-wm `#window manager` \
        rofi `# dmenu replacement` \
        i3blocks `#i3 status bar` \
        xscreensaver `#screensaver` \
        wxcam `#webcam` \
        baobab `#visualize disk space` \
        arandr `# manage screens` \
        ifplugd `#handle connecting to wired interfaces` \
        xorg-xev `#check key combinations` \
        fail2ban `# keep out the bad guys` \
        xorg-server `# should work in conjunction with slim and i3wm seamlessly` \
        konsole `# preferred shell` \
        firefox `#browser` \
        chromium `# browsers` \
        youtube-dl `#need a screensaver :)` \
        tmux `#terminal multiplexer` \
        mplayer `# all things media` \
        leiningen `# clojure build tool` \
        feh `#light weight previewer` \
        pulseaudio `# sound` \
        ponymix `# pulse sound cli  frontend` \
        openvpn `# vpn` \
        tree `# to visualize directory trees` \
        xclip `# access paste bugger on cli` \
        xorg-xbacklight `# backlight cli frontend used by i3blocks` \
        acpi `# used for getting battery charge in i3blocks` \
        xdotool `# for i3blocks` \
        xorg-xprop `# for i3blocks` \
        light-git `# brightness ctrl for gitj` \
        eclim `# for vim java` \
        gnome-calculator `#for calculations`
        graphviz `# graph visualization/generations software` \
        strace `# important for tracing system calls in linux`\
        rlwrap `# important for wrapping cli programs`\
        thunar `# windowed file browser` \
        ranger `# cli file browser` \
        burpsuite `# proxy to intercept things.` \
        simplescreenrecorder `# screen recorder` \
        pavucontrol `# for volume control` \
        fzf `# ctrl-r on crack` \
        scrot `# simple screenshot utility for X` \
        lsd `# better ls` \
        ipcalc `# subnet calcuclator` \
        aspell `# check spelling on the CLI` \
        aspell-en `# spelling dictionary for english`\
        git-crypt `#  Transparent file encryption in Git`\
        kindd `#  easy to use bootable usb drive creator` \
        smartmontools `# hdd troubleshotting utilities` \
        xcape `#  configure modifier keys to act as other keys when pressed and released on their own` \
        xorg-xmodmap `#  remap keybindings, uses a ~/.xmodmap file` \
        lsdesktopf `# list available desktop files or search their contents` \
        fbrokendesktop `# deteces broken Exex values in broken desktop files.` \
        syncthing `# to sync things across computers.`

