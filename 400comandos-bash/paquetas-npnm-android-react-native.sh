#!/bin/bash

opciones=(
    "Iniciar configuración del package.json (npm init):|npm init"
    "Instalar paquetes de manera forzada (npm install -f <paquete>):|npm install -f <paquete>"
    "Instalar paquetes y ver el progreso detallado (npm install --verbose <paquete>):|npm install --verbose <paquete>"
    "Instalar paquetes de forma global (npm install -g <paquete>):|npm install -g <paquete>"
    "Iniciar un emulador de Android SDK previamente configurado (emulator -avd <nombre_avd>):|cd ~/Android/Sdk/emulator && ./emulator -avd <nombre_avd> -netspeed full -netdelay none -debug-init"
    "Ejecutar una aplicación React Native en Android (react-native run-android):|react-native run-android"
    "Salir:|exit 0"
)

while true; do
    clear
    echo "GESTOR DE PAQUETES NPM Y ANDROID SDK CON REACT NATIVE"
    echo "==================================================="
    echo "Escoja una opción:"
    for ((i=0; i<${#opciones[@]}; i++)); do
        echo "$i. ${opciones[i]%%:*}" # Imprimimos el índice y el nombre de la opción (sin el comando).
    done
    echo "==================================================="
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
