#!/bin/bash
echo "Install tmux"
sudo apt install -y tmux
echo "Install tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Install .tmux"
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp ~/.iamlazy-_-/tmux/.tmux.conf.local .


