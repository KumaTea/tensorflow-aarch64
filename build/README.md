# Building Tutorial for TensorFlow AArch64

## Host Preparation

### Adjust your RAM

**TL;DR: Total RAM >= 12GB.**

The peak RAM usage during the whole building process is about 12GB.

I'm using a Raspberry Pi 4 B with 4GB RAM, so I have adjust my ZRAM size to 4*2GB = 8GB.
The total RAM is now 4GB + 8GB (ZRAM) = 12GB.
I also prepared an USB disk for swap, since It may somehow exceed the total.

However, don't rely on swap, because it is extremely slow
and may significantly slow down the building process,
unless you are using a Ramdisk.

## Building Docker Container

`docker build -f env/Dockerfile .`

### Building

1. Enter the docker container

`docker run -it --name tf -v /mnt/sda1/tf:/root/tf <your image tag>`

Here I use the `-v` tag so I can avoid `docker cp`.

2. Clone the repo

```shell
cd /root/tf/or/your/working/dir
git clone https://github.com/tensorflow/tensorflow
```

Skip this if you have already done cloning.

3. Configuration

```shell
cd /root/tf/or/your/working/dir/tensorflow
git checkout v2.4.1

./configure
```

```
root@51899a8bf6e6:~/tf/py39/tensorflow# ./configure
You have bazel 3.7.2 installed.
Please specify the location of python. [Default is /usr/bin/python3]: /opt/python/cp39-cp39/bin/python3


Found possible Python library paths:
  /opt/python/cp39-cp39/lib/python3.9/site-packages
Please input the desired Python library path to use.  Default is [/opt/python/cp39-cp39/lib/python3.9/site-packages]

Do you wish to build TensorFlow with ROCm support? [y/N]:
No ROCm support will be enabled for TensorFlow.

Do you wish to build TensorFlow with CUDA support? [y/N]:
No CUDA support will be enabled for TensorFlow.

Do you wish to download a fresh release of clang? (Experimental) [y/N]:
Clang will not be downloaded.

Please specify optimization flags to use during compilation when bazel option "--config=opt" is specified [Default is -Wno-sign-compare]:


Would you like to interactively configure ./WORKSPACE for Android builds? [y/N]:
Not configuring the WORKSPACE for Android builds.

Preconfigured Bazel build configs. You can use any of the below by adding "--config=<>" to your build command. See .bazelrc for more details.
        --config=mkl            # Build with MKL support.
        --config=mkl_aarch64    # Build with oneDNN support for Aarch64.
        --config=monolithic     # Config for mostly static monolithic build.
        --config=ngraph         # Build with Intel nGraph support.
        --config=numa           # Build with NUMA support.
        --config=dynamic_kernels        # (Experimental) Build kernels into separate shared objects.
        --config=v2             # Build TensorFlow 2.x instead of 1.x.
Preconfigured Bazel build configs to DISABLE default on features:
        --config=noaws          # Disable AWS S3 filesystem support.
        --config=nogcp          # Disable GCP support.
        --config=nohdfs         # Disable HDFS support.
        --config=nonccl         # Disable NVIDIA NCCL support.
Configuration finished
root@51899a8bf6e6:~/tf/py38/tensorflow#
```

4. Building wheel builder

```shell
bazel build --config=noaws --config=nogcp --config=nohdfs --config=nonccl //tensorflow/tools/pip_package:build_pip_package
```

5. Build the wheel
```shell
./bazel-bin/tensorflow/tools/pip_package/build_pip_package /root/tf/your/output/dir/
```

### Optional: Manylinux wheels
