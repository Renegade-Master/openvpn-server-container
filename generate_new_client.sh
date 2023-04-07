#!/usr/bin/env bash
set +x -eu -o pipefail

openvpn_image="docker.io/kylemanna/openvpn"
openvpn_version="2.4"
image="${openvpn_image}:${openvpn_version}"

data_dir="$(pwd)/data/"
name="openvpn-cert"

client_name="$1"

# Generate a client certificate without a passphrase
podman run --rm -it \
    --name openvpn \
    --volume "${data_dir}":"/etc/openvpn":z \
    "${image}" \
        easyrsa build-client-full "${client_name}" nopass

# Retrieve the client configuration with embedded certificates
podman run --rm \
    --name openvpn \
    --volume "${data_dir}":"/etc/openvpn":z \
    "${image}" \
        ovpn_getclient "${client_name}" > "${client_name}.ovpn"
