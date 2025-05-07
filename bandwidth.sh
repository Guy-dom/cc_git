#!/bin/bash

log_bandwidth() {
    echo "Mesure de la bande passante en cours..."

    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    speed=$(speedtest-cli --simple | grep 'Download' | awk '{print $2, $3}')

    echo "$timestamp - Download speed: $speed" >> bandwidth_log.txt
}
