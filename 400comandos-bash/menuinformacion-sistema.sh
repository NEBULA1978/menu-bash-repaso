#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones+=(
    "Mostrar información del sistema (arch):|arch"
    "Mostrar información detallada del sistema (lshw):|lshw"
    "Mostrar información de la distribución (lsb_release -a):|lsb_release -a"
    "Mostrar información detallada de la memoria RAM (dmidecode -t memory):|dmidecode -t memory"
    "Mostrar arquitectura de la máquina (uname -m):|uname -m"
    "Mostrar versión del kernel (uname -r):|uname -r"
    "Mostrar componentes del sistema (dmidecode -q):|dmidecode -q"
    "Mostrar características de un disco duro (hdparm -i /dev/hda):|hdparm -i /dev/hda"
    "Realizar prueba de lectura en un disco duro (hdparm -tT /dev/sda):|hdparm -tT /dev/sda"
    "Mostrar información de la CPU (cat /proc/cpuinfo):|cat /proc/cpuinfo"
    "Mostrar interrupciones (cat /proc/interrupts):|cat /proc/interrupts"
    "Verificar el uso de memoria (cat /proc/meminfo):|cat /proc/meminfo"
    "Verificar el uso de memoria (free):|free"
    "Mostrar información de ficheros swap (cat /proc/swaps):|cat /proc/swaps"
    "Mostrar versión del kernel (cat /proc/version):|cat /proc/version"
    "Mostrar adaptadores de red y estadísticas (cat /proc/net/dev):|cat /proc/net/dev"
    "Mostrar sistema de ficheros montado (cat /proc/mounts):|cat /proc/mounts"
    "Mostrar dispositivos PCI (lspci -tv):|lspci -tv"
    "Mostrar dispositivos USB (lsusb -tv):|lsusb -tv"
    "Mostrar fecha del sistema (date):|date"
    "Mostrar almanaque de 2011 (cal 2011):|cal 2011"
    "Mostrar almanaque de julio de 2011 (cal 07 2011):|cal 07 2011"
    "Colocar fecha y hora (date 041217002011.00):|date 041217002011.00"
    "Asignar fecha y hora (date -s '20 MAY 2023 19:46:00'):|date -s '20 MAY 2023 19:46:00'"
    "Guardar cambios de fecha en la BIOS (clock -w):|clock -w"
    "Mostrar calendario del mes en curso (cal):|cal"
    "Mostrar nombre de usuario (whoami):|whoami"
    "Mostrar nombre de usuario con UID 1000 (awk -F: '{if ($4==1000) print $1}' /etc/passwd):|awk -F: '{if ($4==1000) print $1}' /etc/passwd"
    "Mostrar usuarios conectados (w):|w"
    "Mostrar información de memoria y swap (free):|free"
    "Mostrar información de memoria (cat /proc/meminfo):|cat /proc/meminfo"
    "Mostrar información del microprocesador (cat /proc/cpuinfo):|cat /proc/cpuinfo"
    "Mostrar información del kernel (uname -a):|uname -a"
    "Mostrar información de la distribución (cat /etc/*-release):|cat /etc/*-release"
    "Mostrar tiempo de encendido y usuarios activos (uptime):|uptime"
    "Especificar ruta para compilar (export PATH=\$PATH:\$ANDROID_HOME/platform-tools):|export PATH=\$PATH:\$ANDROID_HOME/platform-tools"
    "Seleccionar la interfaz para arrancar una aplicación desde el terminal (export DISPLAY=:0):|export DISPLAY=:0"
    "Cambiar la shell por defecto a zsh (chsh -s \$(which zsh)):|chsh -s \$(which zsh)"
    "Cambiar el nombre de los elementos (COUNT_C=1; for i in *.mp3; do ((COUNT_C=COUNT_C+1)); mv \"\$i\" \"\$COUNT_C.mp3\" ; done):|COUNT_C=1; for i in *.mp3; do ((COUNT_C=COUNT_C+1)); mv \"\$i\" \"\$COUNT_C.mp3\" ; done"
    "Listar errores en el registro del sistema (tail /var/log/syslog):|tail /var/log/syslog"
    "Ver paquetes entrantes en el puerto 12201 (tcpdump -vvv -i eth0 port 12201):|tcpdump -vvv -i eth0 port 12201"
    "Activar un demonio para escuchar información en el puerto 9999 (netcat -lk 9999):|netcat -lk 9999"
    "Realizar búsqueda de un paquete sobre 'help' en una sección en particular ({paquete} help {elemento a buscar}):|{paquete} help {elemento a buscar}"
    "Bloquear la pantalla desde el terminal (xdg-screensaver lock):|xdg-screensaver lock"
    "Suspender el sistema desde el terminal (systemctl suspend):|systemctl suspend"
    "Mostrar el manual de 'git stash' (man git stash):|man git stash"
    "Mostrar la lista de contenedores Docker (sudo docker ps | cut -c1-\$COLUMNS):|sudo docker ps | cut -c1-\$COLUMNS"
    "Filtrar información de columnas relacionadas con 'avatar' (php artisan route:list | grep -i avatar | awk '{print \$3,\$2,\$5,\$8,\$9}'):|php artisan route:list | grep -i avatar | awk '{print \$3,\$2,\$5,\$8,\$9}'"
    "Mostrar el límite de memoria de PHP (php -r 'phpinfo();' | grep -i 'memory_limit'):|php -r 'phpinfo();' | grep -i 'memory_limit'"
    "Buscar la palabra 'my_word' en archivos PHP (grep -rin --include=*.php 'my_word'):|grep -rin --include=*.php 'my_word'"
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