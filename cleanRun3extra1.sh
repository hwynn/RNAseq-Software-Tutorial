 #!/bin/bash
export PATH="$PATH:/home/hwynn/toolkit/sratoolkit.2.9.1-1-ubuntu64/bin"
export PATH="$PATH:/home/hwynn/toolkit/star/STAR-master/bin/Linux_x86_64"
homepath=$(pwd)
echo $homepath
cd RNAseqExamples
cd human
RNApath=$homepath/RNAseqExamples/human
echo $RNApath
fastq-dump --outdir $RNApath/raw --split-files ERR2587348
cache-mgr /users/hwynn/ncbi/public/sra -c
fastq-dump --outdir $RNApath/raw --split-files ERR2587347
cache-mgr /users/hwynn/ncbi/public/sra -c
fastq-dump --outdir $RNApath/raw --split-files ERR2587343
cache-mgr /users/hwynn/ncbi/public/sra -c
fastq-dump --outdir $RNApath/raw --split-files ERR2587342
cache-mgr /users/hwynn/ncbi/public/sra -c
fastq-dump --outdir $RNApath/raw --split-files ERR2587341
cache-mgr /users/hwynn/ncbi/public/sra -c
fastq-dump --outdir $RNApath/raw --split-files ERR2587340
cache-mgr /users/hwynn/ncbi/public/sra -c
fastq-dump --outdir $RNApath/raw --split-files ERR2587346
cache-mgr /users/hwynn/ncbi/public/sra -c
fastq-dump --outdir $RNApath/raw --split-files ERR2587345
cache-mgr /users/hwynn/ncbi/public/sra -c
fastq-dump --outdir $RNApath/raw --split-files ERR2587344
cache-mgr /users/hwynn/ncbi/public/sra -c
fastq-dump --outdir $RNApath/raw --split-files ERR2587339
cache-mgr /users/hwynn/ncbi/public/sra -c
fastq-dump --outdir $RNApath/raw --split-files ERR2587338
cache-mgr /users/hwynn/ncbi/public/sra -c
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587348_1.fastq $RNApath/raw/ERR2587348_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587348
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587347_1.fastq $RNApath/raw/ERR2587347_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587347
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587343_1.fastq $RNApath/raw/ERR2587343_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587343
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587342_1.fastq $RNApath/raw/ERR2587342_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587342
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587341_1.fastq $RNApath/raw/ERR2587341_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587341
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587340_1.fastq $RNApath/raw/ERR2587340_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587340
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587346_1.fastq $RNApath/raw/ERR2587346_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587346
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587345_1.fastq $RNApath/raw/ERR2587345_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587345
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587344_1.fastq $RNApath/raw/ERR2587344_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587344
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587339_1.fastq $RNApath/raw/ERR2587339_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587339
STAR --genomeDir $RNApath/genome/ \
--readFilesIn $RNApath/raw/ERR2587338_1.fastq $RNApath/raw/ERR2587338_2.fastq \
--runThreadN 32 --outSAMtype BAM Unsorted --outFileNamePrefix $RNApath/map/ERR2587338
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587348Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587348-out.counts
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587347Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587347-out.counts
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587343Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587343-out.counts
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587342Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587342-out.counts
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587341Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587341-out.counts
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587340Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587340-out.counts
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587346Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587346-out.counts
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587345Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587345-out.counts
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587344Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587344-out.counts
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587339Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587339-out.counts
htseq-count -s no -r pos -f bam $RNApath/map/ERR2587338Aligned.out.bam \
$RNApath/genome/annotations/Homo_sapiens.GRCh38.86.gtf > $RNApath/counts/ERR2587338-out.counts