#!/usr/bin/env bash
set -e

uid="${LOCAL_UID:-1000}"
gid="${LOCAL_GID:-1000}"

if [[ "$(id -u)" -eq 0 ]]; then
    current_gid="$(id -g fuzzer)"
    current_uid="$(id -u fuzzer)"

    if [[ "$gid" != "$current_gid" ]]; then
        groupmod --gid "$gid" fuzzer
    fi
    if [[ "$uid" != "$current_uid" ]]; then
        usermod --uid "$uid" --gid "$gid" fuzzer
    fi

    chown fuzzer:fuzzer /home/fuzzer /work
    export HOME=/home/fuzzer
    exec gosu fuzzer "$@"
fi

exec "$@"
