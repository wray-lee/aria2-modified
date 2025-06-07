#!/bin/bash

./configure --with-ca-bundle='/etc/ssl/certs/ca-certificates.crt' \
  --with-openssl \
  --without-gnutls \
  --without-libnettle \
  --without-libgmp \
  --enable-static=yes \
  --enable-shared=no \
  LIBS="-lssl -lcrypto -lpthread -ldl \
        /usr/lib/x86_64-linux-gnu/libxml2.a \
        /usr/lib/x86_64-linux-gnu/libsqlite3.a \
        /usr/lib/x86_64-linux-gnu/libssh2.a \
        /usr/lib/x86_64-linux-gnu/libcares.a \
        /usr/lib/x86_64-linux-gnu/libz.a"

make -j$(( $(nproc) - 1 )) && strip src/aria2c
