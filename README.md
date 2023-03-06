# tensorflow-aarch64

## Deprecation

Since [v 2.9.0, TensorFlow has officially provided][17] `aarch64` wheels.

This project has completed its mission.

---

[![Build Status][11]][12] [![ver][15]][3]
[![Coverage][5]][3]

[TensorFlow][1] wheels (whl) and docker images
for `aarch64` / ARMv8 / ARM64

[GitHub][7] | [Web][8] | [Torch][14]

## Install

### pip

**`pip install tensorflow-aarch64 -f https://tf.kmtea.eu/whl/stable.html`**

Backup link: `pip install tensorflow-aarch64 -f https://cf.tf.kmtea.eu/whl/stable.html`

To pick the `whl` files manually, please check the **[releases][3]**.

---

## Build

> Outdated & WIP

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
> OS: CentOS 7
> 
> GCC: v8.3.0
> 
> Virtualization: **Docker**

### Linaro's wheels

There are official wheels for Python ~~3.6~~ 3.7 - 3.10,
you could fetch them [here][9].

[1]: https://github.com/tensorflow/tensorflow
[2]: https://github.com/KumaTea/ext-whl
[3]: https://github.com/KumaTea/tensorflow-aarch64/releases
[4]: https://hub.docker.com/r/kumatea/tensorflow
[5]: https://shields.io/badge/python-3.7%20%7C%203.8%20%7C%203.9%20%7C%203.10-blue
[6]: https://shields.io/badge/manylinux-2014-blue
[7]: https://github.com/KumaTea/tensorflow-aarch64
[8]: https://tf.kmtea.eu
[9]: https://snapshots.linaro.org/ldcg/python/tensorflow-manylinux/latest/tensorflow-aarch64/
[10]: https://github.com/pypa/manylinux#manylinux2014-centos-7-based
[11]: https://circleci.com/gh/KumaTea/tensorflow-aarch64.svg?style=svg
[12]: https://circleci.com/gh/KumaTea/tensorflow-aarch64
[13]: https://github.com/tensorflow/tensorflow/issues/49209
[14]: https://github.com/KumaTea/pytorch-aarch64
[15]: https://shields.io/badge/ver-2.10-brightgreen
[16]: https://anaconda.org/KumaTea/tensorflow
[17]: https://pypi.org/project/tensorflow/2.10.0/#files
