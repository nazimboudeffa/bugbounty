#!/bin/bash

# Fichier contenant les sous-domaines actifs (format: https://sub.domain.com)
INPUT_FILE="alive.txt"
OUTPUT_DIR="masscan_results"

# Port range à scanner (modifiable)
PORT_RANGE="1-65535"
RATE="1000"  # Peut être augmenté (ex: 10000) si tu veux aller plus vite

# Crée le dossier de sortie
mkdir -p "$OUTPUT_DIR"

echo "[*] Lancement de Masscan sur les sous-domaines actifs..."

while read -r url; do
    # Extraction du hostname sans protocole
    domain=$(echo "$url" | sed -e 's~http[s]*://~~' -e 's~/.*~~')
    
    # Résolution DNS vers IP
    ip=$(dig +short "$domain" | head -n 1)

    if [[ -z "$ip" ]]; then
        echo "[-] Impossible de résoudre $domain, on passe."
        continue
    fi

    echo "[+] Scan de $domain ($ip)"

    # Lancement du scan masscan
    sudo masscan -p$PORT_RANGE $ip --rate=$RATE -oG "$OUTPUT_DIR/$domain.gnmap"

done < "$INPUT_FILE"

echo "[✓] Tous les scans masscan sont terminés. Résultats dans $OUTPUT_DIR/"
