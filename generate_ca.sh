#!/usr/bin/env bash
set -x -eu -o pipefail

openvpn_image="docker.io/kylemanna/openvpn"
openvpn_version="2.4"
image="${openvpn_image}:${openvpn_version}"

data_dir="$(pwd)/data/"
name="openvpn-ca"

common_name="test.renegade-master.com"

# The container will prompt for a passphrase to
# protect the private key used by the newly generated certificate authority.
podman --storage-opt ignore_chown_errors=true run --rm \
    --name "${name}" \
    --env DEBUG=1 \
    --volume "${data_dir}":"/etc/openvpn":z \
    "${image}" \
        ovpn_genconfig -u "udp://${common_name}"
