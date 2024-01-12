no_source()

##this is coun data

library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

# Load data
load("3-data_analysis/4-stool_microbiome/1-data_preparation/object")

object

stool_microbiome_data <-
  object

save(stool_microbiome_data, file = "3-data_analysis/4-stool_microbiome/1-data_preparation/stool_microbiome_data.rda")

stool_microbiome_data@variable_info
