#!/bin/bash


# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones+=(
    "Apagar el sistema (shutdown -h now):|shutdown -h now"
    "Apagar el sistema (init 0):|init 0"
    "Apagar el sistema (telinit 0):|telinit 0"
    "Apagar el sistema (halt):|halt"
    "Apagado planificado del sistema (shutdown -h hours:minutes &):|shutdown -h hours:minutes &"
    "Cancelar un apagado planificado del sistema (shutdown -c):|shutdown -c"
    "Reiniciar el sistema (shutdown -r now):|shutdown -r now"
    "Reiniciar el sistema (reboot):|reboot"
    "Cerrar sesión (logout):|logout"
    "Detener todos los procesos y apagar el equipo (halt):|halt"
    "Programar apagado del sistema en 1 minuto (shutdown):|shutdown"
    "Programar reinicio del sistema en X minutos (shutdown -r X):|shutdown -r X"
    "Apagar el equipo inmediatamente (shutdown -h now):|shutdown -h now"
    "Reiniciar el equipo inmediatamente (shutdown -r now):|shutdown -r now"
    "Apagar el sistema (init 0):|init 0"
    "Reiniciar el sistema (init 6):|init 6"
    "Iniciar la interfaz gráfica (startx):|startx"
    "Reiniciar el sistema de audio (pulseaudio -k && sudo alsa force-reload):|pulseaudio -k && sudo alsa force-reload"
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