#!/bin/bash
# #!/bin/bash at the beginning of the file tells the shell what program to use
# when this script is executed. In this case, the shebang(#!) is followed
# by /bin/bash which points to the binary for the Bourne Again SHell (bash) and
# instructs the shell to execute the following script in bash. If for example
# the shebang(#!) had been followed by /bin/python the shell would have tried
# to run the script in using the python program binary file inside /bin/.
# However, that wouldn't have worked because this is not a Python file(*.py),
# nor is the following code valid Python syntax.


# if [ $# -eq 0 ]; then
# begin an if block
# if the number of arguments supplied when calling this script is 0 then

#    echo "Usage: $0 filename"
# print to stdio a help message with directions for using the_name_of_this_file followed by a filename

#    exit 1
# exits with an "abnormal" status (anything except 0 is abnormal)

# fi
# end the if block




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
