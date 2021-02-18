#!/bin/bash
alias Mrosdep="rosdep install --from-path src --ignore-src -y -r"
alias Mcolcon="colcon build --packages-select $1"
