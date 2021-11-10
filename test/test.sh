#!/usr/bin/env bash

set -ex

PYVER=$1

sudo apt update

if [ "$PYVER" = "python3.10" ]; then
  sudo apt install -y -qq wget
  sudo bash test/install-python.sh 3.10.0
elif [ "$PYVER" = "python3.8"  ]; then
  sudo apt install -y -qq $PYVER-dev
else
  sudo apt install -y -qq software-properties-common
  sudo add-apt-repository -y ppa:deadsnakes/ppa
  sudo apt install -y -qq $PYVER-dev
fi

sudo apt install -y -qq pkg-config libhdf5-103 libhdf5-dev  # h5py

bash test/check-arch.sh

PKGS="tensorflow"

$PYVER -m pip install -Uq pip setuptools wheel
$PYVER -m pip install cffi dataclasses future numpy pillow pyyaml requests six typing_extensions tqdm -f https://ext.kmtea.eu/whl/stable.html

if [ "$PYVER" = "python3.10" ]; then
  H5PY_SETUP_REQUIRES=0 $PYVER -m pip install h5py --no-deps --no-build-isolation
fi

$PYVER -m pip install -U $PKGS -f https://tf.kmtea.eu/whl/stable.html -f https://ext.kmtea.eu/whl/stable.html

$PYVER test/tf-test.py

mkdir -p /tmp/artifacts/whl
cp -a $(find /root/.cache/pip | grep whl | tr '\n' ' ') /tmp/artifacts/whl/ || echo "No new whl is built!"
