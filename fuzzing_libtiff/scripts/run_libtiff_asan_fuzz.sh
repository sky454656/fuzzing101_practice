#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="${1:-$HOME/fuzzing_tiff}"
INSTALL_DIR="$ROOT_DIR/install"
SRC_DIR="$ROOT_DIR/tiff-4.0.4"
OUT_DIR="${2:-$ROOT_DIR/out}"

if [[ ! -d "$SRC_DIR" ]]; then
  echo "Missing source tree: $SRC_DIR" >&2
  echo "Run setup-fuzzing101-ex4 first." >&2
  exit 1
fi

rm -rf "$INSTALL_DIR"
mkdir -p "$OUT_DIR"

cd "$SRC_DIR"
make clean >/dev/null 2>&1 || true

CC=afl-clang-lto ./configure --prefix="$INSTALL_DIR" --disable-shared
AFL_USE_ASAN=1 make -j"$(nproc)"
AFL_USE_ASAN=1 make install

afl-fuzz -m none \
  -i "$SRC_DIR/test/images/" \
  -o "$OUT_DIR" \
  -s 123 \
  -- "$INSTALL_DIR/bin/tiffinfo" -D -j -c -r -s -w @@
