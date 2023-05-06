#!/usr/bin/env bash
set +x -e -o pipefail

DEBUG=0

if [[ "$DEBUG" == "1" ]]; then
    set -x
fi

print_msg() {
    currdate="$(date +%Y-%m-%dT%H:%M:%SZ)"

    printf "${currdate} -- %s\n" "$1"
}

fail_with_error() {
    error="$1"

    printf "Error: [%s]\n" "$1"
    printf "Exiting...\n"
    exit 1
}


if [[ $(uname -a) =~ "x86_64" ]]; then
    openvpn_version="x86_64"
elif [[ $(uname -a) =~ "aarch64" ]] || [[ $(uname -a) =~ "arm64" ]]; then
    openvpn_version="aarch64"
else
  fail_with_error "Could not determine platform"
fi

openvpn_image="docker.io/nubacuk/docker-openvpn"
image="${openvpn_image}:${openvpn_version}"

work_dir="$(pwd)/data"
data_dir="${work_dir}/openvpn/"
clients_dir="${work_dir}/clients/"

name="openvpn"
