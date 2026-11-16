#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="${1:-$HOME/fuzzing_tiff}"
INSTALL_DIR="$ROOT_DIR/install"
SRC_DIR="$ROOT_DIR/tiff-4.0.4"

if [[ ! -d "$SRC_DIR" ]]; then
  echo "Missing source tree: $SRC_DIR" >&2
  echo "Run setup-fuzzing101-ex4 first." >&2
  exit 1
fi

rm -rf "$INSTALL_DIR"
cd "$SRC_DIR"
make clean >/dev/null 2>&1 || true

CFLAGS="--coverage" LDFLAGS="--coverage" ./configure --prefix="$INSTALL_DIR" --disable-shared
make -j"$(nproc)"
make install

cat <<EOF
Coverage build is ready.

Example:
  cd $SRC_DIR
  lcov --zerocounters --directory ./
  lcov --capture --initial --directory ./ --output-file app.info
  $INSTALL_DIR/bin/tiffinfo -D -j -c -r -s -w $SRC_DIR/test/images/palette-1c-1b.tiff
  lcov --no-checksum --directory ./ --capture --output-file app2.info
  genhtml --highlight --legend -output-directory ./html-coverage/ ./app2.info
EOF
