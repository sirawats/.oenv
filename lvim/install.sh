#!/bin/bash

set -e

RED="\e[1;31m"
BLUE="\e[1;34m"
GREEN="\e[1;32m"
END="\e[0m"

INSTALL_ALL="$1"



function install_dependencies() {
    echo -e "${BLUE}Install dependencies${END}"
    echo -e "${BLUE}-- python3-pip, wget, curl, unzip${END}"
    if [ -x "$(command -v apt)" ]; then
        sudo apt update
        sudo apt install -y python3-pip wget curl unzip
    elif [ -x "$(command -v yum)" ]; then
        sudo yum install -y python3-pip wget curl unzip
    elif [ -x "$(command -v dnf)" ]; then
        sudo dnf install -y python3-pip wget curl unzip
    else
        echo -e "${RED}Package manager not supported. Please install python3-pip, wget, curl, and unzip manually.${END}"
        exit 1
    fi
}

function download_nvim() {
    echo -e "${BLUE}Install neovim v0.8.3 [y/N]${END}"
	if [[ $INSTALL_ALL == "-y" ]]; then
		response="y"
	else
		read response
	fi
	if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
		ARCHITECTURE="$(uname -m)"

		if [ "$ARCHITECTURE" = "x86_64" ]; then
			wget https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.tar.gz
			sudo tar -xzf nvim-linux64.tar.gz -C /tmp/
			sudo cp -r /tmp/nvim-linux64/bin/* /usr/bin/
			sudo cp -r /tmp/nvim-linux64/lib/* /usr/lib/
			sudo cp -r /tmp/nvim-linux64/share/* /usr/share/
			rm nvim-linux64.tar.gz
		elif [ "$ARCHITECTURE" = "aarch64" ]; then

			# Download neovim-0.8.3.tar.gz
			wget -O neovim-0.8.3.tar.gz https://github.com/neovim/neovim/archive/refs/tags/v0.8.3.tar.gz
			tar -xzf neovim-0.8.3.tar.gz
			cd neovim-0.8.3
			sudo apt install -y gettext
			make CMAKE_INSTALL_PREFIX=/usr/local install
			rm ../neovim-0.8.3.tar.gz
		else
			echo -e "${RED}Unsupported CPU architecture. Please download and install Neovim manually.${END}"
			exit 1
		fi
	fi

}

function install_fnm_nodejs() {
    echo -e "${BLUE}Install fnm and nodejs [y/N]${END}"
	if [[ $INSTALL_ALL == "-y" ]]; then
		response="y"
	else
		read response
	fi
	if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
	if ! [ -x "$(command -v fnm)" ]; then
            echo -e "${BLUE}Downloading and installing fnm...${END}"
	   bash <(curl -s https://fnm.vercel.app/install)
        else
            echo -e "${BLUE}fnm is already installed.${END}"
        fi
        echo -e "${BLUE}Installing and using Node.js 18...${END}"
        ~/.local/share/fnm/fnm install 18
        ~/.local/share/fnm/fnm default 18

		if [[ -f "$HOME/.zshrc" ]]; then

			INSTALL_DIR="$HOME/.local/share/fnm"
			CONF_FILE=$HOME/.zshrc
			echo "Installing for ZSH. Appending the following to $CONF_FILE:"
			echo ""
			echo '  # fnm'
			echo '  export PATH="'"$INSTALL_DIR"':$PATH"'
			echo '  eval "`fnm env`"'

			echo '' >>$CONF_FILE
			echo '# fnm' >>$CONF_FILE
			echo 'export PATH="'"$INSTALL_DIR"':$PATH"' >>$CONF_FILE
			echo 'eval "`fnm env`"' >>$CONF_FILE
			PATH="$INSTALL_DIR:$PATH"
			echo PATH=$PATH
		fi

    fi
}

function install_lunarvim() {
    echo -e "${BLUE}Install LunarVim${END}"
	LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh) -y --no-install-dependencies &&
	
    chmod +x ~/.local/bin/lvim
    sudo cp ~/.local/bin/lvim /bin/lvim
}

function copy_config() {
    echo -e "${BLUE}Copy config${END}"
    mkdir -p ~/.config/lvim
    curl -o ~/.config/lvim/config.lua -L https://raw.githubusercontent.com/leossok/.leorc/master/lvim/config.lua

}

install_dependencies
download_nvim
install_fnm_nodejs
install_lunarvim
copy_config &&
echo -e "${GREEN}LunarVim installation complete!${END}"
echo -e "${GREEN}At first time, you need to :PackerSync${END}"
