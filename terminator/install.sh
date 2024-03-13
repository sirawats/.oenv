#!/bin/bash
echo "Run 'sudo apt install terminator' ..."
sudo apt install terminator
echo "Copy terminator to ~/.config "
cp -r terminator ~/.config/.
echo "Install JetBrainsMono NF fonts"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip -p /tmp
unzip /tmp/JetBrainsMono -d ~/.local/share/fonts
