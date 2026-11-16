#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="${1:-$HOME/fuzzing_tiff}"
INSTALL_DIR="$ROOT_DIR/install"
SRC_DIR="$ROOT_DIR/tiff-4.0.4"
TARBALL="$ROOT_DIR/tiff-4.0.4.tar.gz"

mkdir -p "$ROOT_DIR"
cd "$ROOT_DIR"

if [[ ! -f "$TARBALL" ]]; then
  wget https://download.osgeo.org/libtiff/tiff-4.0.4.tar.gz
fi

if [[ ! -d "$SRC_DIR" ]]; then
  tar -xzf "$TARBALL"
fi

rm -rf "$INSTALL_DIR"
cd "$SRC_DIR"
make clean >/dev/null 2>&1 || true

./configure --prefix="$INSTALL_DIR" --disable-shared
make -j"$(nproc)"
make install

cat <<EOF
LibTIFF 4.0.4 default build is ready.
Source:  $SRC_DIR
Install: $INSTALL_DIR

Smoke test:
  $INSTALL_DIR/bin/tiffinfo -D -j -c -r -s -w $SRC_DIR/test/images/palette-1c-1b.tiff
EOF
