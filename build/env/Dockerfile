FROM quay.io/pypa/manylinux_2_24_aarch64

RUN set -ex \
        \
        && echo "cd /root" >> /root/.bashrc \
        && apt update \
        && apt install -y ca-certificates \
        && cp /etc/apt/sources.list /etc/apt/sources.list.bak \
        && sed -i 's@http://deb.debian.org/debian@https://mirrors.matrix.moe/debian@g' /etc/apt/sources.list \
        && sed -i 's@http://security.debian.org/debian-security@https://mirrors.matrix.moe/debian-security@g' /etc/apt/sources.list \
        && apt update \
        && apt install -y automake autoconf bash build-essential ca-certificates clang curl wget nano git xz-utils zlib1g-dev pkg-config openjdk-8-jdk zip unzip libtool swig \
        && rm -rf /var/lib/apt/lists/* \
        && mv /etc/apt/sources.list.bak /etc/apt/sources.list

RUN set -ex \
        \
        && cd /tmp \
        && wget https://github.com/bazelbuild/bazel/releases/download/3.7.2/bazel-3.7.2-linux-arm64 \
        && mv /tmp/bazel-3.7.2-linux-arm64 /usr/bin/bazel \
        && bazel version

RUN set -ex \
        \
        && /opt/python/cp39-cp39/bin/pip config set global.index-url https://mirrors.matrix.moe/pypi/web/simple \
        && /opt/python/cp39-cp39/bin/python3.9 -m pip install -U pip setuptools wheel \
        && /opt/python/cp39-cp39/bin/python3.9 -m pip install -U auditwheel numpy keras_preprocessing \
        && /opt/python/cp38-cp38/bin/python3.8 -m pip install -U pip setuptools wheel \
        && /opt/python/cp38-cp38/bin/python3.8 -m pip install -U auditwheel numpy keras_preprocessing \
        && /opt/python/cp37-cp37m/bin/python3.7 -m pip install -U pip setuptools wheel \
        && /opt/python/cp37-cp37m/bin/python3.7 -m pip install -U auditwheel numpy keras_preprocessing \
        && /opt/python/cp36-cp36m/bin/python3.6 -m pip install -U pip setuptools wheel \
        && /opt/python/cp36-cp36m/bin/python3.6 -m pip install -U auditwheel numpy keras_preprocessing \
        && rm -rf /root/.cache/* \
        && rm -rf /root/.config/pip

CMD ["/bin/bash"]
