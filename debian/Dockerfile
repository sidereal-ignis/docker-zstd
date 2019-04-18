FROM buildpack-deps:stretch

WORKDIR /root

RUN set -x \
 && apt-get update && apt-get install -y --no-install-recommends liblz4-dev \
 && rm -rf /var/lib/apt/lists/* \
 && git clone -b v1.4.0 --depth 1 https://github.com/facebook/zstd.git \
 && cd zstd \
 && git log -5 \
 && make \
 && ./zstd --help


FROM debian:stretch-slim

COPY --from=0 /root/zstd/zstd /usr/local/bin/

ENTRYPOINT [ "zstd" ]

