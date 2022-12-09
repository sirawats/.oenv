# .leorc
my personal setup notes

_______________________

## Tmux
1. https://github.com/gpakosz/.tmux
2. [tmux cheatsheet](https://tmuxcheatsheet.com/)

### Install by script
```
bash <(curl -s https://raw.githubusercontent.com/leossok/.leorc/master/tmux/install.sh)
```
_______________________

## Zsh + oh-my-zsh
### Install by script
bash <(curl -s https://raw.githubusercontent.com/leossok/.leorc/master/zsh/install.sh)

_______________________

## Kitty Terminal
1. https://sw.kovidgoyal.net/kitty/binary/
bash <(curl -s https://raw.githubusercontent.com/leossok/.leorc/master/zsh/install.sh)

_______________________

## LunarVim (lvim)

### Install by script
```
bash <(curl -s https://raw.githubusercontent.com/leossok/.leorc/master/lvim/install.sh)
```

### Manual Install
#### 1. Install Neovim > v5.0
##### Method A : Appimage
```
curl -o ~/nvim.appimage -L https://github.com/neovim/neovim/releases/download/v0.8.0/nvim.appimage
chmod u+x ~/nvim.appimage
sudo ln -s ~/nvim.appimage /bin/nvim
```
##### Method B : Extract tar
```
wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.tar.gz
sudo tar -xzvf nvim-linux64.tar.gz -C /opt/
sudo ln -s /opt/nvim-linux64/bin/nvim /bin/nvim
```



#### 2. Install fnm and nodejs
```
curl -fsSL https://fnm.vercel.app/install | bash
# fnm
export PATH="/home/leossok/.local/share/fnm:$PATH"
eval "`fnm env`"
fnm install 18
fnm use 18
```

#### 3. Install pip
```
sudo apt install python3-pip
```

#### 4. Install LunarVim
repo: https://github.com/LunarVim/LunarVim
**One Command Install**
```
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
```

#### 5. Install config
```
curl -o ~/.config/lvim/config.lua -L https://raw.githubusercontent.com/leossok/.leorc/master/lvim/config.lua
lvim +PackerSync

chmod +x ~/.local/bin/lvim
sudo cp ~/.local/bin/lvim /bin/lvim
```
_______________________

## Alacritty Terminal Emulator
[github](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#debianubuntu) 

_______________________

## Other Stuff

### Setup powerlevel10k for oh-my-zsh
1. https://github.com/romkatv/powerlevel10k/blob/master/README.md#oh-my-zsh

### Awesome GNOME-extension
1. [sound-output-device-chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/) 
2. [dash-to-dock](https://extensions.gnome.org/extension/307/dash-to-dock/) 

_______________________

# MacOS
## 1. skhd : simple hotkey daemon (similar to Karabiner)
**github:** https://github.com/koekeishiya/skhd
### Install
```
git clone https://github.com/koekeishiya/skhd
cd skhd
make install
sudo cp ./bin/skhd /usr/local/bin/skhd
launchctl load ./examples/com.koekeishiya.skhd.plist
launchctl start com.koekeishiya.skhd.plist
```
### Configure
```
cp ~/.leorc/skhd/skhdrc ~/.skhdrc
```
## 1. yabai : tilling window manager (similar to Amethyst/Magnet)
**github:** https://github.com/koekeishiya/yabai
### Install
```
brew install koekeishiya/formulae/yabai
brew services start yabai
```