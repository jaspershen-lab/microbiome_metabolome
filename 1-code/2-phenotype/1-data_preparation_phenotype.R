# This code block disables the sourcing of external files using the `no_source()` function.
no_source()

# This script loads the tidyverse and tidymass libraries for data preparation of phenotype data.
library(tidyverse)
library(tidymass)

# Clear the workspace
rm(list = ls())

# Set the working directory to the current project
setwd(r4projects::get_project_wd())

# Load data
load("3-data_analysis/2-phenotype/1-data_preparation/phenotype_data")

phenotype_data

# Save the phenotype_data object as an .rda file for data analysis.
save(phenotype_data, file = "3-data_analysis/2-phenotype/1-data_preparation/phenotype_data.rda")



