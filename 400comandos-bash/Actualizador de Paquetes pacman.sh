#!/bin/bash

opciones=(
    "Instalar un paquete (pacman -S <paquete>):|pacman -S <paquete>"
    "Sincronizar repositorios e instalar un paquete (pacman -Sy <paquete>):|pacman -Sy <paquete>"
    "Instalar paquetes desde el repositorio AUR (yaourt -S <paquete>):|yaourt -S <paquete>"
    "Actualizar todos los paquetes del sistema (pacman -Syu):|pacman -Syu"
    "Actualizar solo la base de datos de paquetes (pacman -Sy):|pacman -Sy"
    "Buscar información sobre un paquete (pacman -Si <paquete>):|pacman -Si <paquete>"
    "Buscar paquetes que contienen un archivo (pacman -Qo <archivo>):|pacman -Qo <archivo>"
    "Mostrar los paquetes instalados (pacman -Q):|pacman -Q"
    "Buscar paquetes que no están en grupos (pacman -Qg):|pacman -Qg"
    "Mostrar los archivos pertenecientes a un paquete (pacman -Ql <paquete>):|pacman -Ql <paquete>"
    "Buscar dependencias de un paquete (pactree <paquete>):|pactree <paquete>"
    "Eliminar un paquete y sus dependencias no utilizadas (pacman -Rns <paquete>):|pacman -Rns <paquete>"
    "Salir:|exit 0"
)

while true; do
    clear
    echo "ACTUALIZADOR DE PAQUETES PACMAN (Arch y derivados)"
    echo "=================================================="
    echo "Escoja una opción:"
    for ((i=0; i<${#opciones[@]}; i++)); do
        echo "$i. ${opciones[i]%%:*}" # Imprimimos el índice y el nombre de la opción (sin el comando).
    done
    echo "=================================================="
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
