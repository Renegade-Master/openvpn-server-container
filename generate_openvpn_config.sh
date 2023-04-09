#!/usr/bin/env bash
set -x -eu -o pipefail

openvpn_image="docker.io/kylemanna/openvpn"
openvpn_version="2.4"
image="${openvpn_image}:${openvpn_version}"

data_dir="$(pwd)/data/"
name="openvpn-gen-config"

common_name="test.renegade-master.com"

# Initialize the $OVPN_DATA container that will hold the configuration
# files and certificates.
podman --storage-opt ignore_chown_errors=true run --rm \
    --name "${name}" \
    --env DEBUG=1 \
    --volume "${data_dir}":"/etc/openvpn":z \
    "${image}" \
        ovpn_genconfig -u "udp://${common_name}"
