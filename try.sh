#!/usr/bin/env bash

#unzip toolkit.zip
pwd
homepath=$(pwd)
echo $homepath
cd toolkit
toolpath=$homepath/toolkit
pwd
echo $toolpath

#-------------------SRAtoolkit
tar -vxzf sratoolkit.tar.gz
#export PATH="$PATH:$toolpath/sratoolkit/sratoolkit.2.9.1-1-ubuntu64/bin"
# ^^ this step must be done by the user ^^
echo "run the following command:"
echo "export PATH=\"\$PATH:$toolpath/sratoolkit/sratoolkit.2.9.1-1-ubuntu64/bin\""









#-------------------Trimmomatic
unzip Trimmomatic-0.38.zip
sudo apt install default-jre #in case java isn't already installed
#sudo apt install openjdk-11-jre-headless
#sudo apt install openjdk-8-jre-headless 

#-------------------SRAtoolkit
tar xvf sratoolkit.current-ubuntu64.tar

#method2
wget --output-document sratoolkit.tar.gz http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz
tar -vxzf sratoolkit.current-ubuntu64.tar.gz
/home/hwynn/toolkit/sratoolkit.current-ubuntu64/sratoolkit.2.9.1-1-ubuntu64/bin


#-------------------SRAtoolkit
tar -vxzf sratoolkit.tar.gz
export PATH="$PATH:$toolpath/sratoolkit/sratoolkit.2.9.1-1-ubuntu64/bin"


#---------------------STAR
unzip STAR-master.zip
#/home/hwynn/toolkit/STAR-master/bin/Linux_x86_64/
echo "export PATH=\"\$PATH:$toolpath/STAR-master/bin/Linux_x86_64/\""


#-------------------HTseq
pip install HTSeq
#pip might not be installed already. crap. 

#-------------------bowtie2

#-------------------Samtools
/home/hwynn/toolkit
tar xvjf samtools-1.8.tar.bz2
mkdir samtools
cd samtools-1.8
./configure --prefix=/home/hwynn/toolkit/samtools/
make
make install
cd /home/hwynn/
export PATH="$PATH:/home/hwynn/toolkit/samtools/bin/"

#-------------------Tophat
#method1 #fuck it just do this
sudo apt-get install tophat
#method2
wget https://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.1.Linux_x86_64.tar.gz
gunzip tophat-2.1.1.Linux_x86_64.tar.gz
tar xvf tophat-2.1.1.Linux_x86_64.tar
#method3


#-------------------BEDtools
#method 1  #fuck it. just use this one
apt-get install bedtools

#method2
wget https://github.com/arq5x/bedtools2/releases/download/v2.25.0/bedtools-2.25.0.tar.gz
tar -zxvf bedtools-2.25.0.tar.gz
cd bedtools2
make   #nope. you can't make without zlib
#method3
apt-get install zlib  #well... you need to be an admin for this shit
apt-get install zlib1g-dev #... same here.
tar -zxvf bedtools-2.27.1.tar.gz
cd bedtools2
make
#export PATH="$PATH:$toolpath/bedtools-2.27.1/sratoolkit.2.9.1-1-ubuntu64/bin"
# ^^ this step must be done by the user ^^
echo "run the following command:"
echo "export PATH=\"\$PATH:$toolpath/bedtools-2.27.1/bedtools2/bin\""

#-------------------R


#-------------------DESeq2

