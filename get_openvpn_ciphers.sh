#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(pwd)/common.sh"
name="openvpn-info"

# List all valid ciphers
podman run --rm -it \
    --name "${name}" \
    --env DEBUG=${DEBUG} \
    --volume "${data_dir}":"/etc/openvpn":z \
    --volume "${clients_dir}":"/etc/openvpn/clients":z \
    "${image}" \
        openvpn --show-ciphers
