#!/usr/bin/env bash

set -ex

PYVER=$1

sudo apt update
sudo apt install -y git software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
if [ "$PYVER" = "python3.10" ]; then
  sudo apt install -y $PYVER-dev $PYVER-distutils
else
  sudo apt install -y $PYVER
fi

bash test/check-arch.sh
if [ "$PYVER" = "python3.10" ]; then
  wget https://bootstrap.pypa.io/get-pip.py
  $PYVER get-pip.py
  $PYVER -m pip install -U pip setuptools wheel
else
  $PYVER -m pip install -U pip setuptools wheel
fi

pip install tensorflow -f https://tf.kmtea.eu/whl/stable.html

$PYVER test/tf-test.py

mkdir -p /tmp/artifacts/whl
cp -a $(find /root/.cache/pip | grep whl | tr '\n' ' ') /tmp/artifacts/whl/ || echo "No new whl is built!"
