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

# echo "Chr"$'\t'"Genes"
# prints two colums "Chr" and "Genes" separated by a tab(\t)

# cat "${filename}" |
# interpolate the $filename var ('somefile.gff') into a string ("${filename}")
# producing "somefile.gff" then
# to stdio print the contents of somefile.gff after piping into the next function

# sed -e '/##FASTA/,$d' |
# from the input stream
# evaluate the following expression (-e)
# find the lines that match the regex pattern ##FASTA(/##FASTA/)
# and delete those lines($d)
# and pipe remaining lines into the next function

# grep -v '^#' |
# from the input
# discard(-v)
# matching regex
# the lines that begin(^) followed immediately by
# a pound symbol, more comptemporarily called hashtag, (#)
# and pipe remaining lines into the next function

# awk '$3 == "gene"' |
# to each line in the input
# apply the expression follwing the awk command (awk)
# and keep only the lines
# in which the third column ($3)
# is equal to (==)
# the string gene ("gene")
# and pipe the lines into the next function

# cut -f1 |
# from the input
# keep only the first field(-f1) of each line with a delimiter
# and also keep any line that contains no delimiter character (again tab)
# and pipe the lines into the next function

# sort |
# Note: that this sort is unneccessary.
# from the input
# sort each line alphabetically
# and pipe the sorted lines into the next function

# uniq -c |
# from the input
# keep the text of each instance of a line only once
# and prepend a column of the count of occurences of
# that instance to each unique instance
# and pipe lines into the next function

# sort -k1,1nr |
# from the input
# sort using first as a key (-k1)
# where k1 is 1nr (-k1,1nr):
#   sort numerically (n of 1nr)
#   and
#   reverse the sort(r of 1nr)
# and pipe the sorted lines into the next function

# awk '{print $2 "\t" $1}' |
# for each line of the input
# ouput the 2nd column($2)
# followed by a tab("\t")
# followed by the 1st column($1)
# Basically swap the places of the columns.
# and pipe the lines into the next function

# sed -e 's/^chr//'
# from the input
# using regex(/^chr/regex )
# substitute(s in s/^chr//) all instances
# matching beginning of a line(^) followed by chr (chr)
# with nothing (// of s/^chr//). // is an empty regex and
# this regex essential deletes all ^chr lines


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
# sort |
uniq -c |
sort -k1,1nr |
awk '{print $2 "\t" $1}' |
sed -e 's/^chr//'
