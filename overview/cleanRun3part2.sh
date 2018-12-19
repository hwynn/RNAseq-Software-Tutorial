#!/bin/bash
#assumes all programs are installed and in the path
#assumes human.zip exists and has annotations and assembly
#however, this does NOT assume the files in exaample2 will be unzipped
export PATH="$PATH:/home/hwynn/toolkit/star/STAR-master/bin/Linux_x86_64"
export PATH="$PATH:/home/hwynn/toolkit/sratoolkit.2.9.1-1-ubuntu64/bin"
homepath=$(pwd)
echo $homepath
RNApath=$homepath/RNAseqExamples/human
echo $RNApath
STAR --runMode genomeGenerate --genomeDir $RNApath/genome \
--genomeFastaFiles $RNApath/genome/assembly/Homo_sapiens.GRCh38.dna.chromosome.17.fa \
--sjdbGTFfile $RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf \
--runThreadN 32
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/trimmed/trim_paired_ERR2587302_1.fastq $RNApath/trimmed/trim_paired_ERR2587302_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587302
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/trimmed/trim_paired_ERR2587302_1.fastq $RNApath/trimmed/trim_paired_ERR2587302_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587302
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/trimmed/trim_paired_ERR2587303_1.fastq $RNApath/trimmed/trim_paired_ERR2587303_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587303
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/trimmed/trim_paired_ERR2587304_1.fastq $RNApath/trimmed/trim_paired_ERR2587304_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587304
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/trimmed/trim_paired_ERR2587305_1.fastq $RNApath/trimmed/trim_paired_ERR2587305_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587305
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/trimmed/trim_paired_ERR2587306_1.fastq $RNApath/trimmed/trim_paired_ERR2587306_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587306
#counting
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587301Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587301-out.counts
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587302Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587302-out.counts
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587303Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587303-out.counts
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587304Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587304-out.counts
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587305Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587305-out.counts
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587306Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587306-out.counts
