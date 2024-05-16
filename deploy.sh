#!/bin/bash

set -e

# Define Docker Hub repository URLs
PROD_REPO="1hopebharat/capstone_prod"
DEV_REPO="1hopebharat/capstone_dev"

# Retrieve the version tag from the file created by build.sh
if [[ -f "version.txt" ]]; then
    VERSION_TAG=$(cat version.txt)
else
    echo "Error: version.txt not found"
    exit 1
fi


# Tag the Docker image with repository URL and version tag
docker tag image_capstone:$VERSION_TAG $REPO_URL:$VERSION_TAG

# Authenticate Docker Hub login (ensure Docker Hub credentials are set as secrets)
if [[ -z "$DOCKERHUB_CREDENTIALS_USR" || -z "$DOCKERHUB_CREDENTIALS_PSW" ]]; then
    echo "Error: Docker Hub credentials are not provided"
    exit 1
fi

echo "$DOCKERHUB_CREDENTIALS_PSW" | docker login -u "$DOCKERHUB_CREDENTIALS_USR" --password-stdin

# Push the tagged Docker image to the Docker Hub repository
docker push $REPO_URL:$VERSION_TAG

