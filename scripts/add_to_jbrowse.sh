#!/bin/bash

# Input file containing file names and paths
INPUT_FILE="data/enterovirus.csv"

# Read the input file line by line
while IFS=$',' read -r FILE_NAME FILE_PATH; do

    jbrowse add-assembly "${FILE_NAME}.fa" --out $APACHE_ROOT/jbrowse2 --load copy
    jbrowse add-track "${FILE_NAME}_genes.gff.gz" --out $APACHE_ROOT/jbrowse2 --load copy --assemblyNames "${FILE_NAME}" --force
    
done < "$INPUT_FILE"

jbrowse add-track EVA_vs_EV.paf --assemblyNames EVA,EV --out $APACHE_ROOT/jbrowse2 --load copy
jbrowse add-track EVB_vs_EV.paf --assemblyNames EVB,EV --out $APACHE_ROOT/jbrowse2 --load copy
jbrowse add-track EVC_vs_EV.paf --assemblyNames EVC,EV --out $APACHE_ROOT/jbrowse2 --load copy
jbrowse add-track EVD_vs_EV.paf --assemblyNames EVD,EV --out $APACHE_ROOT/jbrowse2 --load copy
jbrowse add-track EVA114_vs_EV.paf --assemblyNames EVA114,EV --out $APACHE_ROOT/jbrowse2 --load copy
jbrowse add-track EVD68_vs_EV.paf --assemblyNames EVD68,EV --out $APACHE_ROOT/jbrowse2 --load copy
jbrowse add-track EVA114_vs_EVA.paf --assemblyNames EVA114,EVA --out $APACHE_ROOT/jbrowse2 --load copy
jbrowse add-track EVD68_vs_EVD.paf --assemblyNames EVD68,EVD --out $APACHE_ROOT/jbrowse2 --load copy

jbrowse text-index --out $APACHE_ROOT/jbrowse2
