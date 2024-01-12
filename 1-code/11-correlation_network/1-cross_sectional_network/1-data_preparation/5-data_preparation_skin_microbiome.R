no_source()
library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

dir.create("3-data_analysis/11-correlation_network/1-cross_sectional_network/1-data_preparation", recursive = TRUE)

#####skin_microbiome
# Load data
load("3-data_analysis/5-skin_microbiome/1-data_preparation//skin_microbiome_data.rda")
skin_microbiome_data

load("3-data_analysis/2-phenotype//1-data_preparation//phenotype_data.rda")
phenotype_data

dim(skin_microbiome_data)

colnames(skin_microbiome_data)

rownames(skin_microbiome_data)

###remove the subjects only have less than 3 time points (<=3)
remain_subject_id <-
skin_microbiome_data  %>% 
activate_mass_dataset(what = "sample_info")  %>% 
dplyr::count(subject_id)  %>% 
dplyr::filter(n > 3)  %>%
pull(subject_id) 

length(remain_subject_id)

skin_microbiome_data <-
skin_microbiome_data  %>% 
activate_mass_dataset(what = "sample_info")  %>%
dplyr::filter(subject_id %in% remain_subject_id) 

####get the cross sectional data
library(microbiomedataset)

skin_microbiome_data2 <-
skin_microbiome_data

skin_microbiome_data <-
microbiomedataset::summarise_samples(skin_microbiome_data2,
what = "median_intensity",
group_by = "subject_id")

skin_microbiome_data

save(skin_microbiome_data, file = "3-data_analysis/11-correlation_network/1-cross_sectional_network/1-data_preparation/skin_microbiome_data.rda")




