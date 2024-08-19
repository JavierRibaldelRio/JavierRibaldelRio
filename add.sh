#!/bin/bash

# Script para agregar un nuevo item al archivo .qmd

# Variables de entrada
URL=$1
IMAGE_PATH=$2
TITLE=$3
TITULO=$4
DESCRIPTION=$5
DESCRIPCION=$6
DATE=$7
QMD_FILE="proyects.qmd"

# Validación de que todos los parámetros han sido proporcionados
if [ $# -ne 7 ]; then
    echo "Uso: $0 <URL> <IMAGE_PATH> <TITLE> <TÍTULO> <DESCRIPTION> <DESCRIPCIÓN> <DATE>"
    exit 1
fi

# The line where is content header
CONTENT_LINE=$(grep -n content < $QMD_FILE | awk -F ":" '{print $1}')

# Total lines of the file
LINES=$(wc -l <  $QMD_FILE)

CONTENT_LINE_FROM_END=$(($LINES-$CONTENT_LINE))

echo $CONTENT_LINE_FROM_END


echo -e "$(head -n $CONTENT_LINE $QMD_FILE)
    - path: $URL
      image: $IMAGE_PATH
      title: \"$TITLE\"
      description: $DESCRIPTION
      date: \"$DATE\"
\n$(tail -n $CONTENT_LINE_FROM_END $QMD_FILE)
"> $QMD_FILE