#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(pwd)/common.sh"

print_msg "Removing [data] folder..."
rm -rf $(pwd)/data
print_msg "[data] folder removed."

print_msg "Creating [data] folder..."
mkdir -p $(pwd)/data/openvpn $(pwd)/data/clients
print_msg "[data] folder created."
