FROM jimmycuadra/rust

ENV UPX_VERSION=3.91

# install upx for compression
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    curl && \
  curl http://upx.sourceforge.net/download/upx-$UPX_VERSION-amd64_linux.tar.bz2 | tar -xj && \
  mv upx-$UPX_VERSION-amd64_linux/upx /bin/upx && \
  DEBIAN_FRONTEND=noninteractive apt-get remove --purge -y curl && \
  DEBIAN_FRONTEND=noninteractive apt-get autoremove -y && \
  rm -rf \
    upx-$UPX_VERSION-amd64_linux \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*

COPY build.sh /

ENTRYPOINT ["/build.sh"]