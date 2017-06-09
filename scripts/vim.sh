#!/bin/sh

dir='../config'
default_dir='../defaults'
minimal_dir='../minimal'

if [ $1 == "Plug" ]
then
	echo "Creating new vim directory"
	if [ $2 == "defaults" ]
	then
		cp $default_dir/vimrc $dir
		cp -rf $default_dir/vim $dir
	elif [ $2 == "minimal" ]
	then
		cp $minimal_dir/vimrc_plug $dir
		mv $dir/vimrc_plug $dir/vimrc
		cp -rf $minimal_dir/vim $dir
	else
		# nothing
		echo "Nothing"
	fi
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
	if [ $2 == "defaults" ]
	then
		cp $default_dir/vimrc $dir
		cp -rf $default_dir/vim $dir
	elif [ $2 == "minimal" ]
	then
		cp $minimal_dir/vimrc_vundle $dir
		mv $dir/vimrc_vundle $dir/vimrc
		cp -rf $minimal_dir/vim $dir
	else
		# nothing
		echo "nothing"
	fi
	ln -s $dir/vim ~/.vim
	ln -s $dir/vimrc ~/.vimrc
	echo "Installing Vim Vundle"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo "Installing Plugins"
else
	#for panthogen
	if [ $2 == "defaults" ]
	then
		cp $default_dir/vimrc $dir
		cp -rf $default_dir/vim $dir
	elif [ $2 == "minimal" ]
	then
		cp $minimal_dir/vimrc_panthogen $dir
		mv $dir/vimrc_panthogen $dir/vimrc
		cp -rf $minimal_dir/vim $dir
	else
		echo "Nothing"
	fi
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
