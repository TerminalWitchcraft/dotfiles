#!/bin/sh

dir='../config'

if [ $1 == "Plug" ]
then
	echo "Creating new vim directory"
	ln -s $dir/vim ~/.vim
	ln -s $dir/vimrc ~/.vimrc
	echo "Installing Vim Plug"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	rm ~/.vim/vim
	echo "Installing plugins"
	vim -c PlugInstall -c PlugClean -c q -c q
elif [ $1 == "Vundle"]; then
	#for vundle
	echo "Creating new vim directory"
	ln -s $dir/vim ~/.vim
	ln -s $dir/vimrc ~/.vimrc
	echo "Installing Vim Vundle"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo "Installing Plugins"
else
	#for panthogen
	echo "Creating new vim directory"
	ln -s $dir/vim ~/.vim
	ln -s $dir/vimrc ~/.vimrc
	echo "Installing Vim Panthogen"
	mkdir -p ~/.vim/autoload ~/.vim/bundle && \
		curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	echo "Installing Plugins"
fi

echo "Creating vim swap, undo and backup directories"
mkdir -p ~/.vim/undo_files
mkdir -p ~/.vim/backup_files
mkdir -p ~/.vim/swap_files
echo " Done..."
