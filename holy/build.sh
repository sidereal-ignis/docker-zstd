#!/bin/bash
set -e

# Activate Holy Build Box environment.
source /hbb_exe_gc_hardened/activate

set -x

git clone -b v1.3.2 --depth 1 https://github.com/facebook/zstd.git

cd zstd

make

./zstd --help

ldd zstd

