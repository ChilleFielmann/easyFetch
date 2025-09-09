#!/bin/bash

#Variablen
user=""

#Maschine umbenennen
hostnamectl set-hostname easyFetch

#Benutzer mit sudo rechten und bash-shell anlegen
echo -n "Benutzername:"
read user
useradd -m ${user}
echo "Passwort für Benutzer: ${user}"
passwd ${user}
usermod -aG sudo ${user}
chsh -s /bin/bash ${user}

#Packete upgraden
apt update
apt -y upgrade

#Repository Herunterladen
sudo -u ${user} wget https://github.com/ChilleFielmann/easyFetch/archive/refs/heads/main.tar.gz -O /home/${user}/repo.tar.gz
sudo -u ${user} tar -xzf /home/${user}/repo.tar.gz -C /home/${user}
rm -f /home/${user}/repo.tar.gz
mv /home/${user}/easyFetch-main /home/${user}/easyFetch
chmod u+x /home/${user}/easyFetch/scripts/*

#Pakete installieren
apt install -y nmap 
apt install -y openvpn 
snap install yq 

#Update-Befehl erstellen
sudo mv /home/${user}/easyFetch/scripts/easyFetch-update.sh /usr/local/bin/easyFetch-update

#RSA-Schlüsselpaar erstellen
sudo -u ${user} ssh-keygen -t rsa -b 2048 -f /home/${user}/.ssh/is_rsa -N '' -q -C easyFetch

#RSA aktivieren
echo "HostkeyAlgorithms +ssh-rsa" >> /etc/ssh/ssh_config
echo "PubkeyAcceptedAlgorithms +ssh-rsa" >> /etc/ssh/ssh_config


#Finnish
su - ${user}

