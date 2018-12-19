 #!/bin/bash
#assumes all programs are installed and in the path
#assumes example2.zip exists and has annotations and assembly
#however, this does NOT assume the files in exaample2 will be unzipped
export PATH="$PATH:/home/hwynn/toolkit/star/STAR-master/bin/Linux_x86_64"
export PATH="$PATH:/home/hwynn/toolkit/sratoolkit.2.9.1-1-ubuntu64/bin"
export PATH="$PATH:/home/hwynn/toolkit/samtools/bin"
homepath=$(pwd)
echo $homepath
cd RNAseqExamples
cd example2
RNApath=$homepath/RNAseqExamples/example2
echo $RNApath
#unzipping and renaming some predownloaded genome files
tar xvf $RNApath/genome/assembly/genome_assemblies_fasta.tar -C /home/hwynn/RNAseqExamples/example2/genome/assembly/
gunzip $RNApath/genome/annotations/Cyanidioschyzon_merolae.ASM9120v1.39.chromosome.19.gff3.gz
gunzip $RNApath/genome/assembly/ncbi-genomes-2018-07-02/GCF_000091205.1_ASM9120v1_genomic.fna.gz
mv $RNApath/genome/assembly/ncbi-genomes-2018-07-02/GCF_000091205.1_ASM9120v1_genomic.fna $RNApath/genome/assembly/ncbi-genomes-2018-07-02/GCF_000091205.1_ASM9120v1_genomic.fa
#running STAR to index the genome
#--NOTE: This method does not use annotations. Ideally we should use annotations
STAR --runMode genomeGenerate --genomeDir $RNApath/genome \
--genomeFastaFiles $RNApath/genome/assembly/ncbi-genomes-2018-07-02/GCF_000091205.1_ASM9120v1_genomic.fa \
--runThreadN 4
#running STAR to align/map stuff
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/trimmed/trim_paired_SRR1930183_1.fastq $RNApath/trimmed/trim_paired_SRR1930183_2.fastq \
--runThreadN 4 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix $RNApath/map/SRR1930183
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/trimmed/trim_paired_SRR1930184_1.fastq $RNApath/trimmed/trim_paired_SRR1930184_2.fastq \
--runThreadN 4 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix $RNApath/map/SRR1930184
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/trimmed/trim_paired_SRR1930185_1.fastq $RNApath/trimmed/trim_paired_SRR1930185_2.fastq \
--runThreadN 4 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix $RNApath/map/SRR1930185
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/trimmed/trim_paired_SRR1930186_1.fastq $RNApath/trimmed/trim_paired_SRR1930186_2.fastq \
--runThreadN 4 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix $RNApath/map/SRR1930186
#counting
htseq-count -s no -r pos -t exon -i Parent -f bam $RNApath/map/SRR1930186Aligned.sortedByCoord.out.bam \
$RNApath/genome/annotations/Cyanidioschyzon_merolae.ASM9120v1.39.chromosome.19.gff3 > $RNApath/counts/SRR1930186-out.counts
htseq-count -s no -r pos -t exon -i Parent -f bam $RNApath/map/SRR1930185Aligned.sortedByCoord.out.bam \
$RNApath/genome/annotations/Cyanidioschyzon_merolae.ASM9120v1.39.chromosome.19.gff3 > $RNApath/counts/SRR1930185-out.counts
htseq-count -s no -r pos -t exon -i Parent -f bam $RNApath/map/SRR1930184Aligned.sortedByCoord.out.bam \
$RNApath/genome/annotations/Cyanidioschyzon_merolae.ASM9120v1.39.chromosome.19.gff3 > $RNApath/counts/SRR1930184-out.counts
htseq-count -s no -r pos -t exon -i Parent -f bam $RNApath/map/SRR1930183Aligned.sortedByCoord.out.bam \
$RNApath/genome/annotations/Cyanidioschyzon_merolae.ASM9120v1.39.chromosome.19.gff3 > $RNApath/counts/SRR1930183-out.counts