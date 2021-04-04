# tensorflow-aarch64

[![Coverage][5]][3] [![manlinux][6]][3] 

[TensorFlow][1] wheels (whl) and docker images
for `aarch64` / ARMv8 / ARM64

[GitHub][7] | [Web][8]

## Install

**`pip install tensorflow -f https://tf.maku.ml/whl/stable.html`**

Backup link: `pip install torch -f https://cf.tf.maku.ml/whl/stable.html`

If you want prebuilt wheels of dependencies, such as `grpcio` and `h5py`,
please add [ext-whl][2] as another index:

`pip install tensorflow -f https://tf.maku.ml/whl/stable.html -f https://ext.maku.ml/whl/stable.html`

To pick the `whl` files manually, please check the **[releases][3]**.

## [Docker][4]

**`docker run -it kumatea/tensorflow`**

To pull the image, run `docker pull kumatea/tensorflow`.

To check all available tags, [click here][4].

---

## Build

Please check the [tutorial](build).

---

## More Info

### Building Environment

> Host: Raspberry Pi 4 Model B
> 
> SoC: BCM2711 (quad-core A53)
> 
> Architecture: ARMv8 / ARM64 / `aarch64`
> 
> OS: Debian Stretch
> 
> GCC: v6.3.0
> 
> Virtualization: **Docker**

### Official CI wheels

There are official wheels for Python 3.6 and 3.7,
you could fetch them [here][9].

[1]: https://github.com/tensorflow/tensorflow
[2]: https://github.com/KumaTea/ext-whl
[3]: https://github.com/KumaTea/tensorflow-aarch64/releases
[4]: https://hub.docker.com/r/kumatea/tensorflow
[5]: https://shields.io/badge/python-3.6%20%7C%203.7%20%7C%203.8%20%7C%203.9-blue
[6]: https://shields.io/badge/manylinux-manylinux__2__24-blue
[7]: https://github.com/KumaTea/tensorflow-aarch64
[8]: https://cf.tf.maku.ml
[9]: https://snapshots.linaro.org/ldcg/python/tensorflow/12/tensorflow_cpu/
