#!/bin/sh
#git clone https://hgleagle@github.com/hgleagle/VimConfig.git ~/.vim
cd ~/.vim
git submodule init
git submodule update
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/tmux.conf ~/.tmux.conf
rm ~/.bashrc
ln -s ~/.vim/bashrc ~/.bashrc
ln -s ~/.vim/quiltrc ~/.quiltrc
ln -s ~/.vim/gitconfig ~/.gitconfig
