#!/bin/bash

# dotfiles directory
dir=~/dotfiles

 # list of files/folders to symlink in homedir
files="vim gemrc gitconfig gitignore_global vimrc tmux.conf zshrc"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# download base-16 colors
wget https://raw.githubusercontent.com/chriskempson/base16-shell/master/base16-ocean.dark.sh -O ~/.base16-ocean.dark.sh

# download vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
sudo chsh -s $(which zsh) vagrant
source zshrc

# create custom zsh themes dir
mkdir $ZSH_CUSTOM/themes

# download zsh lambda theme
wget https://raw.githubusercontent.com/halfo/lambda-mod-zsh-theme/master/lambda-mod.zsh-theme -O $ZSH_CUSTOM/themes/lambda-mod.zsh-theme

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

# install vundle plugins
vim +PluginInstall +qall
