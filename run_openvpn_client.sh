#!/usr/bin/env bash
set +x -eu -o pipefail

openvpn_image="docker.io/kylemanna/openvpn"
openvpn_version="2.4"
image="${openvpn_image}:${openvpn_version}"

data_dir="$(pwd)/data/"
name="openvpn-server"

# Start OpenVPN server process
podman run --rm \
    --name "${name}" \
    --port 1194:1194/udp \
    --volume "${data_dir}":"/etc/openvpn":z \
    --cap-add=NET_ADMIN \
    "${image}"
