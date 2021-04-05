#!/usr/bin/env bash

set -e

echo "$DOCKERPASS" | docker login -u "kumatea" --password-stdin

set -xe

PYVER=$1

cd docker
cd "py$PYVER"

if [ "$PYVER" == "39" ]; then
    docker push kumatea/tensorflow:2.4.1
    docker push kumatea/tensorflow:2.4.1-full
    docker push kumatea/tensorflow:latest
fi

docker push "kumatea/tensorflow:2.4.1-py$PYVER"
docker push "kumatea/tensorflow:py$PYVER"
docker push "kumatea/tensorflow:2.4.1-py$PYVER-full"
docker push "kumatea/tensorflow:py$PYVER-full"
