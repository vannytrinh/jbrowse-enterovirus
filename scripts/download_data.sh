#!/bin/bash

# Define constants
NCBI_FTP_ROOT="https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF"
FASTA_LEAF="_genomic.fna.gz"
GFF_LEAF="_genomic.gff.gz"

# Input file containing file names and paths
INPUT_FILE="data/enterovirus.csv"

# Read the input file line by line
while IFS=$',' read -r FILE_NAME FILE_PATH; do
    # Construct the URLs
    FASTA_LINK="${NCBI_FTP_ROOT}/${FILE_PATH}${FASTA_LEAF}"
    GFF_LINK="${NCBI_FTP_ROOT}/${FILE_PATH}${GFF_LEAF}"
    
    # Download the FASTA file
    wget -O "${FILE_NAME}.fa.gz" "${FASTA_LINK}"
    
    # Download the GFF file
    wget -O "${FILE_NAME}.gff.gz" "${GFF_LINK}"
done < "$INPUT_FILE"