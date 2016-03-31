#!/bin/bash

# dotfiles directory
dir=~/dotfiles

 # list of files/folders to symlink in homedir
files="vim gemrc gitconfig gitignore_global vimrc bash_profile inputrc"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

wget https://raw.githubusercontent.com/chriskempson/base16-shell/master/base16-ocean.dark.sh -O ~/.base16-ocean.dark.sh
wget https://raw.githubusercontent.com/mrzool/bash-sensible/master/sensible.bash -O ~/.sensible.bash

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done
