#!/bin/bash
RED="\033[1m\e[31m"
BLUE="\033[1m\e[34m"
GREEN="\033[1m\e[32m"
ENDCOLOR="\e[0m\033[0m"
echo -e "${BLUE}Install tmux${END}"
sudo apt install -y tmux
echo -e "${BLUE}Install .tmux${END}"
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp ~/.leorc/tmux/.tmux.conf.local .
echo -e "${BLUE}Finish!{END}"


