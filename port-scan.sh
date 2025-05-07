#!/bin/bash
# Script de scan de ports TCP avec Bash

IP=$1
PORTS=$2

# Vérification des arguments
if [[ -z "$IP" || -z "$PORTS" ]]; then
  echo "Usage : $0 <IP> \"<port1 port2 port3>\""
  exit 1
fi

# Couleurs (optionnel)
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Scan de ports
IFS=' ' read -r -a PORT_ARRAY <<< "$PORTS"
for PORT in "${PORT_ARRAY[@]}"; do
  (echo > /dev/tcp/$IP/$PORT) >/dev/null 2>&1
  if [[ $? -eq 0 ]]; then
    echo -e "${GREEN}✅ Port $PORT est OUVERT sur $IP${NC}"
  else
    echo -e "${RED}❌ Port $PORT est FERMÉ sur $IP${NC}"
  fi
done

