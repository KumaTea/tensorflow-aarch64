#!/usr/bin/env bash

set -ex

# pip install tensorflow-cpu -f https://tf.kmtea.eu/whl/stable.html
# done in travis.yml

python3 test/tf-test.py
