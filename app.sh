#!/bin/bash
set -e
PROD_REPO="1hopebharat/capstone_prod"
if [[ -f "version.txt" ]]; then
    VERSION_TAG=$(cat version.txt)
else
    echo "Error: version.txt not found"
    exit 1
fi
sh 'echo "$DOCKERHUB_CREDENTIALS_PSW" | docker login -u "$DOCKERHUB_CREDENTIALS_USR" --password-stdin'
docker pull $PROD_REPO:$VERSION_TAG
docker stop capstone_container || true && docker rm capstone_container || true
docker run -itd --name capstone_container -p 80:80 $PROD_REPO:$VERSION_TAG
