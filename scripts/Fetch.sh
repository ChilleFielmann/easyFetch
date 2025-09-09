#!/bin/bash

target=$1
system=$2

if [ "$system" = "aos-sw" ]; then
        scp admin@$target:/cfg/running-config ~/Fetches/${target}-$(date +%F)
elif [ "$system" = "opnsense" ]; then
        scp admin@$target:/conf/config.xml ~/Fetches/${target}-$(date +%F)
else
        echo "Ungültige Parameter!"
fi
