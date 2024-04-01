#!/bin/bash

# Function to display help message
display_help() {
    echo "Usage: $0 <password-length>"
    echo "  - <password-length>: Number of characters in the password."
    echo "  - help : To display this help message: $0 help"
}

# Check if the first argument is 'help'
if [ "$1" == "help" ]; then
    display_help
fi

# Check if the number of arguments is correct
if [ "$#" -ne 1 ]; then
    echo "Error: Invalid number of arguments."
    display_help
else
    echo $(tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | head -c $1)
fi

