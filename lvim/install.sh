#!/bin/bash
RED="\e[1;31m"
BLUE="\e[1;34m"
GREEN="\e[1;32m"
END="\e[0m"

echo -e "${BLUE}Download nvim.appimage${END}"
curl -o ~/nvim.appimage -L https://github.com/neovim/neovim/releases/download/v0.8.0/nvim.appimage
chmod u+x ~/nvim.appimage
sudo ln -s ~/nvim.appimage /bin/nvim

echo -e "${BLUE}Install nvm and nodejs${END}"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install 16
nvm use 16

echo -e "${BLUE}Install python3-pip${END}"
sudo apt install python3-pip

echo -e "${BLUE}Install LunarVim${END}"
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
chmod +x ~/.local/bin/lvim
sudo cp ~/.local/bin/lvim /bin/lvim

echo -e "${BLUE}Copy config${END}"
curl -o ~/.config/lvim/config.lua -L https://raw.githubusercontent.com/leossok/.leorc/master/lvim/config.lua
lvim +PackerSync




