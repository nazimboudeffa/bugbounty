#!/bin/bash

INPUT_FILE="alive.txt"
OUTPUT_DIR="masscan_results"
PORT_RANGE="1-65535"
RATE="1000"

mkdir -p "$OUTPUT_DIR"

echo "[*] Lancement de Masscan sur les sous-domaines actifs..."

while read -r url; do
    # Nettoyer l’URL pour extraire uniquement le domaine
    domain=$(echo "$url" | sed -e 's~http[s]*://~~' -e 's~/.*~~')

    # Résoudre l’IP (IPv4 uniquement)
    ip=$(dig +short A "$domain" | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' | head -n 1)

    if [[ -z "$ip" ]]; then
        echo "[-] Impossible de résoudre $domain, on passe."
        continue
    fi

    echo "[+] Scan de $domain ($ip)"

    # Exécuter masscan
    sudo masscan -p$PORT_RANGE $ip --rate=$RATE -oG "$OUTPUT_DIR/$domain.gnmap"

done < "$INPUT_FILE"

echo "[✓] Tous les scans Masscan sont terminés. Résultats dans $OUTPUT_DIR/"
