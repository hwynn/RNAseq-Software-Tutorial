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
RNApath=$homepath/RNAseqExamples/human
echo $RNApath
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
