#!/bin/bash

mkdir -p ~/development
mkdir -p ~/bin

#install vim/git
pacman -Syu  && pacman --ignore -S \
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
        aspell-en `# spelling dictionary for english`

#devvim set up
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#better terminal
git clone https://git.suckless.org/st ~/st
pushd ~/st && sudo make clean install && popd

#leosetup
git clone git@github.com:leo-editor/leo-editor.git  ~/leo-editor

#java repl
git clone https://github.com/albertlatacz/java-repl ~/bin/java-repl.repo
pushd ~/bin/java-repl.repo && gradle shadowJar && popd

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

# oh my zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
