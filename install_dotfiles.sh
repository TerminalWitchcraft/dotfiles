#!/bin/bash

# This script creates symbolic links from the home directory to any dotfiles in ~/dotfiles

dir=$PWD
olddir=~/dotfiles_old
files="bashrc vimrc zshrc inputrc tmux.conf tmuxline.tmux.conf shell_prompt.sh"

# Create dotfiles_old in homedir
echo "Creating $olddir for backup of existing dotfiles"
mkdir -p $olddir
echo "...done"

# Changing to the dotfiles directory
# echo "Changing to the $dir directory"
# cd $dir
# echo "...done"

# Move any existing dotfiles to the dotfiles_old directory
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
	echo "Moving $file"
	mv ~/.$file ~/dotfiles_old
done

echo "Creating new vim directory"
# mkdir ~/.vim
ln -s $dir/config/vim ~/.vim
# Installing vim plug

echo "Installing vim plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
rm ~/.vim/vim

# # Create symlinks to home directory
for file in $files; do
	echo "Creating symlinks to $file in home directory"
	ln -s $dir/defaults/$file ~/.$file
done
# 
# 
# # Making vim folders
echo " Creating vim swap, undo and backup directories..."
mkdir -p ~/.vim/undo_files
mkdir -p ~/.vim/backup_files
mkdir -p ~/.vim/swap_files
echo " Done..."
# 
# echo "Installing plugins"
vim -c PlugInstall -c PlugClean -c q -c q
