#!/bin/bash
set -e
DEV_REPO="1hopebharat/capstone_dev"
if [[ -f "version.txt" ]]; then
    VERSION_TAG=$(cat version.txt)
else
    echo "Error: version.txt not found"
    exit 1
fi
docker pull $DEV_REPO:$VERSION_TAG
docker stop capstone_container || true && docker rm capstone_container || true
docker run -itd --name capstone_container -p 80:80 $DEV_REPO:$VERSION_TAG
