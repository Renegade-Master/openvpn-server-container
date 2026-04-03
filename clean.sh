#!/usr/bin/env bash
set +x -eu -o pipefail

source "$(pwd)/common.sh"

print_msg "Moving [data] folder..."
mv $(pwd)/data $(pwd)/.bak/data-$(date +%Y%m%dT%H%M%SZ) || true
print_msg "[data] folder moved."

print_msg "Creating [data] folder..."
mkdir -p $(pwd)/data/openvpn $(pwd)/data/clients
print_msg "[data] folder created."
