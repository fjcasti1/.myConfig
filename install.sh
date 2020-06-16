#!/usr/bin/env bash
#
# Installs configuration files to User's home directory
# ----------------------------------------------------------------------

for file in {bashrc,bash_profile,bash_prompt,aliases,functions}; do
	[ -f "~/.$file" ] && rm "~/.$file";
  ln -sfn ~/.myConfig/dotfiles/.$file ~/.$file;
done;
unset file;

# BELOW HERE NEEDS TO BE UPDATED

#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#cp ~/.myConfig/dotfiles/.vimrc ~/
#cp -r ~/.myConfig/vim/templates ~/.vim/
#vim ~/.myConfig/installingVim.txt -c 'PluginInstall!' -c 'qa!'
