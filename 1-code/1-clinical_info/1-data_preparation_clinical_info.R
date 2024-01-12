no_source()

library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

# Load data
load("3-data_analysis/1-clinical_info/1-data_preparation/clinical_info")

clinical_info_data <-
clinical_info

clinical_info_data

save(clinical_info_data, file = "3-data_analysis/1-clinical_info/1-data_preparation/clinical_info_data.rda")
