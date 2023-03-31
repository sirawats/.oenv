#!/bin/bash
RED="\e[1;31m"
BLUE="\e[1;34m"
GREEN="\e[1;32m"
END="\e[0m"

echo -e "${BLUE}Install zsh + fonts-powerline${END}"
sudo apt update
sudo apt install -y zsh fonts-powerline

echo -e "${BLUE}Install oh-my-zsh${END}"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo -e "${BLUE}Press ${RED}ctrl+d${BLUE} to exit zsh to continue installation${END}"

echo -e "${BLUE}Install powerlevel10k${END}"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

read -r -p "${BLUE}Copy .zshrc to your ~/.zshrc? [y/N] ${END}" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    curl -o ~/.zshrc -L https://raw.githubusercontent.com/leossok/.oh-dev-tools/master/zsh/.zshrc
fi

echo -e "${BLUE}Make zsh the default shell${END}"
chsh -s "$(which zsh)"

echo -e "${BLUE}Setup powerlevel10k by starting ${RED}zsh${END}"
echo "Finish!"

