# .oenv
my personal setup notes

_______________________

## Tmux
1. https://github.com/gpakosz/.tmux
2. [tmux cheatsheet](https://tmuxcheatsheet.com/)

**One script:**
```
bash <(curl -s https://raw.githubusercontent.com/leossok/.oenv/master/tmux/install.sh)
```
_______________________

## Zsh + oh-my-zsh
```
bash <(curl -s https://raw.githubusercontent.com/leossok/.oenv/master/zsh/install.sh)
```

_______________________

## Kitty Terminal
**website:** https://sw.kovidgoyal.net/kitty/binary/
```
bash <(curl -s https://raw.githubusercontent.com/leossok/.oenv/master/zsh/install.sh)
```

_______________________

## LunarVim  (IDE)

**One script:**
```
bash <(curl -s https://raw.githubusercontent.com/leossok/.oenv/master/lvim/install.sh)
```

#### Manual Step
##### 1. Install neovim (> v9.0)
**(Option A.)** [Ubuntu] Appimage
```
curl -o ~/nvim.appimage -L https://github.com/neovim/neovim/releases/download/v0.9.0/nvim.appimage
chmod u+x ~/nvim.appimage
sudo ln -s ~/nvim.appimage /bin/nvim
```
**(Option B.)** [Ubuntu] Extract tar
```
wget https://github.com/neovim/neovim/releases/download/v0.9.0/nvim-linux64.tar.gz
sudo tar -xzvf nvim-linux64.tar.gz -C /opt/
sudo ln -s /opt/nvim-linux64/bin/nvim /bin/nvim
```
**(Option C.)** [MacOS] Brew
```
brew install neovim
```

##### 2. Install fnm and nodejs
```
curl -fsSL https://fnm.vercel.app/install | bash
# fnm
export PATH="/home/leossok/.local/share/fnm:$PATH"
eval "`fnm env`"
fnm install 18
fnm use 18
```

##### 3. Install pip
```
sudo apt install python3-pip
```

##### 4. Install LunarVim
```
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```

##### 5. Copy config
```
curl -o ~/.config/lvim/config.lua -L https://raw.githubusercontent.com/leossok/.oenv/master/lvim/config.lua
lvim +Lazy

chmod +x ~/.local/bin/lvim
sudo cp ~/.local/bin/lvim /bin/lvim
```
_______________________

## Other Stuff

### Setup powerlevel10k for oh-my-zsh
1. https://github.com/romkatv/powerlevel10k/blob/master/README.md#oh-my-zsh

### Awesome GNOME-extension
1. [sound-output-device-chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/) 
2. [dash-to-dock](https://extensions.gnome.org/extension/307/dash-to-dock/) 

## Configure hotkey for dash-to-dock
```
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-5 "['<Super>z']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-6 "['<Super>x']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-7 "['<Super>c']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-8 "['<Super>v']"
```
### Use keyboard layout Mac-Style
https://github.com/rbreaves/kinto#how-to-install-linux

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
cp ~/.oenv/skhd/skhdrc ~/.skhdrc
```
## 2. yabai : tilling window manager (similar to Amethyst/Magnet)
**github:** https://github.com/koekeishiya/yabai
### Install
```
brew install koekeishiya/formulae/yabai
brew services start yabai
```
## 3. Make press and hold a key to repeat in VSCODE
[ref](https://stackoverflow.com/questions/39972335/how-do-i-press-and-hold-a-key-and-have-it-repeat-in-vscode) 
`defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false`

