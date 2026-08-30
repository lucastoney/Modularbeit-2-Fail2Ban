#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update -qq
apt-get install -y -qq openssh-client sshpass

if ! grep -q '^192\.168\.56\.10[[:space:]]\+fail2ban-server$' /etc/hosts; then
  echo '192.168.56.10 fail2ban-server' >> /etc/hosts
fi

ssh -V
sshpass -V | head -n 1
