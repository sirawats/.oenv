#!/bin/bash


# Check if the number of arguments is correct
if [ "$#" -ne 0 ]; then
    echo "This script does not take any arguments."
    display_help
else
    uuidgen
fi

