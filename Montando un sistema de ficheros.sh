#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar archivos del directorio actual:|ls"
    "Mostrar calendario:|cal"
    "Mostrar dia de hoy:|date"
    "Montar un disco llamado hda2 en /mnt/hda2 (mount /dev/hda2 /mnt/hda2):|mount /dev/hda2 /mnt/hda2"
    "Desmontar un disco llamado hda2 desde /mnt/hda2 (umount /dev/hda2):|umount /dev/hda2"
    "Forzar el desmontaje de un disco llamado hda2 cuando está ocupado (fuser -km /mnt/hda2):|fuser -km /mnt/hda2"
    "Correr el desmontaje de /mnt/hda2 sin leer el fichero /etc/mtab (umount -n /mnt/hda2):|umount -n /mnt/hda2"
    "Montar un disco flexible (floppy) en /mnt/floppy (mount /dev/fd0 /mnt/floppy):|mount /dev/fd0 /mnt/floppy"
    "Montar un cdrom/dvdrom en /mnt/cdrom (mount /dev/cdrom /mnt/cdrom):|mount /dev/cdrom /mnt/cdrom"
    "Montar un cd regrabable o un dvdrom en /mnt/cdrecorder (mount /dev/hdc /mnt/cdrecorder):|mount /dev/hdc /mnt/cdrecorder"
    "Montar un cd regrabable/dvdrom en /mnt/cdrecorder (mount /dev/hdb /mnt/cdrecorder):|mount /dev/hdb /mnt/cdrecorder"
    "Montar una imagen ISO en /mnt/cdrom (mount -o loop file.iso /mnt/cdrom):|mount -o loop file.iso /mnt/cdrom"
    "Montar un sistema de archivos FAT32 en /mnt/hda5 (mount -t vfat /dev/hda5 /mnt/hda5):|mount -t vfat /dev/hda5 /mnt/hda5"
    "Montar un USB pen-drive o una memoria en /mnt/usbdisk (mount /dev/sda1 /mnt/usbdisk):|mount /dev/sda1 /mnt/usbdisk"
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
