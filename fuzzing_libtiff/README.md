# Fuzzing101 Exercise 4 Docker Environment

This workspace packages a Docker environment for `Fuzzing101` Exercise 4 (`LibTIFF`, `CVE-2016-9297`).

## Why Docker

The original exercise was tested on `Ubuntu 20.04.2 LTS` and uses `llvm-config-11`, `afl-clang-lto`, `ASan`, and `lcov`.

Your current host is different:

- `Ubuntu 22.04.5 LTS`
- `WSL2`
- `LLVM 14.0.0`
- `AFL++ 4.36a`
- missing `llvm-config-11`
- missing `lcov`

That means your host is not the reference environment for the exercise.

Sources:

- Fuzzing101 README: <https://github.com/antonio-morales/Fuzzing101>
- Exercise 4: <https://github.com/antonio-morales/Fuzzing101/tree/main/Exercise%204>
- pwndbg setup docs: <https://pwndbg.re/pwndbg/2025.04.18/setup/>
- AFL++ install docs: <https://aflplus.plus/docs/install/>

## Included Tooling

- `Ubuntu 20.04`
- `LLVM/Clang 11`
- `AFL++` built from source
- `ASan` runtime for Clang 11
- `lcov`
- `gdb`
- `pwndbg` release `2024.08.29` for Ubuntu 20.04 compatibility

## Build

```bash
docker compose build
```

## Open A Shell

```bash
docker compose run --rm fuzzing101-ex4
```

## Prepare LibTIFF 4.0.4

Inside the container:

```bash
setup-fuzzing101-ex4
```

Smoke test:

```bash
$HOME/fuzzing_tiff/install/bin/tiffinfo -D -j -c -r -s -w \
  $HOME/fuzzing_tiff/tiff-4.0.4/test/images/palette-1c-1b.tiff
```

## Rebuild For Coverage

```bash
rebuild-libtiff-coverage
```

## Run ASan Fuzzing

```bash
run-libtiff-asan-fuzz
```

## Use pwndbg

```bash
gdb --args $HOME/fuzzing_tiff/install/bin/tiffinfo -D -j -c -r -s -w ./poc.tiff
```

If `pwndbg` is loaded correctly, the GDB prompt will show pwndbg commands and context panes.
