#!/bin/bash
RED="\e[1;31m"
BLUE="\e[1;34m"
GREEN="\e[1;32m"
END="\e[0m"

echo -e "${BLUE}Download nvim.appimage${END}"
curl -o ~/nvim.appimage -L https://github.com/neovim/neovim/releases/download/v0.8.0/nvim.appimage
chmod u+x ~/nvim.appimage
sudo ln -s ~/nvim.appimage /bin/nvim
sudo apt-get install fuse libfuse2




read -r -p "${BLUE}Install fm, and nodejs [y/N]${END}" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    curl -fsSL https://fnm.vercel.app/install | bash
    # fnm
    export PATH="/home/leossok/.local/share/fnm:$PATH"
    eval "`fnm env`"
    fnm install 18
    fnm use 18
fi


echo -e "${BLUE}Install python3-pip${END}"
sudo apt install python3-pip

echo -e "${BLUE}Install LunarVim${END}"
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
chmod +x ~/.local/bin/lvim
sudo cp ~/.local/bin/lvim /bin/lvim

echo -e "${BLUE}Copy config${END}"
curl -o ~/.config/lvim/config.lua -L https://raw.githubusercontent.com/leossok/.leorc/master/lvim/config.lua
lvim +PackerSync