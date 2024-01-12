no_source()

##this is coun data

library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

# Load data
load("3-data_analysis/10-plasma_cytokine/1-data_preparation/object")

object

cytokine_data <-
  object

cytokine_data

save(cytokine_data, file = "3-data_analysis/10-plasma_cytokine/1-data_preparation/cytokine_data.rda")

cytokine_data@variable_info

dim(cytokine_data)

