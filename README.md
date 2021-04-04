# tensorflow-aarch64

[TensorFlow][1] wheels (whl) and docker images
for `aarch64` / ARMv8 / ARM64

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

[1]: https://github.com/tensorflow/tensorflow
[2]: https://github.com/KumaTea/ext-whl
[3]: https://github.com/KumaTea/tensorflow-aarch64/releases
[4]: https://hub.docker.com/r/kumatea/tensorflow
