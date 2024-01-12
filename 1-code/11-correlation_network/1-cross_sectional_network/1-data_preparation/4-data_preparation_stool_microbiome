no_source()
library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

dir.create("3-data_analysis/11-correlation_network/1-cross_sectional_network/1-data_preparation", recursive = TRUE)

#####stool_microbiome
# Load data
load("3-data_analysis/4-stool_microbiome//1-data_preparation//stool_microbiome_data.rda")
stool_microbiome_data

load("3-data_analysis/2-phenotype//1-data_preparation//phenotype_data.rda")
phenotype_data

dim(stool_microbiome_data)

colnames(stool_microbiome_data)

rownames(stool_microbiome_data)

###remove the subjects only have less than 3 time points (<=3)
remain_subject_id <-
stool_microbiome_data  %>% 
activate_mass_dataset(what = "sample_info")  %>% 
dplyr::count(subject_id)  %>% 
dplyr::filter(n > 3)  %>%
pull(subject_id) 

length(remain_subject_id)

stool_microbiome_data <-
stool_microbiome_data  %>% 
activate_mass_dataset(what = "sample_info")  %>%
dplyr::filter(subject_id %in% remain_subject_id) 

####get the cross sectional data
expression_data <- stool_microbiome_data@expression_data
sample_info <- stool_microbiome_data@sample_info 
variable_info <- stool_microbiome_data@variable_info

dim(expression_data)

class(stool_microbiome_data)

library(microbiomedataset)

stool_microbiome_data2 <-
stool_microbiome_data

stool_microbiome_data <-
microbiomedataset::summarise_samples(stool_microbiome_data2,
what = "median_intensity",
group_by = "subject_id")

stool_microbiome_data

save(stool_microbiome_data, file = "3-data_analysis/11-correlation_network/1-cross_sectional_network/1-data_preparation/stool_microbiome_data.rda")




