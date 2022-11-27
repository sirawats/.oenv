#!/bin/bash
RED="\e[1;31m"
BLUE="\e[1;34m"
GREEN="\e[1;32m"
END="\e[0m"

echo "Install zsh + fonts-powerline"
sudo apt install zsh fonts-powerline
echo "Install oh-my-zsh"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "${BLUE} Press ${RED}ctrl+d${BLUE} to exit zsh to continue installtion${END}"

echo "Install powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


read -r -p "${BLUE}Copy zshrc to ~/.zshrc ? [y/N] ${END}" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    curl -o ~/.zshrc -L https://raw.githubusercontent.com/leossok/.leorc/master/zsh/zshrc
fi

echo "Make zsh the default"
chsh -s $(which zsh)

echo "Setup powerlevel10k by start `zsh`"
echo "Finish!"