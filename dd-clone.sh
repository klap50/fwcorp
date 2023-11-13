#!/bin/bash

echo "Script sencillo para clonar discos con dd x klap"

# Función para clonar un disco
clonar_disco() {
    read -p "Introduce el dispositivo de origen (ejemplo: /dev/sda): " origen
    read -p "Introduce el dispositivo de destino (ejemplo: /dev/sdb): " destino

    echo "Clonando de $origen a $destino..."
    sudo dd if="$origen" of="$destino" bs=64K conv=noerror,sync status=progress
}

# Menú principal
PS3='Selecciona una opción: '
opciones=("Clonar Disco" "Salir")
select opt in "${opciones[@]}"
do
    case $opt in
        "Clonar Disco")
            clonar_disco
            ;;
        "Salir")
            break
            ;;
        *) echo "Opción inválida $REPLY";;
    esac
done
