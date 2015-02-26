#!/usr/bin/Rscript

# get the args from the command line that come after the command to call this script
# if there is less than one argument then print a usage message and quit
#       from the comamnd line to start this script extract the name of this file
#       to stdio print instructions on how to use this file
#       quit with an abnormal status (anything other than 0 is an abnomral status)
# get the filename from the first item in the list of args
# load genomeIntervals without printing messages
# without printing the entire status to stdio open the specified gff file and put its contents into the `gff` object
# from the gff object extract the annotations
# from the `data` dataframe keep only the rows that have "gene" in the `type` column
# add the number of rows together
# print to stdio the number of genes found in the file and... newline

args = commandArgs(trailingOnly=TRUE)
if(length(args) < 1) {
    scriptname = substr(grep("^--file=",commandArgs(),value=TRUE),8,1000)
    cat("Usage: Rscript",scriptname,"filename\n")
    quit(status=1)
}

filename = args[1]
suppressMessages(library("genomeIntervals"))

gff = readGff3(filename,quiet=TRUE)
data = annotation(gff)
m = grepl("gene",data$type)
s = sum(m)

cat("The number of genes in",filename, "is", s, "\n")
