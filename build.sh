#!/usr/bin/env bash

set -xe

VER="2.6"
SUBVER="0"

cd docker

cd py39
docker build --pull -t kumatea/tensorflow:$VER.$SUBVER -t kumatea/tensorflow:$VER -t kumatea/tensorflow:latest .
docker build --pull -t kumatea/tensorflow:$VER.$SUBVER-py39 -t kumatea/tensorflow:$VER-py39 -t kumatea/tensorflow:py39 .
cd ..

cd py38
docker build --pull -t kumatea/tensorflow:$VER.$SUBVER-py38 -t kumatea/tensorflow:$VER-py38 -t kumatea/tensorflow:py38 .
cd ..

cd py37
docker build --pull -t kumatea/tensorflow:$VER.$SUBVER-py37 -t kumatea/tensorflow:$VER-py37 -t kumatea/tensorflow:py37 .
cd ..

cd py36
docker build --pull -t kumatea/tensorflow:$VER.$SUBVER-py36 -t kumatea/tensorflow:$VER-py36 -t kumatea/tensorflow:py36 .
cd ..

docker push kumatea/tensorflow:$VER.$SUBVER
docker push kumatea/tensorflow:$VER
docker push kumatea/tensorflow:latest
docker push kumatea/tensorflow:$VER.$SUBVER-py39
docker push kumatea/tensorflow:$VER.$SUBVER-py38
docker push kumatea/tensorflow:$VER.$SUBVER-py37
docker push kumatea/tensorflow:$VER.$SUBVER-py36
docker push kumatea/tensorflow:$VER-py39
docker push kumatea/tensorflow:$VER-py38
docker push kumatea/tensorflow:$VER-py37
docker push kumatea/tensorflow:$VER-py36
docker push kumatea/tensorflow:py39
docker push kumatea/tensorflow:py38
docker push kumatea/tensorflow:py37
docker push kumatea/tensorflow:py36
