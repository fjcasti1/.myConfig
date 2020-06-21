#!/usr/bin/env bash
#
# Installs configuration files to User's home directory
# ----------------------------------------------------------------------

for file in {bashrc,bash_profile,bash_prompt,aliases,functions,inputrc,vimrc,gitconfig,exports,extra}; do
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
vim ~/.myConfig/vimInstallNotes.txt -c 'PluginInstall!' -c 'qa!'

# Install fzf
rm -rf ~/.fzf
rm ~/.fzf.bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# Generate .fzf.bash for autocompletion and key-bindings
# Avoids changes in shell files
source ~/.fzf/install << EOF
y
y
n
EOF
# No need to keep .fzf.bash, generated code included in bash_profile
rm ~/.fzf.bash
