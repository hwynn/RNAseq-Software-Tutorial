library("DESeq2")
directory <- "/home/hwynn/RNAseqExamples/human/counts"
setwd(directory)
outputPrefix <- "human_DESeq2"
sampleFiles<- c("ERR2587301-out.counts","ERR2587302-out.counts","ERR2587303-out.counts","ERR2587304-out.counts","ERR2587305-out.counts","ERR2587306-out.counts")
sampleNames <- c("201STG_CONTROL_3637R_1R1","201STG_CONTROL_3637R_1R2","201STG_CONTROL_3637R_1R3","201STG_ Olaparib-response_6350L_12L1","201STG_ Olaparib-response_6350L_12L2","201STG_ Olaparib-response_6350L_12L3")
sampleCondition <- c("TxNiav_modl_trt_w_vehicle","TxNiav_modl_trt_w_vehicle","TxNiav_modl_trt_w_vehicle","Rsist_modl_treated_w_vehicle","Rsist_modl_treated_w_vehicle","Rsist_modl_treated_w_vehicle")
sampleTable <- data.frame(sampleName = sampleNames, fileName = sampleFiles, condition = sampleCondition)
treatments = c("TxNiav_modl_trt_w_vehicle","Rsist_modl_treated_w_vehicle")
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, directory = directory, design = ~ condition)
colData(ddsHTSeq)$condition <- factor(colData(ddsHTSeq)$condition, levels = treatments)
dds <- DESeq(ddsHTSeq)
res <- results(dds)
res= subset(res, padj<0.05)
res <- res[order(res$padj),]
resdata <- merge(as.data.frame(res), as.data.frame(counts(dds,normalized =TRUE)), by = 'row.names', sort = FALSE)
names(resdata)[1] <- 'gene'
write.csv(resdata, file = paste0(outputPrefix, "norm-results1.csv"))
write.table(as.data.frame(counts(dds),normalized=T), file = paste0(outputPrefix, "_normalized_counts1.txt"), sep = '\t')
mcols(res, use.names = T)
write.csv(as.data.frame(mcols(res, use.name = T)),file = paste0(outputPrefix, "-test-conditions1.csv"))
ddsClean <- replaceOutliersWithTrimmedMean(dds)
ddsClean <- DESeq(ddsClean)
tab <- table(initial = results(dds)$padj < 0.05,cleaned = results(ddsClean)$padj < 0.05)
addmargins(tab)
write.csv(as.data.frame(tab),file = paste0(outputPrefix, "-replaceoutliers1.csv"))
resClean <- results(ddsClean)
resClean = subset(res, padj<0.05)
resClean <- resClean[order(resClean$padj),]
write.csv(as.data.frame(resClean),file = paste0(outputPrefix, "-replaceoutliers-results1.csv"))
png(filename="/home/hwynn/RNAseqExamples/human/counts/MAinitial_analysis1.png")
plotMA(dds, ylim=c(-8,8),main = "RNAseq experiment1")
dev.off()

rld <- rlogTransformation(dds, blind=T)
vsd <- varianceStabilizingTransformation(dds, blind=T)
write.table(as.data.frame(assay(rld),file = paste0(outputPrefix, "-rlog-transformed-counts1.txt"), sep = '\t'))
write.table(as.data.frame(assay(vsd),file = paste0(outputPrefix, "-vst-transformed-counts1.txt"), sep = '\t'))
par(mai = ifelse(1:4 <= 2, par('mai'),0))
px <- counts(dds)[,1] / sizeFactors(dds)[1]
ord <- order(px)
ord <- ord[px[ord] < 150]
ord <- ord[seq(1,length(ord),length=50)]
last <- ord[length(ord)]
vstcol <- c('blue','black')
png(filename="/home/hwynn/RNAseqExamples/human/counts/MATvariance_stabilizing1.png")
matplot(px[ord], cbind(assay(vsd)[,1], log2(px))[ord, ],type='l', lty = 1, col=vstcol, xlab = 'n', ylab = 'f(n)')
legend('bottomright',legend=c(expression('variance stabilizing transformation'), expression(log[2](n/s[1]))), fill=vstcol)
dev.off()
library("RColorBrewer")
library("gplots")
distsRL <- dist(t(assay(rld)))
mat <- as.matrix(distsRL)
rownames(mat) <- colnames(mat) <- with(colData(dds), paste(condition, sampleNames, sep=" : "))
#Or if you want conditions use:
#rownames(mat) <- colnames(mat) <- with(colData(dds),condition)
hmcol <- colorRampPalette(brewer.pal(9, "GnBu"))(100)
png(filename="/home/hwynn/RNAseqExamples/human/counts/MAclustering1.png")
heatmap.2(mat, trace = "none", col = rev(hmcol), margin = c(13,13))
dev.off()
library("genefilter")
library("ggplot2")
library("grDevices")

rv <- rowVars(assay(rld))
select <- order(rv, decreasing=T)[seq_len(min(500,length(rv)))]
pc <- prcomp(t(assay(vsd)[select,]))

# set condition
condition <- treatments
scores <- data.frame(pc$x, condition)

(pcaplot <- ggplot(scores, aes(x = PC1, y = PC2, col = (factor(condition))))
+ geom_point(size = 5)
+ ggtitle("Principal Components")
+ scale_colour_brewer(name = " ", palette = "Set1")
+ theme(
  plot.title = element_text(face = 'bold'),
  legend.position = c(.9,.2),
  legend.key = element_rect(fill = 'NA'),
  legend.text = element_text(size = 10, face = "bold"),
  axis.text.y = element_text(colour = "Black"),
  axis.text.x = element_text(colour = "Black"),
  axis.title.x = element_text(face = "bold"),
  axis.title.y = element_text(face = 'bold'),
  panel.grid.major.x = element_blank(),
  panel.grid.major.y = element_blank(),
  panel.grid.minor.x = element_blank(),
  panel.grid.minor.y = element_blank(),
  panel.background = element_rect(color = 'black',fill = NA)
))

ggsave(pcaplot,file=paste0(outputPrefix, "-ggplot21.pdf"))

# scatter plot of rlog transformations between Sample conditions
# nice way to compare control and experimental samples
head(assay(rld))
# plot(log2(1+counts(dds,normalized=T)[,1:2]),col='black',pch=20,cex=0.3, main='Log2 transformed')
plot(assay(rld)[,1:3],col='#00000020',pch=20,cex=0.3, main = "rlog transformed")
plot(assay(rld)[,2:4],col='#00000020',pch=20,cex=0.3, main = "rlog transformed")
plot(assay(rld)[,6:5],col='#00000020',pch=20,cex=0.3, main = "rlog transformed")

# heatmap of data
library("RColorBrewer")
library("gplots")
# 1000 top expressed genes with heatmap.2
select <- order(rowMeans(counts(ddsClean,normalized=T)),decreasing=T)[1:1000]
my_palette <- colorRampPalette(c("blue",'white','red'))(n=1000)
png(filename="/home/hwynn/RNAseqExamples/human/counts/HEATMAP1.png")
heatmap.2(assay(vsd)[select,], col=my_palette,scale="row",key=T,keysize=1,symkey=T,density.info="none", trace="none",cexCol=0.6, labRow=F,main="1000 Top Expressed Genes Heatmap")
dev.off()
