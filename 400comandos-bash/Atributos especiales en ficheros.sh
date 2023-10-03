#!/bin/bash

# Definimos dos arrays: uno para las opciones y otro para los comandos correspondientes.
opciones=(
    "Mostrar archivos del directorio actual"
    "Mostrar calendario"
    "Mostrar día de hoy"
    "Permitir escritura solo en modo append (chattr +a file1)"
    "Permitir compresión/descompresión automática (chattr +c file1)"
    "Asegurar que los archivos no se borren durante copias de seguridad (chattr +d file1)"
    "Hacer que el archivo sea invariable (chattr +i file1)"
    "Permitir el borrado seguro del archivo (chattr +s file1)"
    "Hacer que los cambios se escriban de forma síncrona (chattr +S file1)"
    "Recuperar contenido de un archivo cancelado (chattr +u file1)"
    "Mostrar atributos especiales de archivos (lsattr)"
    "Salir"
)

comandos=(
    "ls"
    "cal"
    "date"
    "chattr +a file1"
    "chattr +c file1"
    "chattr +d file1"
    "chattr +i file1"
    "chattr +s file1"
    "chattr +S file1"
    "chattr +u file1"
    "lsattr"
    "exit 0"
)

while true; do
    clear
    echo "MENU SCRIPT V.1"
    echo "==============================="
    echo "Escoja una opción:"
    for ((i=0; i<${#opciones[@]}; i++)); do
        echo "$i. ${opciones[i]}"
    done
    echo "==============================="
    read -p "Ingrese el número de la opción: " opcion

    if [[ $opcion =~ ^[0-9]+$ ]] && [ "$opcion" -ge 0 ] && [ "$opcion" -lt ${#opciones[@]} ]; then
        clear
        seleccion="${comandos[$opcion]}"
        echo "Ejecutando: $seleccion"
        eval "$seleccion"
        read -p "Presione Enter para continuar..."
    else
        echo "Opción inválida. Presione Enter para continuar..."
        read -p "Presione Enter para"
    fi
done
