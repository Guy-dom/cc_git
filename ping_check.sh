#!/bin/bash

# Adresse IP de la passerelle (par défaut souvent 192.168.1.1 ou 192.168.0.1)
GATEWAY="192.168.1.1"

check_ping() {
    echo "Vérification de la connexion à la passerelle $GATEWAY..."
    
    if ping -c 3 $GATEWAY > /dev/null 2>&1; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Passerelle $GATEWAY joignable." >> ping_log.txt
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Passerelle $GATEWAY injoignable !" >> ping_log.txt
    fi
}

check_ping

