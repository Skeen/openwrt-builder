#!/bin/bash

OUTPUT_FOLDER=.
REPOSITORY=skeen/openwrt-builder
TAG=latest
BUILD=$REPOSITORY:$TAG
CONTAINER_NAME=$(date | md5sum | sed "s/\(.*\)\s.*/\1/g" | tr -d ' ')
OPENWRT_BUILD_DIR=$CONTAINER_NAME:/home/openwrt/bin/

docker run --name $CONTAINER_NAME -it $BUILD
docker cp $OPENWRT_BUILD_DIR $OUTPUT_FOLDER
