#!/bin/bash

# Function to display help message
display_help() {
    echo "Usage: $0 <environment_path>"
    echo "    Deactivate Conda environment"
}

conda deactivate
