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
#	$homepath		/home/hwynn
#	$RNApath		/home/hwynn/RNAseqExamples/human
#downloading sra files
fastq-dump --outdir $RNApath/raw --split-files ERR2587301
fastq-dump --outdir $RNApath/raw --split-files ERR2587302
fastq-dump --outdir $RNApath/raw --split-files ERR2587303
fastq-dump --outdir $RNApath/raw --split-files ERR2587304
fastq-dump --outdir $RNApath/raw --split-files ERR2587305
fastq-dump --outdir $RNApath/raw --split-files ERR2587306
#trimming files
java -jar $homepath/toolkit/Trimmomatic-0.38/Trimmomatic-0.38/trimmomatic-0.38.jar PE -threads 4 -phred33 -trimlog $RNApath/logs/logFile \
$RNApath/raw/ERR2587301_1.fastq $RNApath/raw/ERR2587301_2.fastq \
$RNApath/trimmed/trim_paired_ERR2587301_1.fastq $RNApath/trimmed/trim_unpaired_ERR2587301_1.fastq $RNApath/trimmed/trim_paired_ERR2587301_2.fastq $RNApath/trimmed/trim_unpaired_ERR2587301_2.fastq \
ILLUMINACLIP:$homepath/toolkit/Trimmomatic-0.38/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:40:15 SLIDINGWINDOW:5:30
java -jar $homepath/toolkit/Trimmomatic-0.38/Trimmomatic-0.38/trimmomatic-0.38.jar PE -threads 4 -phred33 -trimlog $RNApath/logs/logFile \
$RNApath/raw/ERR2587302_1.fastq $RNApath/raw/ERR2587302_2.fastq \
$RNApath/trimmed/trim_paired_ERR2587302_1.fastq $RNApath/trimmed/trim_unpaired_ERR2587302_1.fastq $RNApath/trimmed/trim_paired_ERR2587302_2.fastq $RNApath/trimmed/trim_unpaired_ERR2587302_2.fastq \
ILLUMINACLIP:$homepath/toolkit/Trimmomatic-0.38/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:40:15 SLIDINGWINDOW:5:30
java -jar $homepath/toolkit/Trimmomatic-0.38/Trimmomatic-0.38/trimmomatic-0.38.jar PE -threads 4 -phred33 -trimlog $RNApath/logs/logFile \
$RNApath/raw/ERR2587303_1.fastq $RNApath/raw/ERR2587303_2.fastq \
$RNApath/trimmed/trim_paired_ERR2587303_1.fastq $RNApath/trimmed/trim_unpaired_ERR2587303_1.fastq $RNApath/trimmed/trim_paired_ERR2587303_2.fastq $RNApath/trimmed/trim_unpaired_ERR2587303_2.fastq \
ILLUMINACLIP:$homepath/toolkit/Trimmomatic-0.38/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:40:15 SLIDINGWINDOW:5:203
java -jar $homepath/toolkit/Trimmomatic-0.38/Trimmomatic-0.38/trimmomatic-0.38.jar PE -threads 4 -phred33 -trimlog $RNApath/logs/logFile \
$RNApath/raw/ERR2587304_1.fastq $RNApath/raw/ERR2587304_2.fastq \
$RNApath/trimmed/trim_paired_ERR2587304_1.fastq $RNApath/trimmed/trim_unpaired_ERR2587304_1.fastq $RNApath/trimmed/trim_paired_ERR2587304_2.fastq $RNApath/trimmed/trim_unpaired_ERR2587304_2.fastq \
ILLUMINACLIP:$homepath/toolkit/Trimmomatic-0.38/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:40:15 SLIDINGWINDOW:5:30
java -jar $homepath/toolkit/Trimmomatic-0.38/Trimmomatic-0.38/trimmomatic-0.38.jar PE -threads 4 -phred33 -trimlog $RNApath/logs/logFile \
$RNApath/raw/ERR2587305_1.fastq $RNApath/raw/ERR2587305_2.fastq \
$RNApath/trimmed/trim_paired_ERR2587305_1.fastq $RNApath/trimmed/trim_unpaired_ERR2587305_1.fastq $RNApath/trimmed/trim_paired_ERR2587305_2.fastq $RNApath/trimmed/trim_unpaired_ERR2587305_2.fastq \
ILLUMINACLIP:$homepath/toolkit/Trimmomatic-0.38/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:40:15 SLIDINGWINDOW:5:30
java -jar $homepath/toolkit/Trimmomatic-0.38/Trimmomatic-0.38/trimmomatic-0.38.jar PE -threads 4 -phred33 -trimlog $RNApath/logs/logFile \
$RNApath/raw/ERR2587306_1.fastq $RNApath/raw/ERR2587306_2.fastq \
$RNApath/trimmed/trim_paired_ERR2587306_1.fastq $RNApath/trimmed/trim_unpaired_ERR2587306_1.fastq $RNApath/trimmed/trim_paired_ERR2587306_2.fastq $RNApath/trimmed/trim_unpaired_ERR2587306_2.fastq \
ILLUMINACLIP:$homepath/toolkit/Trimmomatic-0.38/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:40:15 SLIDINGWINDOW:5:30
#we now have trimmed files. Now we remove the untrimmed files
rm $RNApath/trimmed/trim_unpaired_ERR2587301_1.fastq
rm $RNApath/trimmed/trim_unpaired_ERR2587301_2.fastq
rm $RNApath/trimmed/trim_unpaired_ERR2587302_1.fastq
rm $RNApath/trimmed/trim_unpaired_ERR2587302_2.fastq
rm $RNApath/trimmed/trim_unpaired_ERR2587303_1.fastq
rm $RNApath/trimmed/trim_unpaired_ERR2587303_2.fastq
rm $RNApath/trimmed/trim_unpaired_ERR2587304_1.fastq
rm $RNApath/trimmed/trim_unpaired_ERR2587304_2.fastq
rm $RNApath/trimmed/trim_unpaired_ERR2587305_1.fastq
rm $RNApath/trimmed/trim_unpaired_ERR2587305_2.fastq
rm $RNApath/trimmed/trim_unpaired_ERR2587306_1.fastq
rm $RNApath/trimmed/trim_unpaired_ERR2587306_2.fastq