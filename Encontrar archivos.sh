#!/bin/bash


# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones+=(
    "Buscar fichero o directorio a partir de la raíz del sistema (find / -iname '*file1*'):|find / -iname '*file1*'"
    "Buscar ficheros y directorios pertenecientes al usuario 'user1' (find / -user user1):|find / -user user1"
    "Buscar ficheros con extensión '.bin' dentro del directorio '/home/user1' (find /home/user1 -name '*.bin'):|find /home/user1 -name '*.bin'"
    "Buscar ficheros binarios no usados en los últimos 100 días en '/usr/bin' (find /usr/bin -type f -atime +100):|find /usr/bin -type f -atime +100"
    "Buscar ficheros creados o cambiados dentro de los últimos 10 días en '/usr/bin' (find /usr/bin -type f -mtime -10):|find /usr/bin -type f -mtime -10"
    "Buscar ficheros ignorando algunas carpetas específicas (find -type f -mmin -1444 -not -path './.git/*' -not -path './dist/*' -not -path './locales/*' -not -path './node_modules/*' -not -path './build/*'):|find -type f -mmin -1444 -not -path './.git/*' -not -path './dist/*' -not -path './locales/*' -not -path './node_modules/*' -not -path './build/*'"
    "Buscar ficheros con extensión '.rpm' y modificar permisos (find / -name '*.rpm' -exec chmod 755 '{}' \;):|find / -name '*.rpm' -exec chmod 755 '{}' \;"
    "Buscar ficheros con extensión '.rpm' ignorando dispositivos removibles (find / -xdev -name '*.rpm'):|find / -xdev -name '*.rpm'"
    "Copiar archivos PDF que contengan 'linux' en el nombre desde Documentos al Escritorio (find /home/usuario/Documentos -iname '*linux*.pdf*' -exec cp '{}' /home/usuario/Escritorio/ \;):|find /home/usuario/Documentos -iname '*linux*.pdf*' -exec cp '{}' /home/usuario/Escritorio/ \;"
    "Encontrar ficheros con extensión '.ps' usando 'locate' (locate '*.ps'):|locate '*.ps'"
    "Mostrar la ubicación de un fichero binario 'halt' (whereis halt):|whereis halt"
    "Mostrar la senda completa a un binario 'halt' (which halt):|which halt"
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