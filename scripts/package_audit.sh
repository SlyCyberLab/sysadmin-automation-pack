#!/bin/bash
# Script: package_audit.sh
# Author: SlyCyber
# Purpose: Audit for outdated packages and optionally clean up the system

echo "[*] Starting package audit at $(date)"
echo

# Step 1: Check for available updates and write to a file
echo "[*] Running 'dnf check-update'..."
dnf check-update > outdated.txt
dnf_exit=$?

# Step 2: Interpret exit code and report
if [[ $dnf_exit -eq 0 ]]; then
    echo "[+] No updates available. System is current."
elif [[ $dnf_exit -eq 100 ]]; then
    echo "[+] Updates available. Results saved to outdated.txt"
else
    echo "[!] Error occurred while checking for updates (exit code: $dnf_exit)"
    exit 1
fi
echo

# Step 3: Count how many packages are listed in the update file
update_count=$(grep -c "^[a-zA-Z0-9]" outdated.txt)
echo "[*] Packages potentially needing updates: $update_count"
echo

# Step 4: Ask user whether to clean the system
read -p "[?] Clean old packages and clear cache? (y/n): " response
if [[ "$response" == "y" || "$response" == "Y" ]]; then
    echo
    echo "[*] Performing cleanup using 'dnf autoremove' and 'dnf clean all'..."
    dnf autoremove -y && dnf clean all
    echo "[✓] Cleanup completed."
else
    echo "[*] No cleanup performed."
fi

echo
echo "[✓] Package audit script completed."
