#!/bin/bash

#Maschine umbenennen
hostnamectl set-hostname easyFetch &&

#Benutzer aixconcept mit sudo rechten und bash-shell
useradd -m aixconcept
echo "Passwort für Benutzer: aixconcept"
passwd aixconcept
usermod -aG sudo aixconcept
chsh -s /bin/bash aixconcept

#Packete upgraden
apt update
apt -y upgrade

#Repository Herunterladen
sudo -u aixconcept wget https://github.com/ChilleFielmann/easyFetch/archive/refs/heads/main.tar.gz -O /home/aixconcept/repo.tar.gz
sudo -u aixconcept tar -xzf /home/aixconcept/repo.tar.gz -C /home/aixconcept
sudo -u aixconcept mv /home/aixconcept/easyFetch-main /home/aixconcept/easyFetch
sudo -u aixconcept rm -f /home/aixconcept/repo.tar.gz
chmod u+x /home/aixconcept/easyFetch/scripts/*

#Pakete installieren
apt install -y tldr 
apt install -y ipcalc 
apt install -y nmap 
apt install -y openvpn 
snap install yq 

#Aliase Anlegen
runuser -l aixconcept -c "touch /home/aixconcept/.bash_aliases"  &&
runuser -l aixconcept -c "echo 'alias easyFetch-update="/home/aixconcept/easyFetch/scripts/easyFetch-update.sh"' >> /home/aixconcept/.bash_aliases"  &&
source /home/aixconcept/.bash_aliases


#Ordnerstruktur anlegen
mkdir /home/aixconcept/easyFetch/fetches &&
touch /home/aixconcept/easyFetch/info &&


#RSA-Schlüsselpaar erstellen
runuser -l aixconcept -c "ssh-keygen -t rsa -b 2048 -f /home/aixconcept/.ssh/is_rsa -N '' -q -C easyFetch"

#RSA aktivieren
echo "HostkeyAlgorithms +ssh-rsa" >> /etc/ssh/ssh_config &&
echo "PubkeyAcceptedAlgorithms +ssh-rsa" >> /etc/ssh/ssh_config &&


#Finnish
cd /home/aixconcept/easyFetch
su - aixconcept

