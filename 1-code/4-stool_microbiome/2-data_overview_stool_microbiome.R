no_source()

##this is coun data

library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

# Load data
load("3-data_analysis/4-stool_microbiome/1-data_preparation/stool_microbiome_data.rda")

dir.create("3-data_analysis/4-stool_microbiome/2-data_overview", recursive = TRUE)

setwd("3-data_analysis/4-stool_microbiome/2-data_overview")

stool_microbiome_data

dim(stool_microbiome_data)

variable_info <-
extract_variable_info(stool_microbiome_data)

variable_info

colnames(variable_info)

length(unique(variable_info$Genus))
length(unique(variable_info$Phylum))

plot(as.numeric(table(variable_info$Genus)))

class(stool_microbiome_data)
library(microbiomedataset)

stool_microbiome

stool_microbiome_data  %>% 
activate_microbiome_dataset(what = "variable_info")  %>% 
microbiomedataset::mutate2variable(what = "na_prop")  %>% 
extract_variable_info()  %>% 
pull(na_prop)

stool_microbiome_data$`69-023-1012`

library(massdatabase)



