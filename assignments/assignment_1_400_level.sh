#!/bin/bash
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



# now, assuming we called $ ./<this_script>.sh somefile.gff




# filename=$1
# var $filename becomes the first arg, somefile.gff

# echo -n "The number of genes in $filename is "
# print to stdio "the number of genes in somefile.gff is "
# and omit the, normally present, newline

# cat $filename |
# to stdio print the contents of somefile.gff after piping into the next function

# grep -v '^#' |
# from the input
# discard(-v)
# matching regex
# the lines that begin(^) followed immediately by
# a pound symbol, more comptemporarily called hashtag, (#)
# and pipe remaining lines into the next function

# cut -f3 |
# from the input
# keep only the third field(-f3) of each line with a delimiter (tab i think)
# and also keep any line that contains no delimiter character (again tab)
# and pipe the lines into the next function

# grep gene |
# from the input
# keep only the lines that contain/match the regex "gene"
# and pipe the lines into the next function

# wc -l
# from the input
# count (wc)
# the lines (-l)

# upon finishing the pipeline the output is printed to stdio
# with a count of the number genes in somefile.gff


if [ $# -eq 0 ]; then  
    echo "Usage: $0 filename"
    exit 1
fi

filename=$1

echo -n "The number of genes in $filename is "
cat $filename |
grep -v '^#' |
cut -f3 |
grep gene |
wc -l
