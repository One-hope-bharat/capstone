#!/bin/bash
set -e

PROD_REPO="1hopebharat/capstone_prod"
EC2_HOST="172.31.23.97"
SSH_KEY="/home/ubuntu/keypair/capstone_web_oregon.pem"
SSH_USER="ec2-user"

if [[ -f "version.txt" ]]; then
    VERSION_TAG=$(cat version.txt)
else
    echo "Error: version.txt not found"
    exit 1
fi
ssh -T "$SSH_KEY" "$SSH_USER@$EC2_HOST" "$SSH_COMMAND"

SSH_COMMAND="docker pull $PROD_REPO:$VERSION_TAG && \
             docker stop capstone_container || true && \
             docker rm capstone_container || true && \
             docker run -d --name capstone_container -p 80:80 $PROD_REPO:$VERSION_TAG"
