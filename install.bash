#!/usr/bin/env bash
#
# Installs configuration files to User's home directory
# ----------------------------------------------------------------------

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/.myConfig/dotfiles/.vimrc ~/
cp -r ~/.myConfig/vim/templates ~/.vim/
vim ~/.myConfig/installingVim.txt -c 'PluginInstall!' -c 'qa!'
