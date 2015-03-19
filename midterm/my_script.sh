if [ $# -eq 0 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

FILENAME=$1
NAME=`echo "$FILENAME" | cut -d'.' -f1`
EXTENSION=`echo "$FILENAME" | cut -d'.' -f2`

echo "splitting fasta away from gff"
cat $FILENAME | sed -n -e '/FASTA/,$p' | tail -n +2 | head
