#!/bin/bash
RED=$'\e[1;31m'
BLUE=$'\e[1;34m'
GREEN=$'\e[1;32m'
END=$'\e[0m'

# ---

function install_dependencies() {
  read -r -p "${BLUE}Install dependencies (python3-pip, wget, curl, unzip) [y/N]${END}" response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
  then
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
  fi
}

function download_nvim() {
  read -r -p "${BLUE}Install neovim v0.9.4 [y/N]${END}" response
	if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
		ARCHITECTURE="$(uname -m)"

		if [ "$ARCHITECTURE" = "x86_64" ]; then
			wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim-linux64.tar.gz
			sudo tar -xzf nvim-linux64.tar.gz -C /tmp/
			sudo cp -r /tmp/nvim-linux64/bin/* /usr/bin/
			sudo cp -r /tmp/nvim-linux64/lib/* /usr/lib/
			sudo cp -r /tmp/nvim-linux64/share/* /usr/share/
			rm nvim-linux64.tar.gz
		elif [ "$ARCHITECTURE" = "aarch64" ]; then
      sudo apt install libtool-bin

			# Download neovim-0.9.0.tar.gz
			wget -O neovim-0.9.4.tar.gz https://github.com/neovim/neovim/archive/refs/tags/v0.9.4.tar.gz
			tar -xzf neovim-0.9.4.tar.gz
			cd neovim-0.9.4
			sudo apt install -y gettext
			make CMAKE_INSTALL_PREFIX=/usr/local install
			rm ../neovim-0.9.4.tar.gz
		else
			echo -e "${RED}Unsupported CPU architecture. Please download and install Neovim manually.${END}"
			exit 1
		fi
	fi

}

function install_fnm_nodejs() {
  read -r -p "${BLUE}Install Fnm and NodeJS [y/N]${END}" response
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

    # Check if .zshrc exists
    if [ -f "$HOME/.zshrc" ]; then
        source "$HOME/.zshrc"
    else
        source "$HOME/.bashrc"
    fi

  fi
}

function install_lunarvim() {
  read -r -p "${BLUE}Install LunarVim v1.3.0 [y/N]${END}" response
	if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
    chmod +x ~/.local/bin/lvim
    sudo cp ~/.local/bin/lvim /bin/lvim
  fi
  echo -e "${BLUE}[Optional] you can install ${GREEN}fd-find, ripgrep${BLUE} by 'apt' instead of rust${END}"
}

function copy_config() {
  read -r -p "${BLUE}Copy my preference config? [y/N]${END}" response
	if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    mkdir -p ~/.config/lvim
    curl -o ~/.config/lvim/config.lua -L https://raw.githubusercontent.com/o-sirawat/.oenv/master/lvim/config.lua
  fi

}

install_dependencies
download_nvim
install_fnm_nodejs
install_lunarvim
copy_config &&
echo -e "${GREEN}LunarVim installation complete!${END}"
