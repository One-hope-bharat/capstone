#!/bin/bash

set -e

# SSH into EC2 instance and run Docker commands
ssh -i /home/ec2-user/keypair/capstone_web_oregon.pem  ec2-user@54.218.80.37 << EOF
docker pull 1hopebharat/capstone_prod:$VERSION_TAG
docker run -d -p 80:80 1hopebharat/capstone_prod:$VERSION_TAG
EOF

