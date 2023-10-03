#!/bin/bash


# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones+=(
    "Entrar en el directorio 'home' (cd /home):|cd /home"
    "Retroceder un nivel (cd ..):|cd .."
    "Retroceder 2 niveles (cd ../..):|cd ../.."
    "Ir al directorio raíz (cd):|cd"
    "Ir al directorio 'user1' (cd ~user1):|cd ~user1"
    "Regresar al directorio anterior (cd -):|cd -"
    "Mostrar el camino del directorio de trabajo (pwd):|pwd"
    "Ver los ficheros de un directorio (ls):|ls"
    "Ver los ficheros de un directorio (ls -F):|ls -F"
    "Mostrar detalles de ficheros y carpetas de un directorio (ls -l):|ls -l"
    "Mostrar detalles de ficheros y carpetas que pesan más (du -hsx * | sort -rh | head -6):|du -hsx * | sort -rh | head -6"
    "Mostrar los ficheros ocultos (ls -a):|ls -a"
    "Mostrar en megabytes los archivos (ls -lah):|ls -lah"
    "Mostrar los ficheros y carpetas que contienen números (ls *[0-9]*):|ls *[0-9]*"
    "Mostrar ficheros y carpetas en forma de árbol (tree):|tree"
    "Mostrar ficheros y carpetas en forma de árbol (lstree):|lstree"
    "Mostrar ficheros con detalles (tree -vlAarugD):|tree -vlAarugD"
    "Crear una carpeta o directorio llamado 'dir1' (mkdir dir1):|mkdir dir1"
    "Crear dos carpetas o directorios simultáneamente (mkdir dir1 dir2):|mkdir dir1 dir2"
    "Crear un árbol de directorios (mkdir -p /tmp/dir1/dir2):|mkdir -p /tmp/dir1/dir2"
    "Borrar un fichero llamado 'file1' (rm -f file1):|rm -f file1"
    "Borrar una carpeta llamada 'dir1' (rmdir dir1):|rmdir dir1"
    "Eliminar una carpeta llamada 'dir1' con su contenido de forma recursiva (rm -rf dir1):|rm -rf dir1"
    "Borrar dos carpetas con su contenido de forma recursiva (rm -rf dir1 dir2):|rm -rf dir1 dir2"
    "Renombrar o mover un fichero o carpeta (mv dir1 new_dir):|mv dir1 new_dir"
    "Copiar un fichero (cp file1):|cp file1"
    "Copiar dos ficheros al unísono (cp file1 file2):|cp file1 file2"
    "Copiar todos los ficheros de un directorio al directorio de trabajo actual (cp dir /* .):|cp dir /* ."
    "Copiar un directorio dentro del directorio actual de trabajo (cp -a /tmp/dir1 .):|cp -a /tmp/dir1 ."
    "Copiar un directorio (cp -a dir1):|cp -a dir1"
    "Copiar dos directorios al unísono (cp -a dir1 dir2):|cp -a dir1 dir2"
    "Copiar un fichero desde un host remoto al host local (SCP):|scp username@from_host:file.txt /local/directory/"
    "Copiar un fichero desde el host local a un host remoto (SCP):|scp file.txt username@to_host:/remote/directory/"
    "Copiar un directorio desde un host remoto al host local (SCP):|scp -r username@from_host:/remote/directory/  /local/directory/"
    "Copiar un directorio desde el host local a un host remoto (SCP):|scp -r /local/directory/ username@to_host:/remote/directory/"
    "Copiar un fichero desde un host remoto a otro host remoto (SCP):|scp username@from_host:/remote/directory/file.txt username@to_host:/remote/directory/"
    "Copiar archivos de un servidor a otro (rsync):|rsync -r -v --progress -e 'ssh -p 1560' user@remote-system:/address/to/remote/file /home/user/"
    "Ejecutar comandos directamente desde SSH en un servidor (ssh):|ssh user@cirelramos.com -p 22 \"chmod 700 .ssh; chmod 640 .ssh/authorized_keys\""
    "Ejecutar comandos SSH con una terminal en particular (ssh):|ssh user@cirelramos.com -p 22 /bin/zsh -ic \"reiniciar\""
    "Copiar archivos de un directorio a otro y compararlos (rsync):|rsync -r -v --progress web web2"
    "Copiar archivos excluyendo un directorio completo (rsync):|rsync --exclude 'directorio1' -a /src/path/ /dest/dir"
    "Copiar archivos de local a remoto por SSH con puerto específico (rsync):|rsync -av --exclude '.git/' -a /home/user/codigo/folderToCopy -r -v --progress -e 'ssh -p 1560' user@host:/tmp/"
    "Comparar archivos (diff):|diff -rq carpeta1 carpeta2"
    "Comparar archivos (diff):|diff fichero1 fichero2"
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