#!/usr/bin/env bash
set +x -eu -o pipefail

USER_HOME=/home/opc/
REPO_PATH=${USER_HOME}/ws/openvpn-server-container/

log() {
  echo "$(date) :: ${1}" >> $USER_HOME/vpn-start-times.log
}

log "Restart detected"

log "Add ip_tables to modules"
echo "ip_tables" >> /etc/modules
log "Add ip_tables to modules ... Done!"

log "Modprobe ip_tables"
modprobe ip_tables || true
log "Modprobe ip_tables ... Done!"

log "Stop OpenVPN Server"
podman stop openvpn-server || true
log "Stop OpenVPN Server ... Done!"

log "Remove OpenVPN Server container"
podman rm --force openvpn-server || true
log "Remove OpenVPN Server container ... Done!"

log "Run OpenVPN Server script"
${REPO_PATH}/run_openvpn_server.sh
log "Run OpenVPN Server script ... Done!"

log "VPN Restart script complete!"
log ""

