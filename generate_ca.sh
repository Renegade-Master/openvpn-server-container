#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(pwd)/common.sh"
name="openvpn-ca"

# The container will prompt for a passphrase to
# protect the private key used by the newly generated certificate authority.
podman run --rm -it \
    --name "${name}" \
    --env DEBUG=0 \
    --volume "${data_dir}":"/etc/openvpn":z \
    "${image}" \
        ovpn_initpki
