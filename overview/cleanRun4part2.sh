 #!/bin/bash
export PATH="$PATH:/home/hwynn/toolkit/tophat-2.1.1.Linux_x86_64"
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
tophat2
/home/hwynn/RNAseqExamples/human/genome/assembly/Homo_sapiens.GRCh38.dna.chromosome.17.fa



>tophat --GTF <iGenomesFolder>/Annotation/Genes/genes.gtf
--library-type <LIBRARY_TYPE> --mate-inner-dist 100 --numthreads
1 --output-dir <SampleOutputFolder>
<iGenomesFolder>/Sequence/BowtieIndex/genome <SampleID>_1.fastq
<SampleID>_2.fastq




tophat --GTF $RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf --numthreads 32 --output-dir $RNApath/map $RNApath/raw ERR2587301_1.fastq ERR2587302_1.fastq
tophat --GTF $RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf -p 32 --output-dir $RNApath/map $RNApath/raw ERR2587301_1.fastq ERR2587302_1.fastq
#could not find bowtie index files. 

bowtie-build [options]* <reference_in> <ebwt_base>






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