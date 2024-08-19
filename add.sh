#!/bin/bash

# Script para agregar un nuevo item al archivo .qmd

# Variables de entrada
URL=$1
IMAGE_PATH_EN=$2
IMAGE_PATH_ES=$(echo "../$2")
TITLE=$3
TITULO=$4
DESCRIPTION=$5
DESCRIPCION=$6
DATE=$7

QMD_FILE_EN="pages/proyects.qmd"
QMD_FILE_ES="es/pages/proyects.qmd"


# Validación de que todos los parámetros han sido proporcionados
if [ $# -ne 7 ]; then
    echo "Uso: $0 <URL> <IMAGE_PATH> <TITLE> <TÍTULO> <DESCRIPTION> <DESCRIPCIÓN> <DATE>"
    exit 1
fi



add_proyect(){
    # The line where is content header
    CONTENT_LINE=$(grep -n content < $1 | awk -F ":" '{print $1}')
    
    # Total lines of the file
    LINES=$(wc -l <  $1)
    
    CONTENT_LINE_FROM_END=$(($LINES-$CONTENT_LINE))
    
    
    echo -e "$(head -n $CONTENT_LINE $1)
    - path: $URL
      image: $2
      title: \"$3\"
      description: $4
      date: \"$DATE\"
\n$(tail -n $CONTENT_LINE_FROM_END $1)
    "> $1
}

# English version
add_proyect "$QMD_FILE_EN" "$IMAGE_PATH_EN" "$TITLE" "$DESCRIPTION"

# English version
add_proyect "$QMD_FILE_ES" "$IMAGE_PATH_ES" "$TITULO" "$DESCRIPCION"