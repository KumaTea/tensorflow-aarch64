# tensorflow-aarch64

[TensorFlow][1] wheels (whl) and docker images
for `aarch64` / ARMv8 / ARM64

## Install

**`pip install tensorflow -f https://tf.maku.ml/whl/stable.html`**

Backup link: `pip install torch -f https://cf.tf.maku.ml/whl/stable.html`

If you want prebuilt wheels of dependencies, such as `grpcio` and `h5py`,
please add [ext-whl][2] as another index:

`pip install tensorflow -f https://tf.maku.ml/whl/stable.html -f https://ext.maku.ml/whl/stable.html`


[1]: https://github.com/tensorflow/tensorflow
[2]: https://github.com/KumaTea/ext-whl
