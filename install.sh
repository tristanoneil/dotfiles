#!/bin/bash

# mv .config directory if there already is one
mv ~/.config ~/.config-bak

# dotfiles directory
dir=~/dotfiles

 # list of files/folders to symlink in homedir
files="vim gitconfig gitignore_global vimrc config gemrc rspec tmux"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

# setup profile
tic xterm-256color-italic.terminfo

# install vundle plugins
vim +PlugInstall +qall
