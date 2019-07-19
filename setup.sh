#!/bin/bash

# Install dependencies
sudo apt-get install git
sudo apt-get install tmux
sudo apt-get install vim-gnome
curl -sL https://raw.githubusercontent.com/egalpin/apt-vim/master/install.sh | sh
apt-vim install -y https://github.com/scrooloose/nerdtree.git

# Get latest repo version
if [ -z "$(ls -A dotfiles)" ]; then
    rm -rf dotfiles
    git clone https://github.com/danalex97/dotfiles
else
    pushd dotfiles > /dev/null
    git pull
    popd > /dev/null
fi

# Copy files
cp -r dotfiles/.bashrc .bashrc
cp -r dotfiles/.tmux.conf .tmux.conf
cp -r dotfiles/.vimrc .vimrc
cp -r dotfiles/.tmux.projects .tmux.projects
