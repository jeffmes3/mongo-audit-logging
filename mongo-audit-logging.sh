#!/bin/bash

CONFIG_FILE="/etc/mongod.conf"

# Make a backup before modifying the file
cp "$CONFIG_FILE" "${CONFIG_FILE}.bak"

# Insert audit and log configuration after systemLog:
sed -i '/systemLog:/a \
    destination: file\n\
    path: /var/log/mongodb/audit.log\n\
    logAppend: true\n\
    auditLog:\n\
        destination: file\n\
        format: JSON' "$CONFIG_FILE"

echo "MongoDB configuration updated. Backup saved as ${CONFIG_FILE}.bak"
