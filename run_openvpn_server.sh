#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(dirname $0)/common.sh"
name="openvpn-server"

# Start OpenVPN server process
podman run \
    --name "${name}" \
    --detach \
    --restart="unless-stopped" \
    --env DEBUG=${DEBUG} \
    --publish 1194:1194/udp \
    --volume "${data_dir}":"/etc/openvpn":z \
    --cap-add=NET_ADMIN \
    --privileged \
    "${image}"

