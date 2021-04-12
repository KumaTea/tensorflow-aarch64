#!/usr/bin/env bash

set -xe

cd docker

cd py37
docker build --pull -t kumatea/tensorflow:1.15.5-py37 -t kumatea/tensorflow:1.15-py37 .
docker build --pull -t kumatea/tensorflow:1.15.5 -t kumatea/tensorflow:1.15 .
cd ..

cd py36
docker build --pull -t kumatea/tensorflow:1.15.5-py36 -t kumatea/tensorflow:1.15-py36 .
cd ..

docker push kumatea/tensorflow:1.15
docker push kumatea/tensorflow:1.15.5
docker push kumatea/tensorflow:1.15.5-py37
docker push kumatea/tensorflow:1.15.5-py36
docker push kumatea/tensorflow:1.15-py37
docker push kumatea/tensorflow:1.15-py36
