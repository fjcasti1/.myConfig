#!/usr/bin/env bash
#
# Installs configuration files to User's home directory
# ----------------------------------------------------------------------

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/.myconfig/dotfiles/.vimrc ~/
cp -r ~/.myconfig/vim/templates ~/.vim/
vim ~/.myconfig/installingVim.txt -c 'PluginInstall!' -c 'qa!'
