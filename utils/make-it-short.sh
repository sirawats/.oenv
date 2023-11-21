#!/bin/bash

# Get the script directory
script_dir="$HOME/.oenv/utils/src"

# Get the current operating system
current_os=$(uname -s | tr '[:upper:]' '[:lower:]')

# Set the directory based on the operating system
if [ "$current_os" == "linux" ]; then
    script_extended_dir="$script_dir/linux"
elif [ "$current_os" == "darwin" ]; then
    script_extended_dir="$script_dir/macos"
else
    echo "Error: Unsupported operating system."
fi

# Function to create aliases for all *.sh files in the script directory
create_aliases() {
    # Create aliases for all *.sh files in the script directory
    for script_file in "$script_dir"/*.sh; do
        if [ -f "$script_file" ]; then
            script_name=$(basename "$script_file" .sh)
            alias "@$script_name"="source $script_file"

        fi
    done

    # Create aliases specially by operating system
    for script_file in "$script_extended_dir"/*.sh; do
        if [ -f "$script_file" ]; then
            script_name=$(basename "$script_file" .sh)
            alias "@$script_name"="source $script_file"
        fi
    done
}

# Create aliases
create_aliases
