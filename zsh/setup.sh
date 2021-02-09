#!/bin/bash
echo "Install zsh"
sudo apt install zsh
echo "Install oh-my-zsh"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Install fonts-powerline"
sudo apt install fonts-powerline
echo "Make zsh the default"
chsh -s $(which zsh)
