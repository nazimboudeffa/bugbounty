import re

input_file = "input.txt"    # Fichier source
output_file = "output.txt"  # Fichier résultat

seen = set()
unique_ips = []

with open(input_file, "r") as file:
    for line in file:
        match = re.search(r'\[(.*?)\]', line)
        if match:
            ip = match.group(1)
            if ip not in seen:
                seen.add(ip)
                unique_ips.append(ip)

with open(output_file, "w") as file:
    for ip in unique_ips:
        file.write(ip + "\n")
