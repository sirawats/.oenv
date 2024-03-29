#!/bin/bash

# Function to display help message
display_help() {
    echo "Usage: $0 [help]"
    echo "  - [help]: Display this help message."
    echo "  This script removes git merged local branchs in current directory"
    echo "  Thanks to https://stackoverflow.com/questions/13064613/how-to-prune-local-tracking-branches-that-do-not-exist-on-remote-anymore"
}

# Check if the number of arguments is correct
if [ "$#" -eq 1 ] && [ "$1" == "help" ]; then
    display_help
elif [ "$#" -gt 1 ]; then
    echo "Error: Invalid number of arguments."
    display_help
else
    # Remove unused Docker images
    echo "Removing merged local branchs"
    bash -c "git fetch -p ; git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d"
fi
