# conda package manifest generator

import os
import shutil
import requests


tensorflow = '2.8.0'

abis = {
    'py36': 'cp36-cp36m',
    'py37': 'cp37-cp37m',
    'py38': 'cp38-cp38',
    'py39': 'cp39-cp39',
    'py310': 'cp310-cp310',
}
conda_packages_path = '../conda'


def get_version_range(major_version, minor_version):
    version_string = f'{major_version}.{minor_version}'
    return f'>={version_string},<{major_version}.{int(minor_version) + 1}.0a0'


def process_dependencies_versions(info, py_ver):
    if not py_ver == 'py36':
        info = info.replace('    - dataclasses # [py36]\n', '')
    if py_ver == 'py310':
        info = info.replace('    - numpy=1.19', '    - numpy=1.22')
    return info


def generate_tensorflow_meta(py_ver, tf_version, tf_dir):
    with open('tensorflow.meta.yaml', 'r') as f:
        meta = f.read()

    python_abi = abis[py_ver]
    python_version = python_abi[2:python_abi.index('-')]
    major_version = python_version[:1]
    minor_version = python_version[1:]
    python_version = f'{major_version}.{minor_version}'
    python_version_range = get_version_range(major_version, minor_version)
    tf_version_range = get_version_range(
        tf_version.split('.')[0],
        tf_version.split('.')[1]
    )

    meta = meta.replace('FORMAT_TF_VERSION', tf_version)
    meta = meta.replace('FORMAT_TF_RANGE', tf_version_range)
    meta = meta.replace('FORMAT_PYTHON_VERSION', python_version)
    meta = meta.replace('FORMAT_PYTHON_RANGE', python_version_range)

    meta = process_dependencies_versions(meta, py_ver)

    with open(os.path.join(tf_dir, 'meta.yaml'), 'w') as f:
        f.write(meta)


def generate_manifest(python_version, tf_version, tf_license):
    working_dir = os.path.join(conda_packages_path, python_version)
    os.mkdir(working_dir)
    tf_dir = os.path.join(working_dir, 'tensorflow')
    os.mkdir(tf_dir)

    # meta.yaml
    generate_tensorflow_meta(python_version, tf_version, tf_dir)

    # build.sh
    with open(os.path.join(tf_dir, 'build.sh'), 'w') as f:
        f.write(
            f'$PYTHON -m '
            f'pip install tensorflow_aarch64-'
            f'{tf_version}-{abis[python_version]}-'
            f'manylinux_2_17_aarch64.manylinux2014_aarch64.whl '
            f'-f https://tf.kmtea.eu/whl/stable.html'
        )

    # LICENSE
    with open(os.path.join(tf_dir, 'LICENSE'), 'w') as f:
        f.write(tf_license)


if __name__ == '__main__':
    shutil.rmtree(conda_packages_path, ignore_errors=True)
    os.mkdir(conda_packages_path)

    tensorflow_license_content = requests.get(
        f'https://raw.githubusercontent.com/tensorflow/tensorflow/v{tensorflow}/LICENSE'
    ).text

    for pyv in abis:
        generate_manifest(pyv, tensorflow, tensorflow_license_content)
