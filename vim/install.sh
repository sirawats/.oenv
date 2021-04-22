#!/bin/bash
read -r -p "Copy vimrc to ~/.vimrc ? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	cp vimrc ~/.vimrc
fi

read -r -p "Use VundleInstall ? [y/N]" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	vim +VundleInstall +qall
fi

read -r -p "Install YouCompleteMe ? [y/N]" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	cd ~/.vim/bundle/YouCompleteMe
	python3 install.py --all
fi

