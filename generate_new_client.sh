#!/usr/bin/env bash
set +x -e -o pipefail

source "$(pwd)/common.sh"
name="openvpn-cert"

if [[ -z "$1" ]]; then
    fail_with_error "No Client name supplied"
fi

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
        ovpn_getclient "${client_name}" > "${clients_dir}/${client_name}.ovpn"

# Retrieve the client OPT information
podman run --rm \
    --name openvpn \
    --volume "${data_dir}":"/etc/openvpn":z \
    "${image}" \
        ovpn_otp_user ${client_name}
