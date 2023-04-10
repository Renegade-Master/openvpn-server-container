
#!/usr/bin/env bash
set +x -eu -o pipefail

rm -rf $(pwd)/data

mkdir -p $(pwd)/data/openvpn $(pwd)/data/clients
