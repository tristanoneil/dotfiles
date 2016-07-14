#!/bin/bash

# dotfiles directory
dir=~/dotfiles

 # list of files/folders to symlink in homedir
files="vim gemrc gitconfig gitignore_global vimrc tmux.conf config"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# download vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

# install fisherman
curl -Lo config/fish/functions/fisher.fish --create-dirs git.io/fisherman
fish config/fish/functions/fisher.fish

# install fish plugins
fisher up

# install vundle plugins
vim +PluginInstall +qall
