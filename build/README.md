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

### Optional: Manylinux wheels
