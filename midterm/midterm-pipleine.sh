#!/bin/bash

# Paths to external programs

# set the local variable $GIT to the command `git` for version contol and downloading source code
GIT=git

# set the local variable $MAFFT to the command `mafft` for command-line interfaced multiple sequence alignment
MAFFT=mafft

# set the local variable $PHYML to the command `phyml` for phylogeny markup <-- (cool)
PHYML=phyml

# Parameters for running the pipeline
# set local variable $REPO to the git repo that will be cloned
REPO="https://github.com/reedacartwright/sample-data.git"

# set local variable $BSREPS to 100. However, this local variable is used again in this script.
# as far as I can tell the script runs the same with it commented out...
BSREPS=100

################################################################################
## Determine the directory this script lives in.
## You do not have to worry about this part of the magic.
## See: http://stackoverflow.com/a/246128

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  # if $SOURCE was a relative symlink, we need to resolve it relative to
  # the path where the symlink file was located
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
BINDIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

################################################################################


# "Create a temporary file or directory, safely, and print its name." from `$ mktemp --help`
# the -d flag is used to "create a directory, not a file" from `$ mktemp --help`
# and set the local variable $DIR to the name of the temp directory that is created.
DIR=`mktemp -d`

# print to stdout the name of the temp directory created above
echo "Using ${DIR} to do work..."

#using `git` from the $GIT var clone the repo in the $REPO var to the temp dir in $DIR
# if the cloning command fails throw an error to stderr and exit this script
$GIT clone $REPO "$DIR" ||
	{ 1>&2 echo "ERROR: something unexpected occurred during git cloning." ; exit 1; }

# do multiple sequence alignment of the sequences found in the temp directory's
# sample.fasta file using the flags:

# --globalpair which does global pairwise alignment
#   (source: `$ man mafft | grep -A 4 "\-\-globalpair$"`)

# --maxiterate 1000 which is the "number cycles of iterative refinement are performed.  Default: 0"
#   meaning 1000 cycles of refinement for the alignment
#   (source: `$ man mafft | grep -A 2 "\-\-maxiterate number$"`)

# --clustalout "Output format: clustal format.  Default: off (fasta format)"
#   (source: `$ man mafft | grep -A 2 "\-\-clustalout$"`)

# ... and output the clustal formatted alignment into the temp dir file sample.aln
# if the $MAFFT command fails throw an error to stderr and exit this script
$MAFFT --globalpair --clustalout --maxiterate 1000 "${DIR}/sample.fasta" > "${DIR}/sample.aln" ||
	{ 1>&2 echo "ERROR: something unexpected occurred during alignment." ; exit 1; }

# using the current working directory's removegaps.R file, using the alignment to created a phylogeny file
# if the alignment to phylogeny operation fails throw an error to stderr and exit this script

"${BINDIR}/removegaps.R" "${DIR}/sample.aln" "./sample-cleaned.phy" ||
	{ 1>&2 echo "ERROR: something unexpected occurred during alignment to phylogeny." ; exit 1; }

#print to stdout that the temp dir is being clean up
echo "Cleaning up ${DIR}..."

#remove the temp directory completely
rm -rf "$DIR"

# printing to stdout the location of the new phylogeny file to the user's console
echo "Success, your results are stored in ./sample-cleaned.phy."


# Summarily, this script clones a git repo,
# aligns a fasta file in the repo,
# converts the alignment file into a phylogeny file,
# and outputs the phylogeny file into a directory ./sample-cleaned.phy


# potential manual follows:

# NAME
#
# 	midterm-pipeline - fasta file multiple sequence aligment to phylogeny file genomics pipeline
#
# SYNOPSIS
#
# 	midterm-pipeline [options] input > output
#
# DESCRIPTION
#
# 	midterm-pipeline is a genomics pipeline that takes a .fasta file, performs multiple sequence alignment via
# 	mafft and then phylogeny via phmyl and R.
#
# OPTIONS
#
# 	--repo url
# 		Specifies the URL of the git repo in which alignment scripts and/or fasta files reside.
# 		default: https://github.com/reedacartwright/sample-data.git
#
# 	--input filepath
# 		Specifies the path to the fasta file for input
# 		default: sample.fasta of the specified --repo url\'s temp dir
#
# 	--output filepath
# 		Specifies the path for output .phy file
# 		default: ./sample-cleaned.phy
#
#




# sources for this information/assignment were:
# 1. manual pages
# 2. --help pages
# 3. http://stackoverflow.com/questions/9081/grep-a-file-but-show-several-surrounding-lines (for grepping more than one line)
# 4. rubular.com (for regex trial and error for grepping)
