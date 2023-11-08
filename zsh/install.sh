#!/bin/bash
RED=$'\e[1;31m'
BLUE=$'\e[1;34m'
GREEN=$'\e[1;32m'
END=$'\e[0m'


read -r -p "${BLUE}Install dependencies (git, zsh, fonts-powerline) [y/N]${END}"
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
  sudo apt update
  sudo apt install -y zsh fonts-powerline git
fi

read -r -p "${BLUE}Install oh-my-zsh [y/N]${END}"
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
  echo -e "${BLUE}After installed, press ${RED}ctrl+d${BLUE} to exit zsh to continue installation${END}"
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

read -r -p "${BLUE}Install powerlevel10k [y/N]${END}"
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

read -r -p "${BLUE}Copy .zshrc from my preference to this machine? [y/N]${END}"
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
  curl -o ~/.zshrc -L https://raw.githubusercontent.com/o-sirawat/.oenv/master/zsh/.zshrc
fi

read -r -p "${BLUE}Make zsh to be default shell? [y/N]${END}"
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
  chsh -s "$(which zsh)"
fi

echo -e "${BLUE}Finished!, login again to zsh w:w
${END}"
