#!/usr/bin/env bash

set -euo pipefail

export AFL_USE_ASAN=1

exec afl-fuzz -m none -i in_bootp -o out_bootp -s 123 -- \
  ./tcpdump-tcpdump-4.9.1/tcpdump -vvvvXX -ee -nn -r @@
