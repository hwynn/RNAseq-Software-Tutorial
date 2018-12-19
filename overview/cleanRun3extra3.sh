 #!/bin/bash
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