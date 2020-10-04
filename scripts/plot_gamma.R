# Script takes the loadings + evolutionary status file and prune.in file to plot the mean correlation between derived allele status and PC 

# Load libraries
library(data.table)
library(tidyverse)
library(latex2exp)

# Read in files 
df <- fread(snakemake@input[[1]])
df <- as.data.frame(df)
df$PC <- seq(1,20)

# Make plot 
pl <- ggplot(df, aes(x=Regression,y=PC)) + geom_point(size = 2, color = "navy") + geom_vline(xintercept = 0, color = "red") + ylab("PC") + scale_y_continuous(minor_breaks = seq(1 , 20, 1), breaks = seq(1, 20, 1)) + xlab(TeX("$\\gamma$")) + theme_bw() + geom_errorbarh(aes(xmin = Lower, xmax = Upper))

# Save plot 
ggsave(snakemake@output[[1]],pl)