#! /bin/bash

#Repository herunterladen
wget https://github.com/ChilleFielmann/easyFetch/archive/refs/heads/main.tar.gz -O /home/aixconcept/easyFetch/repo.tar.gz &&

#Nur scripts und preps entpacken
tar -xzf repo.tar.gz --strip-components=1 easyFetch-main/scripts -C /home/aixconcept/easyFetch &&
tar -xzf repo.tar.gz --strip-components=1 easyFetch-main/preps -C /home/aixconcept/easyFetch &&

#Archiv löschen
rm -f /home/aixconcept/easyFetch/repo.tar.gz &&

#Finish
echo "Nice! easyFetch ist nun auf dem neusten Stand!"
