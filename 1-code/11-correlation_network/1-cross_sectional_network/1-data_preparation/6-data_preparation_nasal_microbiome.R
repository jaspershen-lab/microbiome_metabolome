no_source()
library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

dir.create("3-data_analysis/11-correlation_network/1-cross_sectional_network/1-data_preparation", recursive = TRUE)

#####nasal_microbiome
# Load data
load("3-data_analysis/6-nasal_microbiome/1-data_preparation/nasal_microbiome_data.rda")
nasal_microbiome_data

load("3-data_analysis/2-phenotype//1-data_preparation//phenotype_data.rda")
phenotype_data

dim(nasal_microbiome_data)

colnames(nasal_microbiome_data)

rownames(nasal_microbiome_data)

###remove the subjects only have less than 3 time points (<=3)
remain_subject_id <-
nasal_microbiome_data  %>% 
activate_mass_dataset(what = "sample_info")  %>% 
dplyr::count(subject_id)  %>% 
dplyr::filter(n > 3)  %>%
pull(subject_id) 

length(remain_subject_id)

nasal_microbiome_data <-
nasal_microbiome_data  %>% 
activate_mass_dataset(what = "sample_info")  %>%
dplyr::filter(subject_id %in% remain_subject_id) 

####get the cross sectional data
library(microbiomedataset)

nasal_microbiome_data2 <-
nasal_microbiome_data

nasal_microbiome_data <-
microbiomedataset::summarise_samples(nasal_microbiome_data2,
what = "median_intensity",
group_by = "subject_id")

nasal_microbiome_data
nasal_microbiome_data@sample_info
save(nasal_microbiome_data, file = "3-data_analysis/11-correlation_network/1-cross_sectional_network/1-data_preparation/nasal_microbiome_data.rda")




