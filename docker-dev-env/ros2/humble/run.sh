#!/bin/bash

# Set variables
CONTAINER_NAME="env-ros2-humble"
IMAGE_NAME="leossok/dev-env"
IMAGE_TAG="ros2-humble"

# Expand user home directory to an absolute path
SSH_PATH=$(realpath ~/.ssh)
PROJ_PATH=$(realpath ~/proj)

# Run the Docker container
docker run -d --name ${CONTAINER_NAME} \
  -v "${SSH_PATH}:/root/.ssh" \
  -v "${PROJ_PATH}:/root/proj" \
  ${IMAGE_NAME}:${IMAGE_TAG} \
  tail -f /dev/null
