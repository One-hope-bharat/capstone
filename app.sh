#!/bin/bash
set -e

PROD_REPO="1hopebharat/capstone_prod"
EC2_HOST="54.218.80.37"
SSH_KEY="/home/ec2-user/keypair/capstone_web_oregon.pem"
SSH_USER="ec2-user"

if [[ -f "version.txt" ]]; then
    VERSION_TAG=$(cat version.txt)
else
    echo "Error: version.txt not found"
    exit 1
fi
ssh -i "$SSH_KEY" "$SSH_USER@$EC2_HOST" "$SSH_COMMAND"

SSH_COMMAND="docker pull $PROD_REPO:$VERSION_TAG && \
             docker stop capstone_container || true && \
             docker rm capstone_container || true && \
             docker run -d --name capstone_container -p 80:80 $PROD_REPO:$VERSION_TAG"




