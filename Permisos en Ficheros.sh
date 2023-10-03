#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar archivos del directorio actual:|ls"
    "Mostrar calendario:|cal"
    "Mostrar dia de hoy:|date"
    "Mostrar permisos de archivos y directorios (ls -lh):|ls -lh"
    "Dividir la terminal en 5 columnas (ls /tmp | pr -T5 -W\$COLUMNS):|ls /tmp | pr -T5 -W\$COLUMNS"
    "Colocar permisos de lectura, escritura y ejecución al propietario, grupo y otros (chmod ugo+rwx directory1):|chmod ugo+rwx directory1"
    "Quitar permisos de lectura, escritura y ejecución al grupo y otros (chmod go-rwx directory1):|chmod go-rwx directory1"
    "Cambiar el dueño de un fichero (chown user1 file1):|chown user1 file1"
    "Cambiar el propietario de un directorio y su contenido (chown -R user1 directory1):|chown -R user1 directory1"
    "Cambiar el grupo de ficheros (chgrp group1 file1):|chgrp group1 file1"
    "Cambiar usuario y grupo propietario de un fichero (chown user1:group1 file1):|chown user1:group1 file1"
    "Visualizar ficheros del sistema con SUID configurado (find / -perm -u+s):|find / -perm -u+s"
    "Colocar el bit SUID en un fichero binario (chmod u+s /bin/file1):|chmod u+s /bin/file1"
    "Deshabilitar el bit SUID en un fichero binario (chmod u-s /bin/file1):|chmod u-s /bin/file1"
    "Colocar un bit SGID en un directorio (chmod g+s /home/public):|chmod g+s /home/public"
    "Deshabilitar un bit SGID en un directorio (chmod g-s /home/public):|chmod g-s /home/public"
    "Colocar un bit STICKY en un directorio (chmod o+t /home/public):|chmod o+t /home/public"
    "Deshabilitar un bit STICKY en un directorio (chmod o-t /home/public):|chmod o-t /home/public"
    "Quitar permisos de ejecución y añadir permisos de ejecución a archivos y directorios (chmod -x+X -R /home/public/):|chmod -x+X -R /home/public/"
    "Cambiar los permisos de acceso total y ejecución a un archivo (chmod 777 Hola.odt):|chmod 777 Hola.odt"
    "Cambiar los permisos de acceso total y ejecución a un archivo (chmod ugoa +rwxrwxrwx Hola.odt):|chmod ugoa +rwxrwxrwx Hola.odt"
    "Establecer permisos de escritura al grupo del archivo (chmod g+w archivo.txt):|chmod g+w archivo.txt"
    "Quitar permisos de escritura al grupo del archivo (chmod g-w archivo.txt):|chmod g-w archivo.txt"
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
