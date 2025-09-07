len#! /bin/bash

#Altes Repository löschen
rm -r /home/aixconcept/easyFetch

#Repository herunterladen
sudo -u aixconcept wget https://github.com/ChilleFielmann/easyFetch/archive/refs/heads/main.tar.gz -O /home/aixconcept/repo.tar.gz
sudo -u aixconcept tar -xzf /home/aixconcept/repo.tar.gz -C /home/aixconcept
rm -f /home/aixconcept/repo.tar.gz
mv /home/aixconcept/easyFetch-main /home/aixconcept/easyFetch
chmod u+x /home/aixconcept/easyFetch/scripts/*
