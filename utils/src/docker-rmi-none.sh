#!/bin/bash

# Function to display help message
display_help() {
    echo "Usage: $0 [help]"
    echo "  - [help]: Display this help message."
    echo "  This script removes unused Docker images with the command:"
    echo "    docker rmi \$(docker images -a --filter 'dangling=true' -q --no-trunc) -f"
}

# Check if the number of arguments is correct
if [ "$#" -eq 1 ] && [ "$1" == "help" ]; then
    display_help
elif [ "$#" -gt 1 ]; then
    echo "Error: Invalid number of arguments."
    display_help
else
    # Remove unused Docker images
    echo "Removing unused Docker images."
    bash -c 'docker rmi $(docker images -a --filter "dangling=true" -q --no-trunc) -f'
fi
