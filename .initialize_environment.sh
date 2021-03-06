#!/bin/bash

mkdir -p ~/development
mkdir -p ~/bin

which pacman
if [[ $? == "0" ]]; then
	~./.initialize_arch.sh	
fi

which apt
if [[ $? == "0" ]]; then
	~./.initialize_debian.sh
fi

# set up shell
git clone git@github.com:sstanfield/slsh

#mr set up
git clone git@github.com:gpwclark/vcsh_mr.git
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
