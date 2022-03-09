#!/bin/bash
echo "Install zsh"
sudo apt install zsh
echo "Install oh-my-zsh"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Install fonts-powerline"
sudo apt install fonts-powerline
echo "Make zsh the default"
chsh -s $(which zsh)

echo "Install powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


read -r -p "Copy zshrc to ~/.zshrc ? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
	cp zshrc ~/.zshrc
fi
