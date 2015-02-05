#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

FILENAME=$1

./verified_orfs.sh $FILENAME
./unverified_orfs.sh $FILENAME
