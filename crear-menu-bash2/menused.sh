#!/bin/bash

# Obtenemos la línea 3 del archivo texto1.txt
linea_texto=$(sed -n '3p' texto1.txt)

# Extraemos el título de la línea
titulo=$(echo "$linea_texto" | cut -d' ' -f1)

# Insertamos la línea en el archivo menu.sh
sed -i '11i "Analizar el sistema de ficheros: $titulo"' menu.sh

# prueba