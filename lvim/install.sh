#!/bin/bash
RED="\e[1;31m"
BLUE="\e[1;34m"
GREEN="\e[1;32m"
END="\e[0m"


echo -e "${BLUE}Install dependencies${END}"
echo -e "${BLUE}-- python3-pip, wget, curl, unzip${END}"
sudo apt install python3-pip wget curl unzip

echo -e "${BLUE}Download nvim.appimage${END}"
# curl -o ~/nvim.appimage -L https://github.com/neovim/neovim/releases/download/v0.8.0/nvim.appimage
wget https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.tar.gz
sudo tar -xzf nvim-linux64.tar.gz -C /usr/




read -r -p "${BLUE}Install fm, and nodejs [y/N]${END}" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    curl -fsSL https://fnm.vercel.app/install | bash
    # fnm
    export PATH="${PWD}/.local/share/fnm:$PATH"
    eval "`fnm env`"
    fnm install 18
    fnm use 18
fi


echo -e "${BLUE}Install LunarVim${END}"
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
chmod +x ~/.local/bin/lvim
sudo cp ~/.local/bin/lvim /bin/lvim

echo -e "${BLUE}Copy config${END}"
curl -o ~/.config/lvim/config.lua -L https://raw.githubusercontent.com/leossok/.leorc/master/lvim/config.lua
lvim +PackerSync
