 #!/bin/bash
#assumes all programs are installed and in the path
#assumes example2.zip exists and has annotations and assembly
#however, this does NOT assume the files in exaample2 will be unzipped
#https://stackoverflow.com/questions/11616835/r-command-not-found-bashrc-bash-profile
#this might have fixed a problem
#sed -i 's/\r$//' cleanRun2.sh

homepath=$(pwd)
echo $homepath
cd RNAseqExamples
unzip example2.zip
cd example2
mkdir raw
mkdir map
mkdir logs
mkdir trimmed
mkdir counts
RNApath=$(pwd)
echo $RNApath
#fastq-dump --outdir $RNApath/raw --split-files SRR1930186
#fastq-dump --outdir $RNApath/raw --split-files SRR1930185
#fastq-dump --outdir $RNApath/raw --split-files SRR1930184
#fastq-dump --outdir $RNApath/raw --split-files SRR1930183
#java -jar $homepath/toolkit/Trimmomatic-0.38/trimmomatic-0.38.jar PE -threads 4 -phred33 -trimlog $RNApath/logs/logFile \
#$RNApath/raw/SRR1930186_1.fastq $RNApath/raw/SRR1930186_2.fastq \
#$RNApath/trimmed/trim_paired_SRR1930186_1.fastq $RNApath/trimmed/trim_unpaired_SRR1930186_1.fastq $RNApath/trimmed/trim_paired_SRR1930186_2.fastq $RNApath/trimmed/trim_unpaired_SRR1930186_2.fastq \
#ILLUMINACLIP:$homepath/toolkit/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:40:15 SLIDINGWINDOW:5:30
# java -jar $homepath/toolkit/Trimmomatic-0.38/trimmomatic-0.38.jar PE -threads 4 -phred33 -trimlog $RNApath/logs/logFile \
# $RNApath/raw/SRR1930185_1.fastq $RNApath/raw/SRR1930185_2.fastq \
# $RNApath/trimmed/trim_paired_SRR1930185_1.fastq $RNApath/trimmed/trim_unpaired_SRR1930185_1.fastq $RNApath/trimmed/trim_paired_SRR1930185_2.fastq $RNApath/trimmed/trim_unpaired_SRR1930185_2.fastq \
# ILLUMINACLIP:$homepath/toolkit/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:40:15 SLIDINGWINDOW:5:30
# java -jar $homepath/toolkit/Trimmomatic-0.38/trimmomatic-0.38.jar PE -threads 4 -phred33 -trimlog $RNApath/logs/logFile \
# $RNApath/raw/SRR1930184_1.fastq $RNApath/raw/SRR1930184_2.fastq \
# $RNApath/trimmed/trim_paired_SRR1930184_1.fastq $RNApath/trimmed/trim_unpaired_SRR1930184_1.fastq $RNApath/trimmed/trim_paired_SRR1930184_2.fastq $RNApath/trimmed/trim_unpaired_SRR1930184_2.fastq \
# ILLUMINACLIP:$homepath/toolkit/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:40:15 SLIDINGWINDOW:5:203
# java -jar $homepath/toolkit/Trimmomatic-0.38/trimmomatic-0.38.jar PE -threads 4 -phred33 -trimlog $RNApath/logs/logFile \
# $RNApath/raw/SRR1930183_1.fastq $RNApath/raw/SRR1930183_2.fastq \
# $RNApath/trimmed/trim_paired_SRR1930183_1.fastq $RNApath/trimmed/trim_unpaired_SRR1930183_1.fastq $RNApath/trimmed/trim_paired_SRR1930183_2.fastq $RNApath/trimmed/trim_unpaired_SRR1930183_2.fastq \
# ILLUMINACLIP:$homepath/toolkit/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:40:15 SLIDINGWINDOW:5:30
# rm $RNApath/trimmed/trim_unpaired_SRR1930186_1.fastq
# rm $RNApath/trimmed/trim_unpaired_SRR1930186_2.fastq
# rm $RNApath/trimmed/trim_unpaired_SRR1930185_1.fastq
# rm $RNApath/trimmed/trim_unpaired_SRR1930185_2.fastq
# rm $RNApath/trimmed/trim_unpaired_SRR1930184_1.fastq
# rm $RNApath/trimmed/trim_unpaired_SRR1930184_2.fastq
# rm $RNApath/trimmed/trim_unpaired_SRR1930183_1.fastq
# rm $RNApath/trimmed/trim_unpaired_SRR1930183_2.fastq
# tar xvf $RNApath/genome/assembly/genome_assemblies_fasta.tar
# gunzip $RNApath/genome/annotations/Cyanidioschyzon_merolae.ASM9120v1.39.chromosome.19.gff3.gz
# gunzip $RNApath/genome/assembly/ncbi-genomes-2018-07-02/GCF_000091205.1_ASM9120v1_genomic.fna
# mv $RNApath/genome/assembly/ncbi-genomes-2018-07-02/GCF_000091205.1_ASM9120v1_genomic.fna $RNApath/genome/assembly/ncbi-genomes-2018-07-02/GCF_000091205.1_ASM9120v1_genomic.fa
# STAR --runMode genomeGenerate --genomeDir $RNApath/genome \
# --genomeFastaFiles $RNApath/genome/assembly/genome_assemblies_fasta/ncbi-genomes-2018-07-02/GCF_000091205.1_ASM9120v1_genomic.fa \
# --runThreadN 4
# STAR --genomeDir $RNApath/genome/ \
# --readFilesIn $RNApath/trimmed/trim_paired_SRR1930183_1.fastq $RNApath/trimmed/trim_paired_SRR1930183_2.fastq \
# --runThreadN 4 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix $RNApath/map/SRR1930183
# STAR --genomeDir $RNApath/genome/ \
# --readFilesIn $RNApath/trimmed/trim_paired_SRR1930184_1.fastq $RNApath/trimmed/trim_paired_SRR1930184_2.fastq \
# --runThreadN 4 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix $RNApath/map/SRR1930184
# STAR --genomeDir $RNApath/genome/ \
# --readFilesIn $RNApath/trimmed/trim_paired_SRR1930185_1.fastq $RNApath/trimmed/trim_paired_SRR1930185_2.fastq \
# --runThreadN 4 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix $RNApath/map/SRR1930185
# STAR --genomeDir $RNApath/genome/ \
# --readFilesIn $RNApath/trimmed/trim_paired_SRR1930186_1.fastq $RNApath/trimmed/trim_paired_SRR1930186_2.fastq \
# --runThreadN 4 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix $RNApath/map/SRR1930186
# htseq-count -s no -r pos -t exon -i Parent -f bam $RNApath/map/SRR1930186Aligned.sortedByCoord.out.bam \
# $RNApath/genome/annotations/Cyanidioschyzon_merolae.ASM9120v1.39.chromosome.19.gff3 > $RNApath/counts/SRR1930186-out.counts
# htseq-count -s no -r pos -t exon -i Parent -f bam $RNApath/map/SRR1930185Aligned.sortedByCoord.out.bam \
# $RNApath/genome/annotations/Cyanidioschyzon_merolae.ASM9120v1.39.chromosome.19.gff3 > $RNApath/counts/SRR1930185-out.counts
# htseq-count -s no -r pos -t exon -i Parent -f bam $RNApath/map/SRR1930184Aligned.sortedByCoord.out.bam \
# $RNApath/genome/annotations/Cyanidioschyzon_merolae.ASM9120v1.39.chromosome.19.gff3 > $RNApath/counts/SRR1930184-out.counts
# htseq-count -s no -r pos -t exon -i Parent -f bam $RNApath/map/SRR1930183Aligned.sortedByCoord.out.bam \
# $RNApath/genome/annotations/Cyanidioschyzon_merolae.ASM9120v1.39.chromosome.19.gff3 > $RNApath/counts/SRR1930183-out.counts