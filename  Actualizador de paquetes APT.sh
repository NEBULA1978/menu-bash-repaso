#!/bin/bash

opciones=(
    "Mostrar la versión disponible para un paquete (apt-show-versions):|apt-show-versions"
    "Mostrar la versión disponible para un paquete (apt-cache policy):|apt-cache policy"
    "Mostrar las versiones disponibles para un paquete (aptitude versions):|aptitude versions"
    "Ver todas las actualizaciones posibles (apt-get -V -s upgrade):|apt-get -V -s upgrade"
    "Ver actualizaciones disponibles para un paquete (apt-get -V -s install <package>):|apt-get -V -s install <package>"
    "Ver actualizaciones disponibles para un paquete (aptitude -V -s install <package>):|aptitude -V -s install <package>"
    "Instalar/actualizar un paquete deb (apt-get install package_name):|apt-get install package_name"
    "Instalar/actualizar un paquete deb desde un cdrom (apt-cdrom install package_name):|apt-cdrom install package_name"
    "Actualizar la lista de paquetes (apt-get update):|apt-get update"
    "Actualizar todos los paquetes instalados (apt-get upgrade):|apt-get upgrade"
    "Eliminar un paquete deb del sistema (apt-get remove package_name):|apt-get remove package_name"
    "Verificar la correcta resolución de las dependencias (apt-get check):|apt-get check"
    "Limpiar caché de paquetes descargados (apt-get clean):|apt-get clean"
    "Buscar paquetes que corresponden a una serie de 'paquetes buscados' (apt-cache search searched-package):|apt-cache search searched-package"
    "Ver los archivos que se instalaron de un paquete o programa (dpkg -L package_name):|dpkg -L package_name"
    "Actualizar un paquete en específico (sudo apt-get upgrade <package_name>):|sudo apt-get upgrade <package_name>"
    "Actualizar todos los paquetes excepto uno (sudo apt-get install <package_name> --no-upgrade):|sudo apt-get install <package_name> --no-upgrade"
    "Actualizar un solo paquete en concreto (sudo apt-get install <package_name> --only-upgrade):|sudo apt-get install <package_name> --only-upgrade"
    "Instalar una versión específica de un paquete (sudo apt-get install <package_name>=<version_number>):|sudo apt-get install <package_name>=<version_number>"
    "Eliminar un paquete y sus dependencias no utilizadas (sudo apt-get purge --auto-remove <package_name>):|sudo apt-get purge --auto-remove <package_name>"
    "Salir:|exit 0"
)

while true; do
    clear
    echo "ACTUALIZADOR DE PAQUETES APT"
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
