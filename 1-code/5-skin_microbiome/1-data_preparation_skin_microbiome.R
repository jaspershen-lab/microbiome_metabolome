no_source()

##this is coun data

library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

# Load data
load("3-data_analysis/5-skin_microbiome/1-data_preparation/object")

object

skin_microbiome_data <-
  object

skin_microbiome_data

save(skin_microbiome_data, file = "3-data_analysis/5-skin_microbiome/1-data_preparation/skin_microbiome_data.rda")

skin_microbiome_data@variable_info
