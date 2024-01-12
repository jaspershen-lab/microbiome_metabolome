no_source()

##this is coun data

library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

# Load data
load("3-data_analysis/7-oral_microbiome/1-data_preparation/object")

object

oral_microbiome_data <-
  object

oral_microbiome_data

save(oral_microbiome_data, file = "3-data_analysis/7-oral_microbiome/1-data_preparation/oral_microbiome_data.rda")

oral_microbiome_data@variable_info
