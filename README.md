# tensorflow-aarch64

[![Build Status][11]][12] [![ver][15]][3]
[![Coverage][5]][3]

[TensorFlow][1] wheels (whl) and docker images
for `aarch64` / ARMv8 / ARM64

[GitHub][7] | [Web][8] | [Torch][14]

## Install

**`pip install tensorflow -f https://tf.kmtea.eu/whl/stable.html`**

To use linaro's build,
replace `tensorflow` with `tensorflow-aarch64` for newer versions (v2.6.0 and later),
and `tensorflow-cpu` for older versions.

Backup link: `pip install tensorflow -f https://cf.tf.kmtea.eu/whl/stable.html`

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

### Note on v2.5.0

Custom build on v2.5.0 [always failed][13],
so this version has switched to [linaro's build][9],
which might be more stable.

You can still fetch the archived wheels [here](whl/archive.html).

### `RuntimeError` (v2.4)

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
> OS: CentOS 7
> 
> GCC: v8.3.0
> 
> Virtualization: **Docker**

### Linaro's wheels

There are official wheels for Python 3.6 - 3.9,
you could fetch them [here][9].

[1]: https://github.com/tensorflow/tensorflow
[2]: https://github.com/KumaTea/ext-whl
[3]: https://github.com/KumaTea/tensorflow-aarch64/releases
[4]: https://hub.docker.com/r/kumatea/tensorflow
[5]: https://shields.io/badge/python-3.6%20%7C%203.7%20%7C%203.8%20%7C%203.9%20%7C%203.10-blue
[6]: https://shields.io/badge/manylinux-2014-blue
[7]: https://github.com/KumaTea/tensorflow-aarch64
[8]: https://tf.kmtea.eu
[9]: https://snapshots.linaro.org/ldcg/python/tensorflow-manylinux/latest/tensorflow-aarch64/
[10]: https://github.com/pypa/manylinux#manylinux2014-centos-7-based
[11]: https://circleci.com/gh/KumaTea/tensorflow-aarch64.svg?style=svg
[12]: https://circleci.com/gh/KumaTea/tensorflow-aarch64
[13]: https://github.com/tensorflow/tensorflow/issues/49209
[14]: https://github.com/KumaTea/pytorch-aarch64
[15]: https://shields.io/badge/ver-2.7.0-brightgreen
