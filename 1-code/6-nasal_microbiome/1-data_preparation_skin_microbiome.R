no_source()

##this is coun data

library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

# Load data
load("3-data_analysis/6-nasal_microbiome/1-data_preparation/object")

object

nasal_microbiome_data <-
  object

nasal_microbiome_data

save(nasal_microbiome_data, file = "3-data_analysis/6-nasal_microbiome/1-data_preparation/nasal_microbiome_data.rda")

nasal_microbiome_data@variable_info
