#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(pwd)/common.sh"
name="openvpn-server"

# Start OpenVPN server process
podman run --rm \
    --name "${name}" \
    --publish 1194:1194/udp \
    --volume "${data_dir}":"/etc/openvpn":z \
    --cap-add=NET_ADMIN \
    --privileged \
    "${image}"
