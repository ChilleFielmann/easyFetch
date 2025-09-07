len#! /bin/bash

#Repository herunterladen
sudo wget https://github.com/ChilleFielmann/easyFetch/archive/refs/heads/main.tar.gz -O /home/aixconcept/easyFetch/repo.tar.gz &&

#Alte Pakete entfernen
rm -r /home/aixconcept/easyFetch/scripts
rm -r /home/aixconcept/easyFetch/preps

#Nur scripts und preps entpacken
tar -xzf /home/aixconcept/easyFetch/repo.tar.gz --strip-components=1 easyFetch-main/easyFetch/scripts
tar -xzf /home/aixconcept/easyFetch/repo.tar.gz --strip-components=1 easyFetch-main/easyFetch/preps 

#Archiv löschen
rm -f /home/aixconcept/easyFetch/repo.tar.gz

#Rechte wieder herstellen
sudo chown -R aixconcept:aixconcept /home/aixconcept/easyFetch
sudo chmod -R u+rwx /home/aixconcept/easyFetch
