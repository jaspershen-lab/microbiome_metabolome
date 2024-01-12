no_source()
library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

dir.create("3-data_analysis/11-correlation_network/1-cross_sectional_network/1-data_preparation", recursive = TRUE)

#####lipidomics
# Load data
load("3-data_analysis/9-plasma_lipidomics/1-data_preparation/lipidomics_data.rda")
lipidomics_data

load("3-data_analysis/2-phenotype/1-data_preparation//phenotype_data.rda")
phenotype_data

dim(lipidomics_data)

colnames(lipidomics_data)

rownames(lipidomics_data)

###remove the subjects only have less than 3 time points (<=3)
remain_subject_id <-
lipidomics_data  %>% 
activate_mass_dataset(what = "sample_info")  %>% 
dplyr::count(subject_id)  %>% 
dplyr::filter(n > 3)  %>%
pull(subject_id) 

length(remain_subject_id)

lipidomics_data <-
lipidomics_data  %>% 
activate_mass_dataset(what = "sample_info")  %>%
dplyr::filter(subject_id %in% remain_subject_id) 

###remove Blank and QC
lipidomics_data <-
lipidomics_data  %>% 
activate_mass_dataset(what = "sample_info")  %>%
dplyr::filter(!is.na(subject_id))


####get the cross sectional data
library(microbiomedataset)

lipidomics_data2 <-
lipidomics_data

lipidomics_data <-
lipidomics_data2  %>% 
as.microbiome_dataset()  %>% 
microbiomedataset::summarise_samples(
what = "median_intensity",
group_by = "subject_id")

lipidomics_data
lipidomics_data@sample_info
save(lipidomics_data, file = "3-data_analysis/11-correlation_network/1-cross_sectional_network/1-data_preparation/lipidomics_data.rda")




