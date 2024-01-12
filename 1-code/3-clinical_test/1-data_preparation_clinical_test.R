no_source()

library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

# Load data
load("3-data_analysis/3-clinical_test/1-data_preparation/object")

object

clinical_test_data <-
  object

clinical_test_data

save(clinical_test_data, file = "3-data_analysis/3-clinical_test/1-data_preparation/clinical_test_data.rda")
