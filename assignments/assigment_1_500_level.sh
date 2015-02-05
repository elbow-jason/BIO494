#!/bin/bash
if [ $# -eq 0 ]; then
echo "Usage: $0 filename"
exit 1
fi
filename=$1
echo "Chr"$'\t'"Genes"
cat "${filename}" |
sed -e '/##FASTA/,$d' |
grep -v '^#' |
awk '$3 == "gene"' |
cut -f1 |
sort |
uniq -c |
sort -k1,1nr |
awk '{print $2 "\t" $1}' |
sed -e 's/^chr//'
