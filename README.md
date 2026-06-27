# Metagenomics Nextflow + Docker Pipeline

Hi, I'm Tooba Zahra — an MS Bioinformatics student at COMSATS University Islamabad (graduating Feb 2027). This is my second Nextflow + Docker project, focused on metagenomics analysis.

## What is Metagenomics?

Unlike regular genomics where you analyze one known organism, metagenomics analyzes DNA from an entire environment (gut, soil, water) where hundreds of unknown organisms are mixed together. The goal is to find out — what organisms are present and in what proportion?

## Pipeline Steps

1. **FastQC** — quality control of raw reads
2. **Trimmomatic** — trim adapters and low quality bases
3. **Kraken2** — classify reads to identify which organism each read belongs to
4. **Bracken** — estimate abundance of each organism
5. **MultiQC** — combine all QC reports into one HTML file

## Current Status

FastQC, Trimmomatic, and MultiQC are fully working. Kraken2 and Bracken require a database (minimum 8GB) which is too large for GitHub. To run the full pipeline, download the Kraken2 database from:
https://benlangmead.github.io/aws-indexes/k2

## Requirements

- Nextflow
- Docker

## How to run

```bash
nextflow run main.nf
```

## Tools used

| Tool | Version | Purpose |
|------|---------|---------|
| FastQC | 0.11.9 | QC |
| Trimmomatic | 0.39 | Trimming |
| Kraken2 | 2.1.2 | Taxonomic classification |
| Bracken | 2.7 | Abundance estimation |
| MultiQC | 1.14 | Reporting |
