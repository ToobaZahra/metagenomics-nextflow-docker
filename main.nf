nextflow.enable.dsl=2

process FASTQC {
    container 'biocontainers/fastqc:v0.11.9_cv8'

    input:
    path reads

    output:
    path "*_fastqc*"

    script:
    """
    fastqc ${reads}
    """
}

process TRIMMOMATIC {
    container 'quay.io/biocontainers/trimmomatic:0.39--hdfd78af_2'

    input:
    path reads

    output:
    path "trimmed_*.fastq.gz"

    script:
    """
    trimmomatic SE -phred33 ${reads} trimmed_${reads} TRAILING:10 MINLEN:36
    """
}

process MULTIQC {
    container 'quay.io/biocontainers/multiqc:1.14--pyhdfd78af_0'

    input:
    path reports

    output:
    path "multiqc_report.html"

    script:
    """
    multiqc .
    """
}

workflow {
    reads = Channel.fromPath("data/*.fastq.gz")
    fastqc_out = FASTQC(reads)
    trimmed = TRIMMOMATIC(reads)
    MULTIQC(fastqc_out.collect())
}
