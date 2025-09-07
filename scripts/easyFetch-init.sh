#!/bin/bash
#exec > /dev/null

#Variablen
version="1.0"
kunde=""
standort="" 

#Kunde abfragen
echo -n "Kunde:"
read kunde
echo -n "Standort:"
read standort

#Packete upgraden
echo "[INFO]Pakete werden aktualisiert..."
apt update > /dev/null
apt -y upgrade > /dev/null
echo "[OK]Pakete aktualisiert!" &&

#Pakete installieren
echo "[INFO]Pakete werden installiert..."
sleep 2
apt install -y tldr
apt install -y ipcalc
apt install -y nmap
apt install -y openvpn
snap install yq
echo "[OK]" &&

#Maschine umbenennen
echo "[INFO]Hostname setzen..."
sleep 1
hostnamectl set-hostname easyFetch &&
echo "[OK]" &&

#Benutzer aixconcept anlegen
echo "[INFO]Benutzer aixconcept wird angelegt..." 
adduser aixconcept &&
sudo usermod -aG sudo aixconcept &&
echo "[OK]" &&

#Aliase Anlegen
echo "[INFO]Aliase werden angelegt..."
sleep 1
runuser -l aixconcept -c "touch /home/aixconcept/.bash_aliases" &&
runuser -l aixconcept -c "echo 'alias easyFetch-update="/home/aixconcept/easyFetch/scripts/easyFetch-update.sh"' >> /home/aixconcept/.bash_aliases" &&
source /home/aixconcept/.bash_aliases
echo "[OK]" &&

#Repository Herunterladen
echo "[INFO]Repository wird heruntergeladen..."
wget https://github.com/ChilleFielmann/easyFetch/archive/refs/heads/main.tar.gz -O /home/aixconcept/repo.tar.gz &&
echo "[OK]" &&
echo "[INFO]Repository wird entpackt..."
tar -xzf /home/aixconcept/repo.tar.gz -C /home/aixconcept &&
mv /home/aixconcept/easyFetch-main /home/aixconcept/easyFetch &&
rm -f /home/aixconcept/repo.tar.gz &&
echo "[OK]" &&
echo "[INFO]Rechte werden gesetzt"
chown -R aixconcept:aixconcept /home/aixconcept/easyFetch/scripts &&
chown -R aixconcept:aixconcept /home/aixconcept/easyFetch/preps &&
chmod a+x /home/aixconcept/easyFetch/scripts/* &&
sudo chown -R aixconcept:aixconcept /home/aixconcept/easyFetch &&
echo "[OK]" &&
#Ordnerstruktur anlegen
echo "[INFO]Ordnerstruktur wird angelegt..."
sleep 1
mkdir /home/aixconcept/easyFetch/fetches &&
touch /home/aixconcept/easyFetch/info &&
echo "[OK]" &&

sleep 1

echo "[INFO]Info.txt wird beschrieben..."
sleep 1
echo "Version: $version" >> /home/aixconcept/easyFetch/info &&
echo "${standort}-${kunde}" >> /home/aixconcept/easyFetch/info &&
echo $(date +%F) >> /home/aixconcept/easyFetch/info &&
echo "[OK]" &&

#RSA-Schlüsselpaar erstellen
echo "SSH-Keys werden erstellt..."
runuser -l aixconcept -c "ssh-keygen -t rsa -b 2048 -C easyFetch" &&
echo "[OK]" &&

#Finnish
cd /home/aixconcept/easyFetch
echo "[INFO]Installation abgeschlossen!"
cat info
su aixconcept
