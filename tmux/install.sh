#!/bin/bash
RED="\e[1;31m"
BLUE="\e[1;34m"
GREEN="\e[1;32m"
END="\e[0m"

echo -e "${BLUE}Install tmux${END}"
sudo apt install -y tmux
echo -e "${BLUE}Install .tmux${END}"
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
curl -o ~/.tmux.conf.local -L https://raw.githubusercontent.com/leossok/.leorc/master/tmux/.tmux.conf.local
echo -e "${BLUE}Finish!{END}"


