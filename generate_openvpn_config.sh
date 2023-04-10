#!/usr/bin/env bash
set +x -e -o pipefail

source "$(pwd)/common.sh"
name="openvpn-gen-config"
cipher="AES-256-GCM"

if [[ -z "$1" ]] || [[ "$1" == "" ]]; then
    fail_with_error "No Common Name supplied"
fi

common_name="$1"

# Initialize the $OVPN_DATA container that will hold the configuration
# files and certificates.
podman --storage-opt ignore_chown_errors=true run --rm \
    --name "${name}" \
    --env DEBUG=0 \
    --volume "${data_dir}":"/etc/openvpn":z \
    "${image}" \
        ovpn_genconfig \
            -u "udp://${common_name}" \
            -2 \
            -C "${cipher}"
