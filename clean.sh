#!/usr/bin/env bash
#
# Installs configuration files to User's home directory
# ----------------------------------------------------------------------

for file in {bashrc,bash_profile,bash_prompt,aliases,functions,inputrc,vimrc,gitconfig,exports}; do
  [ -f ~/.$file -o -L ~/.$file ] && rm ~/.$file;
done;
unset file;

# Remove .vim and .fzf directories
rm -rf ~/.vim
rm -rf ~/.fzf
rm ~/.fzf.bash
