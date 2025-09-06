Anleitung: easyFetch (Ubuntu)

> Author: Florian Prinz

## Vorwort

easyFetch ist ein Programm was für auf Debian basierende Linux-Distributionen entworfen wurde. Seine Aufgabe ist es automatisiert Konfigurationsdateien von Netzwerkgeräten wie Switches, Firewalls und WLAN-Controller zu sichern und in einem Git abzulegen.

## 1. Installation

Falls noch kein root Kennwort gesetzt wurde, root Kennwort setzen:

```
sudo passwd root && su root
```

Als root folgenden Befehl ausführen:

```
wget https://raw.githubusercontent.com/ChilleFielmann/easyFetch/refs/heads/main/scripts/easyFetch-init.sh -O ./easyFetch-init.sh && 
chmod +x easyFetch-init.sh &&
./easyFetch-init.sh
```

Der Befehl lädt das Skript easyFetch.init.sh aus dem GitHub-Repository herunter und startet es. Es legt unter anderem den Benutzer "aixconcept" an, erstellt die Ordnerstruktur und installiert alle benötigten Pakete.
