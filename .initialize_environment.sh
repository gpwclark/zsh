#!/bin/bash

#install vim/git
pacman -Syu  && pacman --ignore -S \
        vim `#text editor` \
        emacs `#ONLYL for clj/cljs development` \
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
        xorg-xev `#chewck key combinations` \
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

#devvim set up
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#java repl
git clone https://github.com/albertlatacz/java-repl ~/bin/java-repl.repo
cd ~/bin/java-repl.repo && gradle shadowJar

#closh
NODE_PATH=~/bin/node_modules npm install lumo-cljs closh

#need to figure out what to do about this sudo business
#sudo systemctl enable netctl-ifplugd@interface.service

#screensaver
mkdir ~/Media
wget gpwclark.net/danger5/tvguide.mkv
systemctl --user enable xscreeensaver

#polish off i3 blocks
mkdir -p ~/development/clojure/
git clone https://github.com/gpwclark/deathclock ~/development/clojure/deathclock
