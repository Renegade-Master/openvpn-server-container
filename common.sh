#!/usr/bin/env bash
set +x -e -o pipefail

openvpn_image="docker.io/kylemanna/openvpn"
openvpn_version="2.4"
image="${openvpn_image}:${openvpn_version}"

work_dir="$(pwd)/data"
data_dir="${work_dir}/openvpn/"
clients_dir="${work_dir}/clients/"

name="openvpn"


fail_with_error() {
    error="$1"
    
    printf "Error: [%s]\n" "$1"
    printf "Exiting...\n"
    exit 1
}