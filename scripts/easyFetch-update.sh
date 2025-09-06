#! /bin/bash

#Repository herunterladen
wget https://github.com/ChilleFielmann/easyFetch/archive/refs/heads/main.tar.gz -O /home/aixconcept/easyFetch/repo.tar.gz &&

#Nur scripts und preps entpacken
tar -xzf repo.tar.gz easyFetch-main/scripts/ /home/aixconcept/easyFetch/scripts &&
tar -xzf repo.tar.gz easyFetch-main/preps/ /home/aixconcept/easyFetch/preps &&

#Archiv löschen
rm -f /home/aixconcept/easyFetch/repo.tar.gz &&

#Finish
echo "Nice! easyFetch ist nun auf dem neusten Stand!"
