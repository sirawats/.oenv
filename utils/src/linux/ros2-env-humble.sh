#!/bin/bash

if [ $# -eq 0 ] || [ "$1" == "exec" ]; then
  bash ~/.oenv/docker-dev-env/ros2/humble/exec.sh
elif [ "$1" == "build" ]; then
  bash ~/.oenv/docker-dev-env/ros2/humble/build.sh
elif [ "$1" == "run" ]; then
  bash ~/.oenv/docker-dev-env/ros2/humble/run.sh
else echo "Command not found, please use 'build', 'run', 'exec'"
fi
