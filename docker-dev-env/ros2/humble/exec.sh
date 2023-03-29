#!/bin/bash

# Set the container name
CONTAINER_NAME="env-ros2-humble"

# Execute the Zsh shell in the container
docker exec -it ${CONTAINER_NAME} /bin/zsh
