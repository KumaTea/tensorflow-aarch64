#!/usr/bin/env bash

set -xe

cd docker

cd py39
docker build --pull -t kumatea/tensorflow:2.4.1 -t kumatea/tensorflow:2.4.1-py39 -t kumatea/tensorflow:py39 -t kumatea/tensorflow:latest .
cd ..

cd py38
docker build --pull -t kumatea/tensorflow:2.4.1-py38 -t kumatea/tensorflow:py38 .
cd ..

cd py37
docker build --pull -t kumatea/tensorflow:2.4.1-py37 -t kumatea/tensorflow:py37 .
cd ..

cd py36
docker build --pull -t kumatea/tensorflow:2.4.1-py36 -t kumatea/tensorflow:py36 .
cd ..

docker push kumatea/tensorflow:2.4.1
docker push kumatea/tensorflow:latest
docker push kumatea/tensorflow:2.4.1-py39
docker push kumatea/tensorflow:2.4.1-py38
docker push kumatea/tensorflow:2.4.1-py37
docker push kumatea/tensorflow:2.4.1-py36
docker push kumatea/tensorflow:py39
docker push kumatea/tensorflow:py38
docker push kumatea/tensorflow:py37
docker push kumatea/tensorflow:py36
