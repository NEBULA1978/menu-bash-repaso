#!/bin/bash

opciones=(
    "Sintaxis general para manipulación de texto con PIPE, STDIN y STDOUT:|cat file1 file2 .. | command <> file1_in.txt_or_file1_out.txt"
    "Manipular texto de un fichero y escribir resultado en un fichero nuevo:|cat file1 | command > result.txt"
    "Manipular texto de un fichero y añadir resultado en un fichero existente:|cat file1 | command >> result.txt"
    "Buscar palabras 'Aug' en un fichero:|grep Aug /var/log/messages"
    "Buscar palabras que comienzan con 'Aug' en un fichero:|grep ^Aug /var/log/messages"
    "Seleccionar líneas del fichero que contienen números:|grep [0-9] /var/log/messages"
    "Buscar la cadena 'Aug' en el directorio '/var/log' y debajo:|grep Aug -R /var/log/*"
    "Reemplazar 'string1' con 'string2' en un fichero:|sed 's/string1/string2/g' example.txt"
    "Eliminar todas las líneas en blanco de un fichero:|sed '/^$/d' example.txt"
    "Eliminar comentarios y líneas en blanco de un fichero:|sed '/ *#/d; /^$/d' example.txt"
    "Convertir minúsculas en mayúsculas:|echo 'ejemplo' | tr '[:lower:]' '[:upper:]'"
    "Eliminar la primera línea de un fichero:|sed -e '1d' result.txt"
    "Visualizar solamente las líneas que contienen la palabra 'string1':|sed -n '/string1/p'"
    "Eliminar todas las comillas dobles ('\"\"\"') de un texto:|sed 's/\"\"\"//g'"
    "Eliminar todos los caracteres de salto de línea (Enter):|tr --delete '\n'"
    "Reemplazar texto y eliminar todos los saltos de línea (Enter) y guardar en un archivo:|cat general.txt | sed 's/\"\"\"//g' | tr --delete '\n' | tee -a output.txt"
    "Eliminar el primer carácter de cada línea en un fichero:|sed 's/^//g'"
    "Añadir texto al principio de cada línea en un fichero:|sed 's/^/and text like \"/'"
    "Añadir texto al final de cada línea en un fichero:|sed 's/$/%\"/'"
    "Renombrar archivos desde la terminal (ejemplo: 'rename 's/^video_//' *.mp4'):|rename 's/^video_//' *.mp4"
    "Buscar y reemplazar un texto en diferentes archivos:|find ./ -type f -readable -writable -exec sed -i 's/background:#ff6622/background:#ff0000/g' {} \;"
    "Buscar una palabra entre archivos de forma recursiva excluyendo el folder node_modules:|grep -rion 'palabra a buscar' --exclude-dir=node_modules"
    "Obtener varios elementos de un comando grep:|lscpu | grep -E '(Model|CPU MHz)'"
    "Salir:|exit 0"
)

while true; do
    clear
    echo "MANIPULACIÓN DE TEXTO"
    echo "============================"
    echo "Escoja una opción:"
    for ((i=0; i<${#opciones[@]}; i++)); do
        echo "$i. ${opciones[i]%%:*}" # Imprimimos el índice y el nombre de la opción (sin el comando).
    done
    echo "============================"
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
