#!/bin/bash

# Lee el contenido del archivo "texto1.txt" y lo almacena en un arreglo de opciones.
mapfile -t texto_opciones < texto1.txt

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes
# separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar archivos del directorio actual:|ls"
    "Mostrar calendario:|cal"
    "Mostrar día de hoy:|date"
    "Ver wifi conectado en linux mint:|nmcli device wifi list"
    "Salir:|exit 0"
)

# Calculamos el número de línea inicial para las opciones adicionales.
numero_linea_inicial=$(( ${#opciones[@]} ))

# Agregamos las opciones del archivo "texto1.txt" al arreglo de opciones del menú.
for ((i=0; i<${#texto_opciones[@]}; i++)); do
    numero_linea=$(( numero_linea_inicial + i ))
    opciones+=("$numero_linea. ${texto_opciones[i]}") # Agregamos el número de línea.
done

while true; do
    clear
    echo "MENU SCRIPT V.1"
    echo "==============================="
    echo "Escoja una opción:"
    for ((i=0; i<${#opciones[@]}; i++)); do
        echo "${opciones[i]%%:*}" # Imprimimos el nombre de la opción (sin el comando).
    done
    echo "==============================="
    read -p "Ingrese el número de la opción: " opcion

    if [[ $opcion =~ ^[0-9]+$ ]] && [ "$opcion" -ge 0 ] && [ "$opcion" -lt ${#opciones[@]} ]; then
        clear
        seleccion="${opciones[$opcion]#*|}" # Obtenemos el comando correspondiente a la opción seleccionada.
        eval "$seleccion" # Ejecutamos el comando.
        read -p "Presione Enter para continuar..."
    else
        echo "Opción inválida. Presione Enter para continuar..."
        read -p "Presione Enter para"
    fi
done
