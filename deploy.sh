#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
IMAGE_NAME="my-python-app"
IMAGE_TAG="latest"
REGISTRY_URL="siddhesh7677"  # Replace with your Docker registry URL if needed

# Build the Docker image (optional, if not already built)
echo "Building Docker image..."
docker build -t $IMAGE_NAME:$IMAGE_TAG .

# Tag and push the Docker image to a registry (optional, if using a registry)
echo "Tagging and pushing Docker image..."
docker tag $IMAGE_NAME:$IMAGE_TAG $REGISTRY_URL/$IMAGE_NAME:$IMAGE_TAG
docker push $REGISTRY_URL/$IMAGE_NAME:$IMAGE_TAG

# Pull the Docker image on the deployment server
echo "Pulling Docker image on the deployment server..."
docker pull $REGISTRY_URL/$IMAGE_NAME:$IMAGE_TAG

# Stop and remove existing container if it exists
echo "Stopping and removing existing container if any..."
docker stop $IMAGE_NAME || true && docker rm $IMAGE_NAME || true

# Run the new container
echo "Running new Docker container..."
docker run -d --name $IMAGE_NAME -p 5000:5000 $REGISTRY_URL/$IMAGE_NAME:$IMAGE_TAG

echo "Deployment complete!"
