#!/bin/bash

mkdir -p ~/development
mkdir -p ~/development/sl-sh-dev
mkdir -p ~/bin
mkdir -p ~/core

# install aurutils and automate that piece

which pacman
if [[ $? == "0" ]]; then
	~/.initialize_arch.sh
fi

which apt
if [[ $? == "0" ]]; then
	~/.initialize_debian.sh
fi

sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

# set up shell
git clone git@github.com:sl-sh-dev/sl-sh ~/development/sl-sh-dev/sl-sh
mkdir -p ~/.config/sl-sh/
ln -s ~/development/sl-sh-dev/sl-sh/contrib/gpwclark/slshrc ~/.config/sl-sh/slshrc

#mr set up
git clone git@github.com:gpwclark/vcsh_mr.git ~/core/vcsh_mr
ln -s ~/core/vcsh_mr/.mrconfig ~/.mrconfig
ln -s ~/core/vcsh_mr/.config/mr ~/.config/mr
pushd vcsh_mr && init.sh && popd && mr up

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


#polish off i3 blocks
mkdir -p ~/development/clojure/
git clone https://github.com/gpwclark/deathclock ~/development/clojure/deathclock
