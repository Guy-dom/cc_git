#!/bin/bash
# Script de scan de ports avec Bash (TCP)

IP=$1
PORTS=$2

if [[ -z "$IP" || -z "$PORTS" ]]; then
  echo "Usage : $0 <IP> \"<port1 port2 port3>\""
  exit 1
fi

for PORT in $PORTS; do
  (echo > /dev/tcp/$IP/$PORT) >/dev/null 2>&1 && \
    echo "✅ Port $PORT est OUVERT sur $IP" || \
    echo "❌ Port $PORT est FERMÉ sur $IP"
done
