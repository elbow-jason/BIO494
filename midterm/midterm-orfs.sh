#!/bin/bash


# midterm-orfs.sh



#unverified
if [ $# -eq 0 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

FILENAME=$1
NAME=`echo "$FILENAME" | cut -d'.' -f1`
EXTENSION=`echo "$FILENAME" | cut -d'.' -f2`

echo "extracting unverified orfs into ${NAME}_unverified_orfs.${EXTENSION} ..."

cat $FILENAME | grep -v "orf_classification=Verified"
#> "${NAME}_unverified_orfs.${EXTENSION}"
