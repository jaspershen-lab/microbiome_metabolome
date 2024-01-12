no_source()

##this is coun data

library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

# Load data
load("3-data_analysis/8-plasma_metabolomics/1-data_preparation/metabolite/object")

object

metabolomics_data <-
  object

metabolomics_data

save(metabolomics_data, file = "3-data_analysis/8-plasma_metabolomics/1-data_preparation/metabolite/metabolomics_data.rda")

metabolomics_data@variable_info


dim(metabolomics_data)

