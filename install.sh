#!/bin/bash

# dotfiles directory
dir=~/dotfiles

 # list of files/folders to symlink in homedir
files="vim gemrc gitconfig gitignore_global vimrc tmux.conf config"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# download base-16 colors
wget https://raw.githubusercontent.com/chriskempson/base16-shell/master/base16-ocean.dark.sh -O ~/.base16-ocean.dark.sh

# download vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install fisherman
curl -Lo config/fish/functions/fisher.fish --create-dirs git.io/fisherman

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

# install vundle plugins
vim +PluginInstall +qall

# install fish plugins
fisher up
