#!/bin/bash

#Packete upgraden
apt update
apt -y upgrade

#Pakete installieren
apt install -y tldr 
apt install -y ipcalc 
apt install -y nmap 
apt install -y openvpn 
snap install yq 

#Maschine umbenennen
hostnamectl set-hostname easyFetch &&

#Benutzer aixconcept anlegen
adduser --gecos "" --disabled-password aixconcept
echo "aixconcept:#23456" | chpasswd &&
sudo usermod -aG sudo aixconcept &&

#Aliase Anlegen
runuser -l aixconcept -c "touch /home/aixconcept/.bash_aliases"  &&
runuser -l aixconcept -c "echo 'alias easyFetch-update="/home/aixconcept/easyFetch/scripts/easyFetch-update.sh"' >> /home/aixconcept/.bash_aliases"  &&
source /home/aixconcept/.bash_aliases

#Repository Herunterladen
wget https://github.com/ChilleFielmann/easyFetch/archive/refs/heads/main.tar.gz -O /home/aixconcept/repo.tar.gz  &&
tar -xzf /home/aixconcept/repo.tar.gz -C /home/aixconcept &&
mv /home/aixconcept/easyFetch-main /home/aixconcept/easyFetch &&
rm -f /home/aixconcept/repo.tar.gz &&
chown -R aixconcept:aixconcept /home/aixconcept/easyFetch/scripts &&
chown -R aixconcept:aixconcept /home/aixconcept/easyFetch/preps &&
chmod a+x /home/aixconcept/easyFetch/scripts/* &&
sudo chown -R aixconcept:aixconcept /home/aixconcept/easyFetch &&

#Ordnerstruktur anlegen
mkdir /home/aixconcept/easyFetch/fetches &&
touch /home/aixconcept/easyFetch/info &&


#RSA-Schlüsselpaar erstellen
runuser -l aixconcept -c "ssh-keygen -t rsa -b 2048 -f /home/aixconcept/.ssh/is_rsa -N -q -C easyFetch"

#Finnish
cd /home/aixconcept/easyFetch
su aixconcept
