# MongoDB Audit Logging Script

This script updates `/etc/mongod.conf` to enable file-based logging and audit logging
in JSON format.

## What it does
- Backs up the MongoDB config file
- Inserts logging and audit settings under `systemLog:`
- Preserves correct YAML indentation

## Usage

git clone https://github.com/<your-username>/mongo-audit-logging.git
cd mongo-audit-logging
chmod +x update-mongo-logging.sh

```bash
chmod +x update-mongo-logging.sh
sudo ./update-mongo-logging.sh

## 5. Commit and push

```bash
git add .
git commit -m "Add MongoDB audit logging script"
git push origin main
