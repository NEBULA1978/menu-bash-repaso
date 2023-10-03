#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar archivos del directorio actual:|ls"
    "Mostrar calendario:|cal"
    "Mostrar día de hoy:|date"
    "Ver wifi conectado en Linux Mint:|nmcli device wifi list"
"convertir un formato de fichero texto desde MSDOS a UNIX: | dos2unix filedos.txt fileunix.txt" 
"convertir un fichero de texto en html: | recode ..HTML < page.txt > page.html"
"mostrar todas las conversiones de formato disponibles: | recode -l | more"
    
    "Salir:|exit 0"
)

# Agrega las opciones desde texto1.txt
while IFS= read -r linea; do
    opciones+=("$linea")
done < texto1.txt

while true; do
    clear
    echo "MENU SCRIPT V.1"
    echo "==============================="
    echo "Escoja una opción:"
    for ((i=0; i<${#opciones[@]}; i++)); do
        echo "$i. ${opciones[i]%%:*}" # Imprimimos el índice y el nombre de la opción (sin el comando).
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
