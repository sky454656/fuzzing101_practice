FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Etc/UTC

RUN apt-get update && apt-get install -y --no-install-recommends \
        autoconf \
        automake \
        bison \
        build-essential \
        ca-certificates \
        clang-11 \
        file \
        flex \
        gcc-9-plugin-dev \
        gdb \
        gdbserver \
        gettext \
        git \
        gosu \
        less \
        libglib2.0-dev \
        libpixman-1-dev \
        libstdc++-9-dev \
        lld-11 \
        llvm-11 \
        llvm-11-dev \
        ltrace \
        nano \
        patch \
        procps \
        python3-dev \
        python3-setuptools \
        sudo \
        strace \
        valgrind \
        wget \
        xz-utils \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid 1000 fuzzer \
    && useradd --uid 1000 --gid fuzzer --create-home --shell /bin/bash fuzzer \
    && echo "fuzzer ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/fuzzer \
    && chmod 0440 /etc/sudoers.d/fuzzer \
    && mkdir -p /work \
    && chown fuzzer:fuzzer /work

COPY docker/entrypoint.sh /usr/local/bin/fuzzing-entrypoint
RUN chmod +x /usr/local/bin/fuzzing-entrypoint

WORKDIR /work
ENTRYPOINT ["/usr/local/bin/fuzzing-entrypoint"]
CMD ["/bin/bash"]
