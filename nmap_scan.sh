#!/bin/bash

# Vérification des arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 fichier_ip.txt"
    exit 1
fi

IP_FILE="$1"

# Vérifie si le fichier existe
if [ ! -f "$IP_FILE" ]; then
    echo "Fichier non trouvé : $IP_FILE"
    exit 2
fi

# Dossier pour les résultats
OUTPUT_DIR="nmap_results"
mkdir -p "$OUTPUT_DIR"

# Lecture et scan de chaque IP
while IFS= read -r ip; do
    if [[ -n "$ip" ]]; then
        echo "Scan de $ip en cours..."
        nmap -sC -oN "$OUTPUT_DIR/${ip//\//_}.txt" "$ip"
    fi
done < "$IP_FILE"

echo "Tous les scans sont terminés. Résultats dans le dossier $OUTPUT_DIR"
