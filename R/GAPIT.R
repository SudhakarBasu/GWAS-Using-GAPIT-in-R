# GWAS analysis using GAPIT

# Load necessary libraries
source("http://zzlab.net/GAPIT/GAPIT.library.R")
source("http://zzlab.net/GAPIT/gapit_functions.txt")

# Install and load GAPIT package
install.packages("devtools")
devtools::install_github("jiabowang/GAPIT3", force = TRUE)
library(GAPIT)

# Set default directory
setwd("C:/Users/user/Desktop/github/GWAS_GAPIT")

# Load phenotype file
myPhenotype <- read.table("mdp_traits.txt", head = TRUE)

# Print the structure of the phenotype data frame
str(myPhenotype)

# Load genotype file
myGenotype <- read.table("mdp_genotype.hmp.txt", head = FALSE, comment.char = "")

# Perform GWAS analysis with single model (GLM) "GLM", "MLM", "SUPER", "MLMM", "FarmCPU", "Blink"
myGAPITresults <- GAPIT(
  Y = myPhenotype,
  G = myGenotype,
  PCA.total = 3,
  model = "GLM"    # Choose the GLM model- 
)

# Perform GWAS analysis with multiple models
myGAPITresults <- GAPIT(
  Y = myPhenotype,
  G = myGenotype,
  PCA.total = 3,
  model = c("GLM", "MLM", "SUPER", "MLMM", "FarmCPU", "Blink") # Choose multiple models
)

