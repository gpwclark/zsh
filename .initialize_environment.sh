#!/bin/bash

#install vim/git
<<<<<<< HEAD
pacman --noconfirm -S \
        vim \
        #text editor
        emacs \
        #ONLYL for clj/cljs development
        git \
        # scm
        gradle \
        sl \
        #if you can't type correctly, get on the train.
        wget \
        slim \
        # login manager
        i3-wm \
        #window manager
        xscreensaver \
        #screensaver
        wxcam \
        #webcam
        baobab \
        #visualize disk space
        arandr \
        # manage screens
        rofi \
        # dmenu replacement
        ifplugd \
        #handle connecting to wired interfaces
        xev \
        #chewck key combinations
        fail2ban \
        # keep out the bad guys
        xorg-server \
        # should work in conjunction with slim and i3wm seamlessly
        konsole \
        # preferred shell
        firefox \
        chromium \
        # browsers


#devvim set up
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

#java repl
git clone https://github.com/albertlatacz/java-repl ~/bin/java-repl.repo
cd ~/bin/java-repl.repo && gradle shadowJar

#closh
NODE_PATH=~/bin/node_modules npm install lumo-cljs closh

#need to figure out what to do about this sudo business
sudo systemctl enable netctl-ifplugd@interface.service

#screensaver
mkdir ~/Media
wget gpwclark.net/danger5/tvguide.mkv
systemctl --user enable xscreeensaver
