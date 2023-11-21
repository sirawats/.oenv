#!/bin/bash

# Source the ~/.zshrc file
source ~/.zshrc

# Check if sourcing was successful
if [ $? -eq 0 ]; then
    echo "Sourced ~/.zshrc successfully."
else
    echo "Error: Failed to source ~/.zshrc."
