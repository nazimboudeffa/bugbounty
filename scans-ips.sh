#!/bin/bash

input_file="output.txt"       # fichier IPs en entrée
output_file="scan_results.txt"  # fichier de sortie

# Vide ou crée le fichier de sortie au début
> "$output_file"

while IFS= read -r ip; do
  if [[ -n "$ip" ]]; then
    echo "Scan de $ip avec nmap..." | tee -a "$output_file"
    nmap -sV "$ip" | tee -a "$output_file"
    echo "------------------------" | tee -a "$output_file"
  fi
done < "$input_file"
