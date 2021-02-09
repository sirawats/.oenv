#!/bin/bash
cp vimrc ~/.vimrc
vim +VundleInstall +qall
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
