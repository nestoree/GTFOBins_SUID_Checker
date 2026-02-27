# GTFOBins SUID Checker

Script en Bash que permite:

- 🔎 Buscar binarios con bit **SUID**
- 📋 Mostrar solo el nombre del binario
- 🌐 Consultar automáticamente GTFOBins
- 💻 Mostrar en la terminal los comandos explotables

⚠️ Uso educativo / CTF / laboratorio únicamente. No usar en sistemas sin permiso.

---

## Características

- Enumeración automática de binarios SUID
- Lista numerada e interactiva
- Extracción de comandos explotables directamente del HTML de GTFOBins
- Todo mostrado en terminal, sin navegador

---

## Instalación

```
git clone https://github.com/nestoree/GTFOBins_SUID_Checker
cd GTFOBins_SUID_Checker
chmod +x gtfobins.sh
```

---

## Uso

```
./gtfobins.sh
```

Ejemplo de ejecución:

```
[+] Binarios SUID encontrados:
1) mount
2) passwd
3) sudo

¿Cuál quieres revisar? (nombre o número): 3
```

Salida esperada:

```
[+] Técnicas encontradas:
-----------------------------------
sudo /bin/sh
-----------------------------------
```

---

## Requisitos

- grep
- curl

```
sudo apt install curl grep coreutils
```

---

## Cómo funciona

- Ejecuta **find** para localizar binarios SUID
- Extrae el nombre final con **awk**
- Permite seleccionar un binario
- Descarga la página correspondiente en GTFOBins
- Extrae los comandos explotables de '<pre><code>...</code></pre>'
- Muestra el resultado en la terminal

---

## Disclaimer

Desarrollado para investigación, CTFs y prácticas de seguridad ofensiva en Linux

---

## Licencia

MIT License
