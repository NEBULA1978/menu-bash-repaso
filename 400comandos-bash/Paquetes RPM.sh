#!/bin/bash

# Definimos dos arrays: uno para las opciones y otro para los comandos correspondientes.
opciones=(
    "Mostrar archivos del directorio actual:|ls"
    "Mostrar calendario:|cal"
    "Mostrar día de hoy:|date"
    "Instalar un paquete RPM:|rpm -ivh package.rpm"
    "Instalar un paquete RPM ignorando dependencias:|rpm -ivh --nodeeps package.rpm"
    "Actualizar un paquete RPM:|rpm -U package.rpm"
    "Actualizar un paquete RPM solo si está instalado:|rpm -F package.rpm"
    "Eliminar un paquete RPM:|rpm -e package_name.rpm"
    "Mostrar todos los paquetes RPM instalados:|rpm -qa"
    "Mostrar paquetes RPM con nombre 'httpd':|rpm -qa | grep httpd"
    "Obtener información sobre un paquete RPM instalado:|rpm -qi package_name"
    "Mostrar paquetes RPM de un grupo de software específico:|rpm -qg 'System Environment/Daemons'"
    "Mostrar lista de archivos de un paquete RPM instalado:|rpm -ql package_name"
    "Mostrar lista de archivos de configuración de un paquete RPM instalado:|rpm -qc package_name"
    "Mostrar lista de dependencias solicitadas por un paquete RPM:|rpm -q package_name --whatrequires"
    "Mostrar capacidad proporcionada por un paquete RPM:|rpm -q package_name --whatprovides"
    "Mostrar scripts ejecutados durante la instalación/desinstalación de un paquete RPM:|rpm -q package_name --scripts"
    "Mostrar historial de revisiones de un paquete RPM:|rpm -q package_name --changelog"
    "Verificar a qué paquete RPM pertenece un archivo específico:|rpm -qf /etc/httpd/conf/httpd.conf"
    "Mostrar lista de archivos de un paquete RPM que aún no ha sido instalado:|rpm -qp package.rpm -l"
    "Importar la firma digital de la llave pública:|rpm --import /media/cdrom/RPM-GPG-KEY"
    "Verificar la integridad de un paquete RPM:|rpm --checksig package.rpm"
    "Verificar la integridad de todos los paquetes RPM instalados:|rpm -qa gpg-pubkey"
    "Verificar la integridad de un paquete RPM no instalado:|rpm -Vp package.rpm"
    "Extraer un archivo ejecutable desde un paquete RPM:|rpm2cpio package.rpm | cpio --extract --make-directories *bin*"
    "Instalar un paquete RPM construido desde una fuente RPM:|rpm -ivh /usr/src/redhat/RPMS/\`arch\`/package.rpm"
    "Construir un paquete RPM desde una fuente RPM:|rpmbuild --rebuild package_name.src.rpm"
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
