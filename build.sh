#!/bin/bash -e

# build release executable(s)
cargo build --release

# copy executable(s) to root
for file in $(find target \
  -executable \
  -perm +0111 \
  -type f \
  -path "*/release/*" \
  -not \( -name "*.*" -or -name "*script*" -or -regex ".*-[a-f0-9]{16}" \)); do \
  ls -alh "$file"
  upx "$file"
  ls -alh "$file"
  cp -v "$file" .
done
