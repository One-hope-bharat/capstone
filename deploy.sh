#!/bin/bash

set -e

PROD_REPO="1hopebharat/capstone_prod"
DEV_REPO="1hopebharat/capstone_dev"

if [[ -f "version.txt" ]]; then
    VERSION_TAG=$(cat version.txt)
else
    echo "Error: version.txt not found"
    exit 1
fi

REPO_URL=$DEV_REPO

docker tag image_capstone:$VERSION_TAG $DEV_REPO:$VERSION_TAG

if [[ -z "$DOCKERHUB_CREDENTIALS_USR" || -z "$DOCKERHUB_CREDENTIALS_PSW" ]]; then
    echo "Error: Docker Hub credentials are not provided"
    exit 1
fi
echo "$DOCKERHUB_CREDENTIALS_PSW" | docker login -u "$DOCKERHUB_CREDENTIALS_USR" --password-stdin
docker push $DEV_REPO:$VERSION_TAG

