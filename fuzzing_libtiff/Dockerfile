FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG AFLPP_REF=2.68c
ARG PWNDBG_REF=2024.08.29

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    file \
    flex \
    bison \
    gdb \
    genisoimage \
    git \
    gnupg \
    lcov \
    libglib2.0-dev \
    libgmp-dev \
    libmpfr-dev \
    libpixman-1-dev \
    libreadline-dev \
    lsb-release \
    make \
    ninja-build \
    pkg-config \
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-venv \
    software-properties-common \
    texinfo \
    tmux \
    vim \
    wget \
    xz-utils \
    zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-11 main" > /etc/apt/sources.list.d/llvm11.list && \
    echo "deb http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu focal main" > /etc/apt/sources.list.d/gcc10.list && \
    apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 1E9377A2BA9EF27F && \
    apt-get update && apt-get install -y --no-install-recommends \
    clang-11 \
    clang-tools-11 \
    gcc-10 \
    g++-10 \
    gcc-10-multilib \
    gcc-10-plugin-dev \
    gdb \
    lcov \
    libc++1-11 \
    libc++-11-dev \
    libc++abi1-11 \
    libc++abi-11-dev \
    libclang-11-dev \
    lld-11 \
    liblld-11-dev \
    liblldb-11-dev \
    llvm-11 \
    llvm-11-dev \
    llvm-11-runtime \
    llvm-11-tools \
    libclang-common-11-dev \
    libclang-cpp11 \
    libclang-cpp11-dev \
    libclang1-11 \
    libllvm11 \
    libomp-11-dev \
    libomp5-11 \
    lldb-11 && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 --branch "${AFLPP_REF}" https://github.com/AFLplusplus/AFLplusplus.git /opt/AFLplusplus && \
    cd /opt/AFLplusplus && \
    REAL_CXX=g++-10 CC=gcc-10 CXX=g++-10 LLVM_CONFIG=llvm-config-11 make source-only -j"$(nproc)" && \
    make install

RUN python3 -m pip install --no-cache-dir "poetry==1.8.5"

RUN useradd -m -s /bin/bash fuzz && \
    git clone https://github.com/pwndbg/pwndbg /opt/pwndbg && \
    cd /opt/pwndbg && \
    git checkout "${PWNDBG_REF}" && \
    ./setup.sh

COPY scripts/setup_fuzzing101_ex4.sh /usr/local/bin/setup-fuzzing101-ex4
COPY scripts/rebuild_libtiff_coverage.sh /usr/local/bin/rebuild-libtiff-coverage
COPY scripts/run_libtiff_asan_fuzz.sh /usr/local/bin/run-libtiff-asan-fuzz

RUN chmod +x \
    /usr/local/bin/setup-fuzzing101-ex4 \
    /usr/local/bin/rebuild-libtiff-coverage \
    /usr/local/bin/run-libtiff-asan-fuzz

ENV LLVM_CONFIG=llvm-config-11
ENV CC=afl-clang-lto
ENV CXX=afl-clang-lto++
ENV ASAN_OPTIONS=detect_leaks=0
ENV AFL_SKIP_CPUFREQ=1
ENV PATH=/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin

USER fuzz
WORKDIR /home/fuzz/work

CMD ["/bin/bash"]
