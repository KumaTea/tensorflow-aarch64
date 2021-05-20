#!/usr/bin/env bash

set -ex

wget -E -r -k -p "https://tf.kmtea.eu/"
cp -rf tf.kmtea.eu/* .
rm -rf tf.kmtea.eu
