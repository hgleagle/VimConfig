#!/bin/sh
#git clone https://hgleagle@github.com/hgleagle/VimConfig.git ~/.vim
#chmod +x restore_config.sh
cd ~/.vim
git submodule init
git submodule update
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/tmux.conf ~/.tmux.conf
rm ~/.bashrc
ln -s ~/.vim/bashrc ~/.bashrc
ln -s ~/.vim/quiltrc ~/.quiltrc
ln -s ~/.vim/gitconfig ~/.gitconfig

###vim 
sudo apt-get install vim-addon-manager vim-scripts exuberant-ctags cscope
vim-addons install taglist winmanager minibufexplorer

###develop evironment
sudo apt-get update
sudo apt-get install subversion git-all libncurses5-dev mtd-utils rpm make gcc autoconf patch

###share
sudo apt-get intstall samba
#mount -t cifs -o username=heguilong,password=xxx,nounix,noserverino //192.168.195.79/rgos /root/rgos/src

###oh-my-zsh
sudo apt-get install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


