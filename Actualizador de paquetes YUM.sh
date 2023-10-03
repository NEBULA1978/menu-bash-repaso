#!/bin/bash

# Definimos dos arrays: uno para las opciones y otro para los comandos correspondientes.
opciones=(
    "Mostrar archivos del directorio actual:|ls"
    "Mostrar calendario:|cal"
    "Mostrar día de hoy:|date"

    "Instalar un paquete YUM:|yum install package_name"
    "Instalar un paquete RPM con resolución de dependencias:|yum localinstall package_name.rpm"
    "Actualizar todos los paquetes RPM instalados:|yum update"
    "Actualizar un paquete RPM específico:|yum update package_name"
    "Eliminar un paquete RPM con YUM:|yum remove package_name"
    "Listar todos los paquetes RPM instalados con YUM:|yum list"
    "Buscar un paquete RPM en repositorio con YUM:|yum search package_name"
    "Limpiar caché de paquetes descargados con YUM:|yum clean packages"
    "Limpiar caché de encabezados de paquetes con YUM:|yum clean headers"
    "Limpiar completamente el caché de YUM:|yum clean all"
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
