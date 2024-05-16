#!/bin/bash

VERSION_TAG=$(date +'%Y%m%d%H%M%S')

docker build -t image_capstone:$VERSION_TAG .

echo $VERSION_TAG > version.txt
