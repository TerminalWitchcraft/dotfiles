#!/bin/bash

# This script creates symbolic links from the home directory to any dotfiles in ~/dotfiles

dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc vimrc vim inputrc tmux.conf tmuxline.tmux.conf shell_prompt.sh"

# Create dotfiles_old in homedir
echo "Creating $olddir for backup of existng dotfiles"
mkdir -p $olddir
echo "...done"

# Changing to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# Move any existing dotfiles to the dotfiles_old directory
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
	echo "Moving $file"
	mv ~/.$file ~/dotfiles_old
done

# Create symlinks to home directory
for file in $files; do
	echo "Creating symlinks to $file in home directory"
	ln -s $dir/$file ~/.$file
done
