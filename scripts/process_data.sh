#!/bin/bash

# Input file containing file names and paths
INPUT_FILE="data/enterovirus.csv"

# Read the input file line by line
while IFS=$',' read -r FILE_NAME FILE_PATH; do

    # Unzip files 
    gunzip "${FILE_NAME}.fa.gz"
    gunzip "${FILE_NAME}.gff.gz"

    # Index genome 
    samtools faidx "${FILE_NAME}.fa"

    # Sort annotations 
    jbrowse sort-gff "${FILE_NAME}.gff" > "${FILE_NAME}_genes.gff"
    bgzip "${FILE_NAME}_genes.gff"
    tabix "${FILE_NAME}_genes.gff.gz"
    
done < "$INPUT_FILE"

# # Create PAF files 
minimap2 EV.fa EVA.fa > EVA_vs_EV.paf
minimap2 EV.fa EVB.fa > EVB_vs_EV.paf
minimap2 EV.fa EVC.fa > EVC_vs_EV.paf
minimap2 EV.fa EVD.fa > EVD_vs_EV.paf
minimap2 EV.fa EVA114.fa > EVA114_vs_EV.paf
minimap2 EV.fa EVD68.fa > EVD68_vs_EV.paf
minimap2 EVA.fa EVA114.fa > EVA114_vs_EVA.paf
minimap2 EVD.fa EVD68.fa > EVD68_vs_EVD.paf

# Combine all sequences into a file
cat *.fa > all_sequences.fasta
# Rename from accessions to names 
while IFS=',' read -r name accession
do
  sed -i '' "s/$accession/$name/g" all_sequences.fasta
done < data/accessions.csv

# Create MSA + Tree 
mafft --clustalout all_sequences.fasta > alignment.clustal
mafft --auto all_sequences.fasta > alignment.fasta
veryfasttree -nt alignment.fasta > tree.nwk



