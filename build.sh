#!/bin/bash -e

# build release executable(s)
cargo build --release

# copy executable(s) to root
find -E target \
  -perm +0111 \
  -type f \
  -path "*/release/*"
  -not \( -name "*.*" -or -name "*script*" -or -regex ".*-[a-f0-9]{16}" \) \
  | xargs -J % cp -v % .
