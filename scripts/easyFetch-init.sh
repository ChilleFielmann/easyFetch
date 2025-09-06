#! /bin/bash

#Variablen
version="1.0"
kunde=""
standort=""
updateserver="172.104.236.214" 

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
snap install yq

#Maschine umbenennen
hostnamectl set-hostname easyFetch

#Benutzer aixconcept anlegen
adduser aixconcept
sudo usermod -aG sudo aixconcept

#Ordnerstruktur anlegen
sftp -r install@$updateserver:/home/install/easyFetch /home/aixconcept/easyFetch 
mkdir /home/aixconcept/easyFetch/fetches
touch /home/aixconcept/easyFetch/info
echo Version: $version >> /home/aixconcept/easyFetch/info
echo ${standort}-${kunde} >> /home/aixconcept/easyFetch/info
echo $(date +%F) >> /home/aixconcept/easyFetch/info 

#RSA-Schlüsselpaar erstellen
runuser -l aixconcept -c "ssh-keygen -t rsa -b 2048 -C easyFetch"

echo "Installation Beendet!"
cd /home/aixconcept/
su aixconcept
