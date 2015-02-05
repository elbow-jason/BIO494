#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

FILENAME=$1
NAME=`echo "$FILENAME" | cut -d'.' -f1`
EXTENSION=`echo "$FILENAME" | cut -d'.' -f2`

echo "extracting verified orfs into ${NAME}_verified_orfs.${EXTENSION} ..."

cat $FILENAME |
grep "orf_classification=Verified" > "${NAME}_verified_orfs.${EXTENSION}"


