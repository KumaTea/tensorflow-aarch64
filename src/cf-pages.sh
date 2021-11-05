#!/usr/bin/env bash

set -ex

wget -E -r -k -p --no-check-certificate "https://tf.kmtea.eu/"
cp -rf tf.kmtea.eu/* .
rm -rf tf.kmtea.eu
