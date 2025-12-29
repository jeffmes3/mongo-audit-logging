#!/bin/bash
set -euo pipefail

CONFIG_FILE="/etc/mongod.conf"

# Backup before modifying
cp -a "$CONFIG_FILE" "${CONFIG_FILE}.bak"

# Avoid duplicate insertion
if grep -qE '^\s*auditLog:' "$CONFIG_FILE"; then
  echo "auditLog already configured. No changes made."
  exit 0
fi

# Insert logging and audit configuration after systemLog:
sed -i '/^systemLog:/r /dev/stdin' "$CONFIG_FILE" <<'EOF'
    destination: file
    path: /var/log/mongodb/audit.log
    logAppend: true
    auditLog:
        destination: file
        format: JSON
EOF

echo "MongoDB configuration updated. Backup saved as ${CONFIG_FILE}.bak"
