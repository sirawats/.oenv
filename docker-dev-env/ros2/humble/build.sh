#!/bin/bash

# Set variables
IMAGE_NAME="leossok/dev-env"
IMAGE_TAG="ros2-humble"
DOCKERFILE="Dockerfile"

# Build the Docker image
docker build -t ${IMAGE_NAME}:${IMAGE_TAG} -f ${DOCKERFILE} .

# Optionally, you can push the image to Docker Hub
# docker push ${IMAGE_NAME}:${IMAGE_TAG}

