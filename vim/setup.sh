#!/bin/bash
echo "Install Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Copy colors/"
cp -r colors ~/.vim/.
echo "Copy UltiSnips/"
cp -r UltiSnips ~/.vim/.
echo "Install YouCompleteMe"
sudo apt install build-essential cmake vim-nox python3-dev
sudo apt install mono-complete golang nodejs default-jdk npm
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
echo "Set git conflicted"
git config --global alias.conflicted '!vim +Conflicted'
echo "Install ctags"
sudo apt install ctags
