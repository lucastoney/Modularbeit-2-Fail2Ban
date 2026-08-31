# Technischer Teil der Modulararbeit 2: Fail2ban

Dieses Repository enthält die technische Umsetzung der Modulararbeit zur Absicherung eines SSH-Dienstes mit Fail2ban in einer isolierten Laborumgebung.

## Technischer Aufbau

- `Vagrantfile`: Definition der Server- und Tester-VM
- `konfiguration/`: Fail2ban- und SSH-Konfigurationsdateien
- `skripte/`: Bereitstellung und Konfiguration der beiden virtuellen Maschinen

## Voraussetzungen

- Vagrant
- VirtualBox
- lokale Umgebungsvariable `FAIL2BAN_LAB_PASSWORD` ohne Speicherung des Passworts im Repository

Die schriftliche Dokumentation wird separat als Word-Datei eingereicht.
