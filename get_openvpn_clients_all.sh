#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(pwd)/common.sh"
name="openvpn-client-info"

# List all Clients information
podman run --rm -it \
    --name "${name}" \
    --env DEBUG=${DEBUG} \
    --volume "${data_dir}":"/etc/openvpn":z \
    --volume "${clients_dir}":"/etc/openvpn/clients":z \
    "${image}" \
        ovpn_getclient_all
