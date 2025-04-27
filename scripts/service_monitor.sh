#!/bin/bash
# Script: service_monitor.sh
# Author: SlyCyber
# Purpose: Check the status of critical services and log if any are inactive or failed

# Define which services to monitor
services=("sshd" "firewalld" "auditd")

echo "[*] Starting service check at $(date)"

# Loop through each service and check its status
for service in "${services[@]}"; do
    status=$(systemctl is-active "$service")  # Query the service status

    if [[ "$status" != "active" ]]; then
        # If service is not active, send a high-priority log to journalctl
        echo "[!] $service is not running! Status: $status" | systemd-cat -p err -t service_monitor
        echo "[!] ALERT: $service is DOWN (logged to journalctl)"
    else
        echo "[✓] $service is running"
    fi
done

echo "[✓] Service check completed."

