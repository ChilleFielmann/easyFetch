#! /bin/bash

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
apt update
apt -y upgrade 

#Packete installieren
apt install -y tldr
apt install -y ipcalc
apt install -y nmap
apt install -y openvpn
snap install yq

#Maschine umbenennen
hostnamectl set-hostname easyFetch

#Benutzer aixconcept anlegen
adduser aixconcept
sudo usermod -aG sudo aixconcept

#Aliase Anlegen
runuser -l aixconcept -c "touch /home/aixconcept/.bash_aliases"
runuser -l aixconcept -c "echo 'alias easyFetch-update="/home/aixconcept/easyFetch/scripts/easyFetch-update.sh"' >> /home/aixconcept/.bash_aliases"
chmod u+x /home/aixconcept/easyFetch/scripts/easyFetch-update.sh
source /home/aixconcept/.bash_aliases

#Repository Herunterladen
wget https://github.com/ChilleFielmann/easyFetch/archive/refs/heads/main.tar.gz -O /home/aixconcept/repo.tar.gz
tar -xzf /home/aixconcept/repo.tar.gz -C /home/aixconcept
mv /home/aixconcept/easyFetch-main /home/aixconcept/easyFetch
rm -f /home/aixconcept/repo.tar.gz

#Ordnerstruktur anlegen
mkdir /home/aixconcept/easyFetch/fetches
touch /home/aixconcept/easyFetch/info
echo "Version: $version" >> /home/aixconcept/easyFetch/info
echo "${standort}-${kunde}" >> /home/aixconcept/easyFetch/info
echo $(date +%F) >> /home/aixconcept/easyFetch/info 

#RSA-Schlüsselpaar erstellen
runuser -l aixconcept -c "ssh-keygen -t rsa -b 2048 -C easyFetch"

#Finnish
cd /home/aixconcept/easyFetch
echo "Installation abgeschlossen!"
cat info
su aixconcept
