#!/bin/bash

# Function to display help message
display_help() {
    echo "Usage: $0 <url>"
    echo "  - <url>: URL text to decode."
    echo "  - help : To display this help message: $0 help"
}
function urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }



# Check if the first argument is 'help'
if [ "$1" == "help" ]; then
    display_help
fi

# Check if the number of arguments is correct
if [ "$#" -ne 1 ]; then
    echo "Error: Invalid number of arguments."
    display_help
else
  # Decode the URL
  y=$(urldecode $1)
  echo $y
fi


