#!/bin/bash

dir='../config'
default_dir='../defaults'
minimal_dir='../minimal'


echo "Changing current user's default shell"

if [ $1 == "linux" ]
then
	sudo apt-get install zsh
	sudo chsh -s $(which zsh) $(whoami)
fi


echo "reached here"
if [ $2 == "omz" ]
then
	echo "Installing Oh-My-Zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	mv ~/.zshrc $dir/zshrc
	ln -s $dir/zshrc ~/.zshrc
elif [ $2 == 'prezto' ]
then
	echo "Installing Prezto"
	git clone --recursive https://github.com/sorin-ionescu/prezto.git $dir/zprezto
	zsh -c "setopt EXTENDED_GLOB"
	zsh -c "for rcfile in $dir/zprezto/runcoms/^README.md(.N); do
		ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
	done"
elif [$2 == 'antigen']
then
	echo "Installing Antigen"
	# need to cross check
	curl -L git.io/antigen > $dir/antigen.zsh
	ln -s $dir/antigen.zsh ~/antigen.zsh
	cp $minimal_dir/zshrc_antigen $dir/zshrc
	ln -s $dir/zshrc ~/.zshrc
else
	#pass
	echo "Nothing"
fi

echo "Done..."
