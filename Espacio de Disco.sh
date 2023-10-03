#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar archivos del directorio actual:|ls"
    "Mostrar calendario:|cal"
    "Mostrar dia de hoy:|date"
    "Listar el peso de los directorios y archivos (du -smh *):|du -smh *"
    "Ordenar el peso de los directorios y archivos (du -smh * | sort -h):|du -smh * | sort -h"
    "Mostrar una lista de las particiones montadas (df -h):|df -h"
    "Obtener los directorios o carpetas que pesan más (du -smh * | sort -nr):|du -smh * | sort -nr"
    "Mostrar el tamaño de los ficheros y directorios ordenados por tamaño (ls -lSr | more):|ls -lSr | more"
    "Mostrar el tamaño de los ficheros y directorios ordenados por tamaño (ls -lhasSr):|ls -lhasSr"
    "Lista los directorios de archivos de forma ordenada y en columnas (ls -lhasX):|ls -lhasX"
    "Estimar el espacio usado por el directorio 'dir1' (du -sh dir1):|du -sh dir1"
    "Mostrar el tamaño de los ficheros y directorios ordenados por tamaño (du -sk * | sort -rn):|du -sk * | sort -rn"
    "Mostrar el espacio usado por los paquetes RPM instalados organizados por tamaño (Fedora, Redhat y otros) (rpm -q -a --qf '%10{SIZE}t%{NAME}n' | sort -k1,1n):|rpm -q -a --qf '%10{SIZE}t%{NAME}n' | sort -k1,1n"
    "Mostrar el espacio usado por los paquetes instalados organizados por tamaño (Ubuntu, Debian y otros) (dpkg-query -W -f='${Installed-Size;10}t${Package}n' | sort -k1,1n):|dpkg-query -W -f='${Installed-Size;10}t${Package}n' | sort -k1,1n"
    "Mostrar el tamaño de un fichero o directorio en bytes (du -bsh /fichero_o_carpeta):|du -bsh /fichero_o_carpeta"

    "Salir:|exit 0"
)

while true; do
    clear
    echo "MENU SCRIPT V.1"
    echo "==============================="
    echo "Escoja una opción:"
    for ((i = 0; i < ${#opciones[@]}; i++)); do
        echo "$i. ${opciones[i]%%:*}" # Imprimimos el índice y el nombre de la opción (sin el comando).
    done
    echo "==============================="
    read -p "Ingrese el número de la opción: " opcion

    if [[ $opcion =~ ^[0-9]+$ ]] && [ "$opcion" -ge 0 ] && [ "$opcion" -lt ${#opciones[@]} ]; then
        clear
        seleccion="${opciones[$opcion]#*|}" # Obtenemos el comando correspondiente a la opción seleccionada.
        eval "$seleccion"                   # Ejecutamos el comando.
        read -p "Presione Enter para continuar..."
    else
        echo "Opción inválida. Presione Enter para continuar..."
        read -p "Presione Enter para"
    fi
done
