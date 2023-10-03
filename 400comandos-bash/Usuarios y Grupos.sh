#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar archivos del directorio actual:|ls"
    "Mostrar calendario:|cal"
    "Mostrar dia de hoy:|date"
    "Listar los grupos a los que pertenece un usuario (groups \$user):|groups \$user"
    "Crear un nuevo grupo (groupadd nombre_del_grupo):|groupadd nombre_del_grupo"
    "Borrar un grupo (groupdel nombre_del_grupo):|groupdel nombre_del_grupo"
    "Añadir un usuario a un grupo (adduser juan profesor):|adduser juan profesor"
    "Quitar un usuario de un grupo (deluser juan profesor):|deluser juan profesor"
    "Renombrar un grupo (groupmod -n nuevo_nombre_del_grupo viejo_nombre_del_grupo):|groupmod -n nuevo_nombre_del_grupo viejo_nombre_del_grupo"
    "Cambiar los grupos a los que pertenece un usuario (usermod -aG groups_to_add_to 'your_user'):|usermod -aG groups_to_add_to 'your_user'"
    "Crear un nuevo usuario perteneciente al grupo 'admin' (useradd -c 'Name Surname' -g admin -d /home/user1 -s /bin/bash user1):|useradd -c 'Name Surname' -g admin -d /home/user1 -s /bin/bash user1"
    "Crear un nuevo usuario (useradd user1):|useradd user1"
    "Crear un nuevo usuario con directorio (useradd -m user1):|useradd -m user1"
    "Borrar un usuario (userdel -r user1):|userdel -r user1"
    "Cambiar los atributos de un usuario (usermod -c 'User FTP' -g system -d /ftp/user1 -s /bin/nologin user1):|usermod -c 'User FTP' -g system -d /ftp/user1 -s /bin/nologin user1"
    "Cambiar la contraseña (passwd):|passwd"
    "Cambiar la contraseña de un usuario (passwd user1):|passwd user1"
    "Colocar un plazo para la contraseña del usuario (chage -E 2011-12-31 user1):|chage -E 2011-12-31 user1"
    "Chequear la sintaxis y existencia de usuarios en /etc/passwd (pwck):|pwck"
    "Chequear la sintaxis y existencia de grupos en /etc/group (grpck):|grpck"
    "Cambiar el grupo predeterminado de los ficheros creados recientemente (newgrp group_name):|newgrp group_name"
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
