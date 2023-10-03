#!/bin/bash

# Definimos dos arrays: uno para las opciones y otro para los comandos correspondientes.
opciones=(
    "Mostrar archivos del directorio actual:|ls"
    "Mostrar calendario:|cal"
    "Mostrar día de hoy:|date"
    "Comprimir fichero en formato gzip (gzip):|gzip file1"
    "Descomprimir fichero gzip (gzip -d):|gzip -d file1.gz"
    "Comprimir fichero en formato bzip2 (bzip2):|bzip2 file1"
    "Descomprimir fichero bzip2 (bzip2 -d):|bzip2 -d file1.bz2"
    "Crear archivo tar (tar -cvf):|tar -cvf archive.tar file1"
    "Descomprimir archivo tar (tar -xvf):|tar -xvf archive.tar"
    "Comprimir archivo tar en gzip (tar -cvfz):|tar -cvfz archive.tar.gz file1"
    "Descomprimir archivo tar.gz (tar -xzvf):|tar -xzvf archive.tar.gz"
    "Comprimir archivo tar en bzip2 (tar -c ficheros | bzip2 > archivo.tar.bz2):|tar -c ficheros | bzip2 > archivo.tar.bz2"
    "Descomprimir archivo tar.bz2 (bzip2 -dc archivo.tar.bz2 | tar -xv):|bzip2 -dc archivo.tar.bz2 | tar -xv"
    "Comprimir archivo en formato zip (zip):|zip file1.zip file1"
    "Descomprimir archivo zip (unzip):|unzip file1.zip"
    "Salir:|exit 0"
)

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
