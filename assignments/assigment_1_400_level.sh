#!/bin/bash

# if the number of arguments supplied when calling this script is 0 then
    # print to stdio a help message with directions for using the_name_of_this_file followed by a filename
    # exits with an "abnormal" status (anything except 0 is abnormal)
# end the if block
if [ $# -eq 0 ]; then  
    echo "Usage: $0 filename"
    exit 1
fi

# var $filename becomes the first arg
filename=$1


echo -n "The number of genes in $filename is "
cat $filename |
grep -v '^#' |
cut -f3 |
grep gene |
wc -l
