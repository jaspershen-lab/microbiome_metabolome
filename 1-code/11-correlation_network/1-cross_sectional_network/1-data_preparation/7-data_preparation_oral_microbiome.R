no_source()
library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

dir.create("3-data_analysis/11-correlation_network/1-cross_sectional_network/1-data_preparation", recursive = TRUE)

#####oral_microbiome
# Load data
load("3-data_analysis/7-oral_microbiome/1-data_preparation/oral_microbiome_data.rda")
oral_microbiome_data

load("3-data_analysis/2-phenotype//1-data_preparation//phenotype_data.rda")
phenotype_data

dim(oral_microbiome_data)

colnames(oral_microbiome_data)

rownames(oral_microbiome_data)

###remove the subjects only have less than 3 time points (<=3)
remain_subject_id <-
oral_microbiome_data  %>% 
activate_mass_dataset(what = "sample_info")  %>% 
dplyr::count(subject_id)  %>% 
dplyr::filter(n > 3)  %>%
pull(subject_id) 

length(remain_subject_id)

oral_microbiome_data <-
oral_microbiome_data  %>% 
activate_mass_dataset(what = "sample_info")  %>%
dplyr::filter(subject_id %in% remain_subject_id) 

####get the cross sectional data
library(microbiomedataset)

oral_microbiome_data2 <-
oral_microbiome_data

oral_microbiome_data <-
microbiomedataset::summarise_samples(oral_microbiome_data2,
what = "median_intensity",
group_by = "subject_id")

oral_microbiome_data
oral_microbiome_data@sample_info
save(oral_microbiome_data, file = "3-data_analysis/11-correlation_network/1-cross_sectional_network/1-data_preparation/oral_microbiome_data.rda")




