#!/bin/bash
echo "Install vim"
sudo apt install vim
echo "Install Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Copy colors/"
cp -r colors ~/.vim/.
echo "Copy UltiSnips/"
cp -r UltiSnips ~/.vim/.
read -r -p "Copy vimrc to ~/.vimrc ? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	cp vimrc ~/.vimrc
fi
read -r -p "Install plugins? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	echo "Install Vundle"
	vim +VundleInstall +qall
	echo "Install YouCompleteMe"
	sudo apt install build-essential cmake vim-nox python3-dev
	cd ~/.vim/bundle/YouCompleteMe
	python3 install.py --all
fi
echo "Set git conflicted"
git config --global alias.conflicted '!vim +Conflicted'
echo "Install ctags"
sudo apt install ctags
