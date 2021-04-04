#!/usr/bin/env bash

set -ex

wget -E -r -k -p "https://tf.maku.ml/"
cp -rf tf.maku.ml/* .
rm -rf tf.maku.ml
