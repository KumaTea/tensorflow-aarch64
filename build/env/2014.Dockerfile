FROM quay.io/pypa/manylinux2014_aarch64

RUN set -ex \
        \
        && sed -e 's|^mirrorlist=|#mirrorlist=|g' -e 's|^#baseurl=http://mirror.centos.org/altarch/|baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos-altarch/|g' -e 's|^#baseurl=http://mirror.centos.org/$contentdir/|baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos-altarch/|g' -i.bak /etc/yum.repos.d/CentOS-*.repo \
        && sed -e 's|^#baseurl=http://mirror.centos.org/centos/7/sclo/$basearch/rh/|baseurl=http://mirrors.tuna.tsinghua.edu.cn/centos-altarch/7/sclo/$basearch/rh/|g' -i.bak /etc/yum.repos.d/CentOS-SCLo-scl-rh.repo \
        && yum install -y dnf \
        && dnf install -y epel-release \
        && sed -e 's!^metalink=!#metalink=!g' -e 's!^#baseurl=!baseurl=!g' -e 's!//download\.fedoraproject\.org/pub!//mirrors.tuna.tsinghua.edu.cn!g' -e 's!http://mirrors!https://mirrors!g' -i /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel-testing.repo \
        && dnf install -y automake autoconf clang curl wget nano git xz zlib-devel pkgconfig zip unzip libtool swig java-1.8.0-openjdk-devel centos-release-scl devtoolset-8 \
        && dnf clean all \
        && yum clean all \
        && rm -rf /var/cache/dnf \
        && rm -rf /var/cache/yum

RUN set -ex \
        \
        && cd /tmp \
        && wget https://github.com/bazelbuild/bazel/releases/download/4.2.1/bazel-4.2.1-linux-arm64 \
        && chmod +x /tmp/bazel-4.2.1-linux-arm64 \
        && mv /tmp/bazel-4.2.1-linux-arm64 /usr/bin/bazel \
        && bazel version

RUN set -ex \
        \
        && /opt/python/cp39-cp39/bin/pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple \
        && /opt/python/cp39-cp39/bin/python3.9 -m pip install -U pip setuptools wheel \
        && /opt/python/cp39-cp39/bin/python3.9 -m pip install -U auditwheel "numpy~=1.19.2" keras_preprocessing \
        && /opt/python/cp38-cp38/bin/python3.8 -m pip install -U pip setuptools wheel \
        && /opt/python/cp38-cp38/bin/python3.8 -m pip install -U auditwheel "numpy~=1.19.2" keras_preprocessing \
        && /opt/python/cp37-cp37m/bin/python3.7 -m pip install -U pip setuptools wheel \
        && /opt/python/cp37-cp37m/bin/python3.7 -m pip install -U auditwheel "numpy~=1.19.2" keras_preprocessing \
        && /opt/python/cp36-cp36m/bin/python3.6 -m pip install -U pip setuptools wheel \
        && /opt/python/cp36-cp36m/bin/python3.6 -m pip install -U auditwheel "numpy~=1.19.2" keras_preprocessing \
        && /opt/python/cp310-cp310/bin/python3.10 -m pip install -U pip setuptools wheel \
        && /opt/python/cp310-cp310/bin/python3.10 -m pip install -U auditwheel "numpy~=1.21.2" keras_preprocessing \
        && rm -rf /root/.cache/* \
        && rm -rf /root/.config/pip

COPY custom.bashrc /root/

RUN set -ex \
        \
        && cat /root/custom.bashrc >> /root/.bashrc

CMD ["/bin/bash"]
