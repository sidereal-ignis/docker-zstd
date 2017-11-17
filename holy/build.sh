#!/bin/bash
set -e

# Activate Holy Build Box environment.
source /hbb_exe_gc_hardened/activate

set -x

export ZSTD_VER=1.3.2

curl -fsSLO https://github.com/facebook/zstd/archive/v${ZSTD_VER}.tar.gz

tar xzf v${ZSTD_VER}.tar.gz

mv zstd-${ZSTD_VER} zstd

cd zstd

make

./zstd --help

ldd zstd


