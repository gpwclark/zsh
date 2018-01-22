#!/bin/bash

#install vim/git
yaourt -S vim \ #text editor
        git \ # scm
        gradle \
        wxcam \ #webcam
        baobab \ #visualize disk space
        arandr \ # manage screens
        rofi # dmenu replacement

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
git clone https://github.com/albertlatacz/java-repl ~/bin/java-repl.repo
cd ~/bin/java-repl.repo && gradle shadowJar

NODE_PATH=~/bin/node_modules npm install lumo-cljs closh
