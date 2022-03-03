#!/bin/bash
alias Mrosdep="rosdep install --from-path src --ignore-src -y -r"
alias Mcolcon="colcon build --packages-select $1"
alias Mws="source install/setup.zsh"
alias Mzshrc="source ~/.zshrc"
alias Mcolcon="colcon build --packages-select $1"

## Docker

Mdocker_rmi_none () {
  bash -c 'docker rmi $(docker images -a --filter 'dangling=true' -q --no-trunc) -f'
}


## Python
alias Mpyclean="find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete"
