# Script takes the loadings + evolutionary status file and prune.in file to plot the mean correlation between derived allele status and PC 

# Load libraries
library(data.table)
library(tidyverse)

# Read in files 
all_snps <- fread(snakemake@input[[1]])
all_da <- all_snps %>% na.omit() # Get rid of no info (DA) SNPs 
pruned <- fread(snakemake@input[[2]], header = F)

# Create datatable
loading <- left_join(pruned,all_da, by = c("V1"="V2")) # Keep all pruned SNPs and join on rsID
only_num <- loading[,5:24] * loading$V25 # Multiple loading by -1 if A2 ancestral and 1 if derived 

# Set up empty vectors
gammas <- rep(0,20)
gammas_1 <- rep(0,20)
upper <- rep(0,20)
lower <- rep(0,20)

# Do regression 
for (i in 1:20) {
        
        D = rep(0, nrow(only_num))
        r = rep(0, nrow(only_num))
        t = rep(0, nrow(only_num))
        s = only_num[,i] # Derived loadings
        
        #r[s > 0] = s[s > 0]
        D[s > 0] = 1 
        t[s > 0] = s[s > 0]

        #r[s < 0] = s[s < 0] * -1 
        D[s < 0] = 0 
        t[s < 0] = s[s < 0] * -1  
        
        # mean center
        D_center = D - mean(D)
        t_center = t - mean(t)
        
        # regression
        mod = lm(t_center ~ D_center)
        gammas[i] = as.numeric(mod$coefficients[2])
        
        # confidence intervals 
        ci <- confint(mod)
        upper[i] <- ci[2,2]
        lower[i] <- ci[2,1]
        
        # equivalent
        t_D1 = mean(s[D==1])
        t_D0 = mean(s[D==0])
        pD0 = length(D[D==0])/length(D)
        gammas_1[i] = (pD0 * (t_D1 + t_D0)) / (2 * var(D))
        
}


# Create final data table 
df <- cbind(gammas, gammas_1, lower, upper)
colnames(df) <- c("Regression", "Math", "Lower", "Upper")

# Write to new table
write.table(df, snakemake@output[[1]], quote = F, row.names = F)
