java -jar /home/hwynn/toolkit/Trimmomatic-0.38/trimmomatic-0.38.jar PE -threads 4 -phred33 -trimlog /home/hwynn/tiny2/logs/logFile \
/home/hwynn/tiny2/raw/SRR1930186_1.fastq /home/hwynn/tiny2/raw/SRR1930186_2.fastq \
/home/hwynn/tiny2/trimmed/trim_paired_SRR1930186_1.fastq /home/hwynn/tiny2/trimmed/trim_unpaired_SRR1930186_1.fastq /home/hwynn/tiny2/trimmed/trim_paired_SRR1930186_2.fastq /home/hwynn/tiny2/trimmed/trim_unpaired_SRR1930186_2.fastq \
ILLUMINACLIP:/home/hwynn/toolkit/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:40:15 SLIDINGWINDOW:5:30

java -jar /home/hwynn/toolkit/Trimmomatic-0.38/trimmomatic-0.38.jar PE -threads 4 -phred33 -trimlog /home/hwynn/tiny2/logs/logFile \
/home/hwynn/tiny2/raw/SRR1930185_1.fastq /home/hwynn/tiny2/raw/SRR1930185_2.fastq \
/home/hwynn/tiny2/trimmed/trim_paired_SRR1930185_1.fastq /home/hwynn/tiny2/trimmed/trim_unpaired_SRR1930185_1.fastq /home/hwynn/tiny2/trimmed/trim_paired_SRR1930185_2.fastq /home/hwynn/tiny2/trimmed/trim_unpaired_SRR1930185_2.fastq \
ILLUMINACLIP:/home/hwynn/toolkit/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:40:15 SLIDINGWINDOW:5:30

java -jar /home/hwynn/toolkit/Trimmomatic-0.38/trimmomatic-0.38.jar PE -threads 4 -phred33 -trimlog /home/hwynn/tiny2/logs/logFile \
/home/hwynn/tiny2/raw/SRR1930184_1.fastq /home/hwynn/tiny2/raw/SRR1930184_2.fastq \
/home/hwynn/tiny2/trimmed/trim_paired_SRR1930184_1.fastq /home/hwynn/tiny2/trimmed/trim_unpaired_SRR1930184_1.fastq /home/hwynn/tiny2/trimmed/trim_paired_SRR1930184_2.fastq /home/hwynn/tiny2/trimmed/trim_unpaired_SRR1930184_2.fastq \
ILLUMINACLIP:/home/hwynn/toolkit/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:40:15 SLIDINGWINDOW:5:203

java -jar /home/hwynn/toolkit/Trimmomatic-0.38/trimmomatic-0.38.jar PE -threads 4 -phred33 -trimlog /home/hwynn/tiny2/logs/logFile \
/home/hwynn/tiny2/raw/SRR1930183_1.fastq /home/hwynn/tiny2/raw/SRR1930183_2.fastq \
/home/hwynn/tiny2/trimmed/trim_paired_SRR1930183_1.fastq /home/hwynn/tiny2/trimmed/trim_unpaired_SRR1930183_1.fastq /home/hwynn/tiny2/trimmed/trim_paired_SRR1930183_2.fastq /home/hwynn/tiny2/trimmed/trim_unpaired_SRR1930183_2.fastq \
ILLUMINACLIP:/home/hwynn/toolkit/Trimmomatic-0.38/adapters/TruSeq3-PE.fa:2:40:15 SLIDINGWINDOW:5:30

rm /home/hwynn/tiny2/trimmed/trim_unpaired_SRR1930186_1.fastq
rm /home/hwynn/tiny2/trimmed/trim_unpaired_SRR1930186_2.fastq
rm /home/hwynn/tiny2/trimmed/trim_unpaired_SRR1930185_1.fastq
rm /home/hwynn/tiny2/trimmed/trim_unpaired_SRR1930185_2.fastq
rm /home/hwynn/tiny2/trimmed/trim_unpaired_SRR1930184_1.fastq
rm /home/hwynn/tiny2/trimmed/trim_unpaired_SRR1930184_2.fastq
rm /home/hwynn/tiny2/trimmed/trim_unpaired_SRR1930183_1.fastq
rm /home/hwynn/tiny2/trimmed/trim_unpaired_SRR1930183_2.fastq