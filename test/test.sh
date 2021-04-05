#!/usr/bin/env bash

set -ex

# pip install tensorflow -f https://tf.maku.ml/whl/stable.html -f https://ext.maku.ml/wheels.html
pip install -U numpy || :
# ignore tf deps error

python3 test/tf-test.py
