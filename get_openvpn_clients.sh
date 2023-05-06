#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(pwd)/common.sh"
name="openvpn-client-info"

# List all Clients and CRL
podman run --rm -it \
    --name "${name}" \
    --env DEBUG=${DEBUG} \
    --volume "${data_dir}":"/etc/openvpn":z \
    "${image}" \
        ovpn_listclients
