#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

: "${FAIL2BAN_LAB_PASSWORD:?Die Umgebungsvariable FAIL2BAN_LAB_PASSWORD ist nicht gesetzt.}"

apt-get update -qq
apt-get install -y -qq openssh-server fail2ban nftables rsyslog

systemctl enable --now ssh
systemctl enable --now rsyslog

if ! id -u labuser >/dev/null 2>&1; then
  useradd --create-home --shell /bin/bash labuser
fi
printf '%s:%s\n' 'labuser' "$FAIL2BAN_LAB_PASSWORD" | chpasswd
unset FAIL2BAN_LAB_PASSWORD

install -m 0644 /vagrant/konfiguration/sshd-labor.conf /etc/ssh/sshd_config.d/99-fail2ban-labor.conf
/usr/sbin/sshd -t
systemctl restart ssh

install -m 0644 /vagrant/konfiguration/sshd-jail.local /etc/fail2ban/jail.d/sshd-labor.local
install -m 0644 /vagrant/konfiguration/fail2ban.local /etc/fail2ban/fail2ban.local
fail2ban-client -t
systemctl enable fail2ban
systemctl restart fail2ban
sleep 3
fail2ban-client ping
fail2ban-client status sshd
