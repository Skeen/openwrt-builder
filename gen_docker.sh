#!/bin/bash

DOCKERHUB=https://hub.docker.com/r/
REPOSITORY=skeen/openwrt-builder
TAG=v1
BUILD=$REPOSITORY:$TAG
DOCKERHUB_URL=$DOCKERHUB$REPOSITORY/

docker build --tag="$BUILD" .
docker tag -f $BUILD $REPOSITORY:latest
docker push $BUILD
