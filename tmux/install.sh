#!/bin/bash
RED=$'\e[1;31m'
BLUE=$'\e[1;34m'
GREEN=$'\e[1;32m'
END=$'\e[0m'


read -r -p "${BLUE}Install tmux [y/N]${END}" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
  sudo apt update
  sudo apt install -y tmux
fi

read -r -p "${BLUE}Install leossok/.tmux [y/N]${END}" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
  cd
  git clone https://github.com/gpakosz/.tmux.git
  ln -s -f .tmux/.tmux.conf
  curl -o ~/.tmux.conf.local -L https://raw.githubusercontent.com/leossok/.oenv/master/tmux/.tmux.conf.local
fi

echo -e "${BLUE}Finish!${END}"
