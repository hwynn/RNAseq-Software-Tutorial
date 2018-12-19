 #!/bin/bash
#assumes all programs are installed and in the path
#assumes human.zip exists and has annotations and assembly
#however, this does NOT assume the files in exaample2 will be unzipped
export PATH="$PATH:/home/hwynn/toolkit/star/STAR-master/bin/Linux_x86_64"
export PATH="$PATH:/home/hwynn/toolkit/sratoolkit.2.9.1-1-ubuntu64/bin"
homepath=$(pwd)
echo $homepath
cd RNAseqExamples
cd human
mkdir raw
mkdir map
mkdir logs
mkdir trimmed
mkdir counts
RNApath=$homepath/RNAseqExamples/human
echo $RNApath
fastq-dump --outdir $RNApath/raw --split-files ERR2587301
fastq-dump --outdir $RNApath/raw --split-files ERR2587302
fastq-dump --outdir $RNApath/raw --split-files ERR2587303
fastq-dump --outdir $RNApath/raw --split-files ERR2587304
fastq-dump --outdir $RNApath/raw --split-files ERR2587305
fastq-dump --outdir $RNApath/raw --split-files ERR2587306
STAR --runMode genomeGenerate --genomeDir $RNApath/genome \
--genomeFastaFiles $RNApath/genome/assembly/Homo_sapiens.GRCh38.dna.chromosome.17.fa \
--sjdbGTFfile $RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf \
--runThreadN 32
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587301_1.fastq $RNApath/raw/ERR2587301_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587301
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587302_1.fastq $RNApath/raw/ERR2587302_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587302
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587303_1.fastq $RNApath/raw/ERR2587303_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587303
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587304_1.fastq $RNApath/raw/ERR2587304_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587304
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587305_1.fastq $RNApath/raw/ERR2587305_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587305
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587306_1.fastq $RNApath/raw/ERR2587306_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587306