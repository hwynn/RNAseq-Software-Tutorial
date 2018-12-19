library("DESeq2")
directory <- "/home/hwynn/RNAseqExamples/human/counts"
setwd(directory)
outputPrefix <- "breast_cancer"
sampleFiles<- c("ERR2587301-out.counts","ERR2587302-out.counts","ERR2587303-out.counts","ERR2587304-out.counts","ERR2587305-out.counts","ERR2587306-out.counts","ERR2587346-out.counts","ERR2587345-out.counts","ERR2587344-out.counts","ERR2587339-out.counts","ERR2587338-out.counts","ERR2587348-out.counts","ERR2587347-out.counts","ERR2587343-out.counts","ERR2587342-out.counts","ERR2587341-out.counts","ERR2587340-out.counts")
sampleNames <- c("201STG_CONTROL_3637R_1R1","201STG_CONTROL_3637R_1R2","201STG_CONTROL_3637R_1R3","201STG_ Olaparib-response_6350L_12L1","201STG_ Olaparib-response_6350L_12L2","201STG_ Olaparib-response_6350L_12L3","178_16 201STG OLAP OR 14L","552_17 201STG OR Cntl 1R","552_17 201STG OR Cntl 4R","552_17201STG OR Cntl 3R","552_17 201STG OR Cntl 1L","552_17 201STG OR Olap 11R","552_17 201STG OR Olap 13R","552_17 201STG OR Olap 15R","552_17 201STG OR Olap 12L","552_17 201STG OR Olap 14R","552_17 201STG OR Olap 15L")
sampleCondition <- c("TxNiav_modl_trt_w_vehicle","TxNiav_modl_trt_w_vehicle","TxNiav_modl_trt_w_vehicle","Rsist_modl_trt_w_vehicle","Rsist_modl_trt_w_vehicle","Rsist_modl_trt_w_vehicle","TxNiav_modl_trt_w_parpInh","TxNiav_modl_trt_w_parpInh","TxNiav_modl_trt_w_parpInh","TxNiav_modl_trt_w_parpInh","TxNiav_modl_trt_w_parpInh","Rsist_modl_trt_w_parpInh","Rsist_modl_trt_w_parpInh","Rsist_modl_trt_w_parpInh","Rsist_modl_trt_w_parpInh","Rsist_modl_trt_w_parpInh","Rsist_modl_trt_w_parpInh")
sampleTable <- data.frame(sampleName = sampleNames, fileName = sampleFiles, condition = sampleCondition)
treatments = c("TxNiav_modl_trt_w_vehicle","Rsist_modl_trt_w_vehicle","TxNiav_modl_trt_w_parpInh","Rsist_modl_trt_w_parpInh")
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, directory = directory, design = ~ condition)
colData(ddsHTSeq)$condition <- factor(colData(ddsHTSeq)$condition, levels = treatments)
dds <- DESeq(ddsHTSeq)
res <- results(dds)
res= subset(res, padj<0.05)
res <- res[order(res$padj),]
resdata <- merge(as.data.frame(res), as.data.frame(counts(dds,normalized =TRUE)), by = 'row.names', sort = FALSE)
names(resdata)[1] <- 'gene'
write.csv(resdata, file = paste0(outputPrefix, "norm-results2.csv"))
write.table(as.data.frame(counts(dds),normalized=T), file = paste0(outputPrefix, "_normalized_counts2.txt"), sep = '\t')
mcols(res, use.names = T)
write.csv(as.data.frame(mcols(res, use.name = T)),file = paste0(outputPrefix, "-test-conditions2.csv"))
ddsClean <- replaceOutliersWithTrimmedMean(dds)
ddsClean <- DESeq(ddsClean)
tab <- table(initial = results(dds)$padj < 0.05,cleaned = results(ddsClean)$padj < 0.05)
addmargins(tab)
write.csv(as.data.frame(tab),file = paste0(outputPrefix, "-replaceoutliers2.csv"))
resClean <- results(ddsClean)
resClean = subset(res, padj<0.05)
resClean <- resClean[order(resClean$padj),]
write.csv(as.data.frame(resClean),file = paste0(outputPrefix, "-replaceoutliers-results2.csv"))
png(filename="/home/hwynn/RNAseqExamples/human/counts/MAinitial_analysis2.png")
plotMA(dds, ylim=c(-8,8),main = "PARP-inhibitors applied to BRCA1-null PDX models")
dev.off()

rld <- rlogTransformation(dds, blind=T)
vsd <- varianceStabilizingTransformation(dds, blind=T)
write.table(as.data.frame(assay(rld),file = paste0(outputPrefix, "-rlog-transformed-counts2.txt"), sep = '\t'))
write.table(as.data.frame(assay(vsd),file = paste0(outputPrefix, "-vst-transformed-counts2.txt"), sep = '\t'))
par(mai = ifelse(1:4 <= 2, par('mai'),0))
px <- counts(dds)[,1] / sizeFactors(dds)[1]
ord <- order(px)
ord <- ord[px[ord] < 150]
ord <- ord[seq(1,length(ord),length=50)]
last <- ord[length(ord)]
vstcol <- c('blue','black')
png(filename="/home/hwynn/RNAseqExamples/human/counts/MATvariance_stabilizing2.png")
matplot(px[ord], cbind(assay(vsd)[,1], log2(px))[ord, ],type='l', lty = 1, col=vstcol, xlab = 'n', ylab = 'f(n)')
legend('bottomright',legend=c(expression('variance stabilizing transformation'), expression(log[2](n/s[1]))), fill=vstcol)
dev.off()
library("RColorBrewer")
library("gplots")
distsRL <- dist(t(assay(rld)))
mat <- as.matrix(distsRL)
rownames(mat) <- colnames(mat) <- with(colData(dds), condition)
hmcol <- colorRampPalette(brewer.pal(9, "GnBu"))(100)
png(filename="/home/hwynn/RNAseqExamples/human/counts/MAclustering2.png")
heatmap.2(mat, trace = "none", col = rev(hmcol), margin = c(13,13))
dev.off()
library("genefilter")
library("ggplot2")
library("grDevices")

# heatmap of data
library("RColorBrewer")
library("gplots")
# 1000 top expressed genes with heatmap.2
select <- order(rowMeans(counts(ddsClean,normalized=T)),decreasing=T)[1:1000]
my_palette <- colorRampPalette(c("blue",'white','red'))(n=1000)
png(filename="/home/hwynn/RNAseqExamples/human/counts/HEATMAP2.png")
heatmap.2(assay(vsd)[select,], col=my_palette,scale="row",key=T,keysize=1,symkey=T,density.info="none", trace="none",cexCol=0.6, labRow=F,main="1000 Top Expressed Genes Heatmap")
dev.off()
