Week 2: Vagrant
==========================

Installing the Data Science Toolbox
 
1) Install VirtualBox: https://www.virtualbox.org/wiki/Downloads

2) Install Vagrant: http://www.vagrantup.com/downloads.html

3) Open up a terminal or command prompt and create a directory for your toolbox; enter that directory
        $ mkdir DataScienceToolbox
        $ cd DataScienceToolbox

4) Tell vagrant you want to use the toolbox that comes with the book
        $ vagrant init data-science-toolbox/data-science-at-the-command-line

5) Boot your toolbox
        $ vagrant up

6) Access into your toolbox.  If you are using windows, you will need to follow the instructions in the book on connecting with Putty.
        $ vagrant ssh

You should now have something that looks like this: https://www.dropbox.com/s/8zn7j6u86tmrmp9/Screenshot%20from%202015-01-22%2011%3A56%3A32.png?dl=0

For Windows: Putty Download link: http://tartarus.org/~simon/putty-prerel-snapshots/x86/putty.exe


Notes for Jan 22: <-- These are good notes.
finishing up the lecture for last class:

define evolution
============

+ descent with modification
+ recent modifications that changes over time allele frequencies changes 

+ takes a long time
+ macro and micro evolution; there are same process depends what time frame of changes you are studying. Micro => changes in organism? Macro=> Something going from bacteria to plants.
+ changes in allele frequencies over time due to evolutionary forces such as natural selection, genetic drift, migration.  
+ change in the passing of heritable traits in species over time
+ Reed's favorite: Change of inheritable modifications over time.
Heritble traits include allele frequencies, but also others. For instance, inbreeding can change genotype frequencies, without changing allele frequencies. 


what are the five forces of evolution?
============================

1. natural selection; variation in genotype leading to greater fitness,  operates on phenotype
2. mutation - events that change genetic material; creates variation; is a force; transposons/recombination
3. genetic drift - random change in allele frequencies in a population; is stronger in smaller population
4. migration/gene flow /lack of migration or population structure - 
5. non-random mating - inbreeding; self-crossing; avoidance of mating with close relatives; changes genotype freqs, but not allele freqs. increases homozygosity

+ mutation; inheritable material changes and creats the raw material of evolution
causes larger jumps in the allele frequency.
+ operates like mutation can move alleles in. absence of migartion is also a force. 


Why do we care about mutation?
=========================

+ It is random and unpredictable, and can drastically affect an organisms well-being
+ Many diseases are linked to mutation
+ artificially create mutation to understand biology and application in biotechnology 
mutation allows spices can survive and a
+ mutation allows for adaptation by producing variants that may be better adapted to a changing environment
+ can cause malfunctions or new abilities (beneficial or deleterious)
+ mutation is data. patterns of mutation allow inference of the history of the DNA
+ can trace ancestry/lineages via differences in genetic mutations
+ tells of the history of the populations. connect up people to figure out multiple marriages, 
+ crime investigations

# END LECTURE ONE

LECTURE TWO
============

    1. be able to use the command line to manage data
    2. be able to write script to parse data 
+ use commands and Write scripts to work with them

Big Data
=======

+ big data; $1 bil for one person in the beginning; took 10 years
+ cost dramatically decreased so we can produce massive amount of data very very fast
+ currently takes approximately 8 days
+ cheaper to freeze than sequencing again
+ more data exists.
+ important to know how to handle these data so we need to know the skills and statistics 
+ do not want to 'blackbox' your process for data transformation
+ 
tracking data science is very valuable


OSEMN (pronounced awesome)
=========================
obtaining data
scrubbing data
exploring data
modeling data
interpreting data

Workshop
========
1. Shell 
2. Files and Dirs
3. Creation
4. Pipes and filters
5. Loops
6. Scripts
7. Searching for things

+ machins name and then path ~ and $ represent the prompt
+ install virtualbox and vagrant

+ virtual box has images just like on a machine; vagrant is a wrapper to run those images
+ $ mkdir creates directory that vagrant lives there
+ $ cd  <directory>   goes to that directory
+ $ vagrant init 

+ windows users use the putty program
    + host name: 127.0.0.1
    + port: 2222
    + connection type: ssh

+ mac or linux users do $ vagrant ssh


