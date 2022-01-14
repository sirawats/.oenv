# .iamlazy-_-

## Setup Tmux
1. https://github.com/tmux-plugins/tpm
2. https://github.com/gpakosz/.tmux
3. [tmux cheatsheet](https://tmuxcheatsheet.com/)

## Setup powerlevel10k for oh-my-zsh
1. https://github.com/romkatv/powerlevel10k/blob/master/README.md#oh-my-zsh

_______________________

## lvim (LunarVim)

### Requirements
#### 1. Install Neovim > v5.0
##### Method A : Appimage
```
curl -o ~/nvim.appimage -L https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage
chmod u+x ~/nvim.appimage
sudo ln -s ~/nvim.appimage /bin/nvim
```
##### Method B : Extract tar
```
wget https://github.com/neovim/neovim/releases/download/v0.5.0/nvim-linux64.tar.gz
sudo tar -xzvf nvim-linux64.tar.gz -C /opt/
sudo ln -s /opt/nvim-linux64/bin/nvim /bin/nvim
```

#### 2. Install LunarVim
repo: https://github.com/LunarVim/LunarVim
**One Command Install**
```
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
```


#### 3. Install nodejs &  npm for LSP
```
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### Install config
```
curl -o ~/.config/lvim/config.lua -L https://raw.githubusercontent.com/leossok/.iamlazy-_-/master/lvim/config.lua
lvim +PackerSync

# share lvim config with `sudo`
sudo ln -s ~/.local/share/lunarvim /root/.local/share/lunarvim  
sudo ln -s ~/.config/lvim  /root/.config/lvim
```
