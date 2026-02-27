#!/bin/bash

echo "[+] Buscando binarios SUID..."
mapfile -t bins < <(find / -perm -4000 2>/dev/null | awk -F/ '{print $NF}' | sort -u)

if [ ${#bins[@]} -eq 0 ]; then
    echo "[-] No se encontraron binarios SUID."
    exit 1
fi

echo
echo "[+] Binarios SUID encontrados:"
for i in "${!bins[@]}"; do
    echo "$((i+1))) ${bins[$i]}"
done

echo
read -p "¿Cuál quieres revisar? (nombre o número): " choice

if [[ "$choice" =~ ^[0-9]+$ ]]; then
    index=$((choice-1))
    if [ $index -ge 0 ] && [ $index -lt ${#bins[@]} ]; then
        binary="${bins[$index]}"
    else
        echo "[-] Opción inválida."
        exit 1
    fi
else
    binary="$choice"
fi

url="https://gtfobins.org/gtfobins/$binary/"

echo
echo "[+] Consultando GTFOBins para: $binary"
echo

page=$(curl -s "$url")

# Verificar si existe
if echo "$page" | grep -q "GTFOBins"; then
    exploits=$(echo "$page" | grep -oP '(?<=<pre><code>).*?(?=</code></pre>)')

    if [ -z "$exploits" ]; then
        echo "[-] No se encontraron técnicas explotables."
        exit 0
    fi

    echo "[+] Técnicas encontradas:"
    echo "-----------------------------------"
    echo "$exploits"
    echo "-----------------------------------"
else
    echo "[-] No existe entrada para $binary en GTFOBins."
fi
