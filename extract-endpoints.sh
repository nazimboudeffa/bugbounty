#!/bin/bash

# Vérification du fichier en argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <fichier_liste_ffuf.txt>"
    exit 1
fi

INPUT_FILE="$1"

# Vérifie que le fichier existe
if [ ! -f "$INPUT_FILE" ]; then
    echo "Le fichier '$INPUT_FILE' n'existe pas."
    exit 1
fi

# Extraction des premiers mots de chaque ligne (les endpoints)
echo "Endpoints extraits depuis : $INPUT_FILE"
awk '{print $1}' "$INPUT_FILE"
