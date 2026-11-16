`in_bootp/bootp_near_crash_seed.pcap` is the BOOTP seed for Exercise 3.
It is derived from the upstream-style crash PoC by increasing the pcap global `snaplen` from 53 to 54, so AFL can ingest it but it still stays one mutation away from the target path.

`repro/bootp_crash_repro.pcap` is the direct crash reproducer for the ASan build:

`./install-asan/sbin/tcpdump -vvvvXX -ee -nn -r repro/bootp_crash_repro.pcap`

Expected result: AddressSanitizer heap-buffer-overflow in `bootp_print()` via `EXTRACT_16BITS()` from `print-bootp.c`.

To fuzz with the fixed random seed the exercise uses:

`./run_bootp_afl.sh`

Equivalent command:

`AFL_USE_ASAN=1 afl-fuzz -m none -i in_bootp -o out_bootp -s 123 -- ./tcpdump-tcpdump-4.9.1/tcpdump -vvvvXX -ee -nn -r @@`
