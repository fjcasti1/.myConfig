#!/usr/bin/env bash
#
# Installs configuration files to User's home directory
# ----------------------------------------------------------------------

for file in {bashrc,bash_profile,bash_prompt,aliases,functions,inputrc,vimrc,gitconfig,exports}; do
  [ -f ~/.$file -o -L ~/.$file ] && rm ~/.$file;
  ln -sfn ~/.myConfig/dotfiles/.$file ~/.$file;
done;
unset file;

# Remove .vim directory
rm -rf ~/.vim
# Clone the Bundle Manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Link .vim directory
ln -s ~/.myConfig/.vim/templates ~/.vim/templates
# Install Plugins
vim ~/.myConfig/installingVim.txt -c 'PluginInstall!' -c 'qa!'
