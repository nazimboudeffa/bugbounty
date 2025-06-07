# RECON

Phase de Recon en se disant qu'on va avoir des vecteurs d'attaque comme sur les première machines HackTheBox

## Lister les sous domaines

Comment installer subfinder sur Parrot OS https://www.youtube.com/watch?v=sW6YLkAVU0o

`$subfinder -d domain.com -o domain-subfinder.txt`

## Nombre de sous domaines

`$cat domain-subfinder.txt | wc`

## Lister les domaines actifs

`$httpx -l domain-subfinder.txt -o domain-httpx.txt`

## Nombre de sous domaines actifs

`$cat domain-httpx.txt | wc`

## Resoudre les IPs des sous domaines

`$httpx -l dailymotion-httpx.txt -ip -o dailymotion-ip-resolved.txt`

## Filtrer les IPs

Voir le script Python dans ce repo

`$python filter-ip.py`

## Scan nmap sur une liste d'IPs

Voir le script BASH dans ce repo

`$chmod +x nmap_scan.sh`

`$./nmap_scan.sh`
