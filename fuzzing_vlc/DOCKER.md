# Fuzzing101 Ubuntu 20.04 environment

This is a simple Ubuntu 20.04 LTS environment for following the Fuzzing101
README commands. Official Ubuntu Docker images do not provide a `20.04.2`
tag, so the supported `ubuntu:20.04` tag is used.

- Ubuntu 20.04
- Build dependencies listed in Exercise 1
- GNU gettext tools required by VLC's generated metadata
- GDB, GDB server, strace, ltrace, and Valgrind
- Passwordless `sudo` for the `fuzzer` user
- The repository mounted at `/work`

## Use

```bash
make build
make shell
```

Inside the container, follow the README to install/build AFL++ and VLC. GDB is
already installed and `SYS_PTRACE` is enabled.
