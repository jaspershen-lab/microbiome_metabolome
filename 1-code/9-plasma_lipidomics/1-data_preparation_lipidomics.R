no_source()

##this is coun data

library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

# Load data
load("3-data_analysis/9-plasma_lipidomics/1-data_preparation/object")

object

lipidomics_data <-
  object

lipidomics_data

save(lipidomics_data, file = "3-data_analysis/9-plasma_lipidomics/1-data_preparation/lipidomics_data.rda")

lipidomics_data@variable_info


dim(lipidomics_data)

