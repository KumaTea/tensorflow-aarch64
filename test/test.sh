#!/usr/bin/env bash

set -ex

pip install tensorflow -f https://tf.maku.ml/whl/stable.html -f https://ext.maku.ml/wheels.html

python3 test/tf-test.py
