# tensorflow-aarch64

[![Build Status][11]][12] [![Coverage][5]][3] [![manlinux][6]][10] 

[TensorFlow][1] wheels (whl) and docker images
for `aarch64` / ARMv8 / ARM64

[GitHub][7] | [Web][8]

### Note

Custom build on v2.5.0 [always failed][13],
so from now on this project has switched to [linaro's build][9],
which might be more stable.

You can still fetch the archived wheels [here](whl/archive.html).

## Install

**`pip install tensorflow -f https://tf.kmtea.eu/whl/stable.html`**

Backup link: `pip install torch -f https://cf.tf.kmtea.eu/whl/stable.html`

If you want prebuilt wheels of dependencies, such as `grpcio` and `h5py`,
please add [ext-whl][2] as another index:

`pip install tensorflow -f https://tf.kmtea.eu/whl/stable.html -f https://ext.kmtea.eu/whl/stable.html`

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

### `RuntimeError`

If you see `RuntimeError: module compiled against API version 0xe but this version of numpy is 0xd`,
it is because `tensorflow` requires `numpy~=1.19.2` but I built it using `numpy~=1.20.2`.

You may try `pip install -U numpy`.

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

There are official wheels for Python 3.6 - 3.9,
you could fetch them [here][9].

[1]: https://github.com/tensorflow/tensorflow
[2]: https://github.com/KumaTea/ext-whl
[3]: https://github.com/KumaTea/tensorflow-aarch64/releases
[4]: https://hub.docker.com/r/kumatea/tensorflow
[5]: https://shields.io/badge/python-3.6%20%7C%203.7%20%7C%203.8%20%7C%203.9-blue
[6]: https://shields.io/badge/manylinux-2014-blue
[7]: https://github.com/KumaTea/tensorflow-aarch64
[8]: https://cf.tf.kmtea.eu
[9]: https://snapshots.linaro.org/ldcg/python/tensorflow-manylinux/latest/tensorflow_cpu/
[10]: https://github.com/pypa/manylinux#manylinux_2_24-debian-9-based
[11]: https://travis-ci.org/KumaTea/tensorflow-aarch64.svg?branch=main
[12]: https://travis-ci.org/KumaTea/tensorflow-aarch64
[13]: https://github.com/tensorflow/tensorflow/issues/49209
