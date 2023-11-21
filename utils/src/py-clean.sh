#!/bin/bash


# Function to display help message
display_help() {
    echo "Usage: $0"
    echo "    Recursively remove all python cache e.g. '__pycache__' in current directory"
}


# Check if the number of arguments is correct
if [ "$#" -gt 0 ]; then
    echo "Error: Invalid number of arguments."
    display_help
else
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
fi


