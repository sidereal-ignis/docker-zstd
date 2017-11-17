FROM buildpack-deps:stretch

WORKDIR /root

RUN set -x \
 && apt-get update && apt-get install -y --no-install-recommends liblz4-dev \
 && rm -rf /var/lib/apt/lists/* \
 && git clone -b v1.3.2 --depth 1 https://github.com/facebook/zstd.git \
 && cd zstd \
 && make \
 && ./zstd --help


FROM debian:stretch-slim

RUN set -x \
 && apt-get update && apt-get install -y --no-install-recommends liblz4-1 \
 && rm -rf /var/lib/apt/lists/*

COPY --from=0 /root/zstd/zstd /usr/local/bin/

ENTRYPOINT [ "zstd" ]

