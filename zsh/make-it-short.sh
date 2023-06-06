#!/bin/bash
alias @rosdep="rosdep install --from-path src --ignore-src -y -r"
alias @colcon="colcon build --packages-select $1"
alias @ws="source install/setup.zsh"
alias @zshrc="source ~/.zshrc"
alias @colcon="colcon build --packages-select $1"

## Docker

@docker_rmi_none () {
  bash -c 'docker rmi $(docker images -a --filter 'dangling=true' -q --no-trunc) -f'
}


## Python
alias @py-clean="find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete"
alias @py-addpath="export PYTHONPATH=\$PYTHONPATH:\$PWD"
alias @py-activate="source venv/bin/activate"
alias @py-deactivate="deactivate"

function @env-humble() {
  if [ $# -eq 0 ] || [ "$1" == "exec" ]; then
    bash ~/.oh-dev-tools/docker-dev-env/ros2/humble/exec.sh
  elif [ "$1" == "build" ]; then
    bash ~/.oh-dev-tools/docker-dev-env/ros2/humble/build.sh
  elif [ "$1" == "run" ]; then
    bash ~/.oh-dev-tools/docker-dev-env/ros2/humble/run.sh
  else echo "Command not found, please use 'build', 'run', 'exec'"
  fi
}
