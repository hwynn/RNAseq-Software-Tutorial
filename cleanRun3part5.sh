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
R




library("DESeq2")
directory <- "/home/hwynn/RNAseqExamples/human/counts"
setwd(directory)
outputPrefix <- "human_DESeq2"
sampleFiles<- c("ERR2587301-out.counts","ERR2587302-out.counts","ERR2587303-out.counts","ERR2587304-out.counts","ERR2587305-out.counts","ERR2587306-out.counts")
sampleNames <- c("201STG_CONTROL_3637R_1R1","201STG_CONTROL_3637R_1R2","201STG_CONTROL_3637R_1R3","201STG_ Olaparib-response_6350L_12L1","201STG_ Olaparib-response_6350L_12L2","201STG_ Olaparib-response_6350L_12L3")
sampleCondition <- c("Trniav_modl_treated_w_vehicle","Trniav_modl_treated_w_vehicle","Trniav_modl_treated_w_vehicle","Rsist_modl_treated_w_vehicle","Rsist_modl_treated_w_vehicle","Rsist_modl_treated_w_vehicle")
sampleTable <- data.frame(sampleName = sampleNames, fileName = sampleFiles, condition = sampleCondition)
treatments = c("Trniav_modl_treated_w_vehicle","Rsist_modl_treated_w_vehicle")
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, directory = directory, design = ~ condition)
colData(ddsHTSeq)$condition <- factor(colData(ddsHTSeq)$condition, levels = treatments)
dds <- DESeq(ddsHTSeq)
res <- results(dds)
res= subset(res, padj<0.05)
res <- res[order(res$padj),]
resdata <- merge(as.data.frame(res), as.data.frame(counts(dds,normalized =TRUE)), by = 'row.names', sort = FALSE)
names(resdata)[1] <- 'gene'

#see cleanRun3graph1.sh


#see cleanRun3graph2.sh





