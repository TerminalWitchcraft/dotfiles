#!/bin/sh

dir='../config'
echo "Changing current user's default shell"

if [ $1 == "linux" ]then;
	apt-get install zsh
chsh -s $(which zsh) $(whoami)

if [ $2 == "omz" ]
then
	echo "Installing Oh-My-Zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	ln -s $dir/zshrc ~/.zshrc
elif [ $2 == 'prezto' ]
then
	echo "Installing Prezto"
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
	ln -s $dir/zshrc ~/.zshrc
elif [$2 == 'antigen']
then
	echo "Installing Antigen"
	# need to cross check
	curl -L git.io/antigen > ~/.antigen.zsh
	echo "# Added by setup-my-environment" >> ~/.zshrc
	echo "source ~/.antigen.zsh" >> ~/.zshrc
else
	#pass
fi
echo "Done..."
