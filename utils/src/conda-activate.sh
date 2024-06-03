#!/bin/bash

# Function to display help message
display_help() {
    echo "Usage: $0 <environment_path>"
    echo "  - <environment_path>: The path to the Conda environment to activate."
    echo "    If not provided, it will activate '.venv' or 'venv' in the current directory."
}

# Check if the first argument is 'help'
if [ "$1" == "help" ]; then
    display_help
fi

# Check if the number of arguments is correct
if [ "$#" -gt 1 ]; then
    echo "Error: Invalid number of arguments."
    display_help
fi

# If no argument is provided, default to '.venv' or 'venv' in the current directory
if [ "$#" -eq 0 ]; then
    if [ -d ".venv" ]; then
        environment_path="./.venv"
        conda activate "$environment_path"
    elif [ -d "venv" ]; then
        environment_path="./venv"
        conda activate "$environment_path"
    else
        echo "Error: No Conda environment specified, and '.venv' or 'venv' not found in the current directory."
        display_help
    fi
else
    environment_path="$1"
    conda activate "$environment_path"
fi
