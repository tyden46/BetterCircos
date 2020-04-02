library(gplots)
library(RColorBrewer)
library(genefilter)
library(ggplot2)
library(gplots)
library(BioCircos)

setwd("C:/Users/tyden46/Desktop")
## Read in the data
allDiff <- read.csv(file="./differentiallyExpressedHERVs.csv", header=TRUE, sep=",")
chromosomes=c('1','2','3','4','5','6',
              '7','8','9','10','11','12',
              '13','14','15','16','17','18',
              '19','20','21','22','X','Y')
sortedchrome=order(nchar(as.character(allDiff$chromosome)),
                   allDiff$chromosome) 

allDiff$chromosome_f = factor(allDiff$chromosome,
                                   levels=c('1','2','3','4','5','6',
                                            '7','8','9','10','11','12',
                                            '13','14','15','16','17','18',
                                            '19','20','21','22','X','Y'))
png(filename="histPlotHERVsFemales.png", width=2000, height=2000)

ggplot(allDiff) + geom_histogram(aes(x=log2FoldChange))+
  aes(fill= as.factor(chromosome_f))+
  facet_wrap(~chromosome_f) +
  theme_grey() +
  labs(fill = "chromosomes") +
  ggtitle(paste("Differential HERV Expression", "Between Alzheimer's and Control",  "By Chromosome", "In Females", sep="\n")) +
  theme(plot.title = element_text(hjust = 0.5, size=90),
        plot.subtitle = element_text(hjust = 0.5, size=40),
        axis.text = element_text(size=40, angle=90),
        axis.title = element_text(size=40), legend.text = element_text(size=30, hjust=0),
        legend.title = element_text(size=40, hjust=0),
        strip.text.x = element_text(size=40))
dev.off()