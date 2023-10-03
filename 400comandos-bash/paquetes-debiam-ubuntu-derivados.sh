#!/bin/bash

# Definimos dos arrays: uno para las opciones y otro para los comandos correspondientes.
opciones=(
    "Mostrar archivos del directorio actual:|ls"
    "Mostrar calendario:|cal"
    "Mostrar día de hoy:|date"
    "Instalar/Actualizar un paquete Deb:|dpkg -i package.deb"
    "Eliminar un paquete Deb:|dpkg -r package_name"
    "Mostrar todos los paquetes Deb instalados:|dpkg -l"
    "Mostrar paquetes Deb con nombre 'httpd':|dpkg -l | grep httpd"
    "Obtener información sobre un paquete Deb instalado:|dpkg -s package_name"
    "Mostrar lista de archivos de un paquete Deb instalado:|dpkg -L package_name"
    "Mostrar lista de archivos de un paquete Deb no instalado:|dpkg --contents package.deb"
    "Verificar a qué paquete Deb pertenece un archivo específico:|dpkg -S /bin/ping"
    "Listar paquetes instalados de openjdk:|dpkg --get-selections | less | grep openjdk"
    "Listar versiones instaladas de PHP:|dpkg -l | grep php"
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
