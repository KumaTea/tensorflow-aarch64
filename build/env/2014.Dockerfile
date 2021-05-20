FROM quay.io/pypa/manylinux2014_aarch64

RUN set -ex \
        \
        && echo "cd /root" >> /root/.bashrc \
        && yum install -y dnf \
        && dnf install -y automake autoconf clang curl wget nano git xz zlib-devel pkgconfig zip unzip libtool swig java-1.8.0-openjdk-devel centos-release-scl devtoolset-7 \
        && dnf clean all \
        && yum clean all \
        && rm -rf /var/cache/dnf \
        && rm -rf /var/cache/yum

RUN set -ex \
        \
        && cd /tmp \
        && wget https://github.com/bazelbuild/bazel/releases/download/3.7.2/bazel-3.7.2-linux-arm64 \
        && chmod +x /tmp/bazel-3.7.2-linux-arm64 \
        && mv /tmp/bazel-3.7.2-linux-arm64 /usr/bin/bazel \
        && bazel version

RUN set -ex \
        \
        && /opt/python/cp39-cp39/bin/pip config set global.index-url https://mirrors.matrix.moe/pypi/web/simple \
        && /opt/python/cp39-cp39/bin/python3.9 -m pip install -U pip setuptools wheel \
        && /opt/python/cp39-cp39/bin/python3.9 -m pip install -U auditwheel "numpy~=1.19.2" keras_preprocessing \
        && /opt/python/cp38-cp38/bin/python3.8 -m pip install -U pip setuptools wheel \
        && /opt/python/cp38-cp38/bin/python3.8 -m pip install -U auditwheel "numpy~=1.19.2" keras_preprocessing \
        && /opt/python/cp37-cp37m/bin/python3.7 -m pip install -U pip setuptools wheel \
        && /opt/python/cp37-cp37m/bin/python3.7 -m pip install -U auditwheel "numpy~=1.19.2" keras_preprocessing \
        && /opt/python/cp36-cp36m/bin/python3.6 -m pip install -U pip setuptools wheel \
        && /opt/python/cp36-cp36m/bin/python3.6 -m pip install -U auditwheel "numpy~=1.19.2" keras_preprocessing \
        && rm -rf /root/.cache/* \
        && rm -rf /root/.config/pip

COPY custom.bashrc /root/

RUN set -ex \
        \
        && cat /root/custom.bashrc >> /root/.bashrc

CMD ["/bin/bash"]
