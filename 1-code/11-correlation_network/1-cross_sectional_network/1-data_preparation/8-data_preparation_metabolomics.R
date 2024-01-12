no_source()
library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

dir.create("3-data_analysis/11-correlation_network/1-cross_sectional_network/1-data_preparation", recursive = TRUE)

#####metabolomics
# Load data
load("3-data_analysis/8-plasma_metabolomics//1-data_preparation/metabolite/metabolomics_data.rda")
metabolomics_data

load("3-data_analysis/2-phenotype//1-data_preparation//phenotype_data.rda")
phenotype_data

dim(metabolomics_data)

colnames(metabolomics_data)

rownames(metabolomics_data)

###remove the subjects only have less than 3 time points (<=3)
remain_subject_id <-
metabolomics_data  %>% 
activate_mass_dataset(what = "sample_info")  %>% 
dplyr::count(subject_id)  %>% 
dplyr::filter(n > 3)  %>%
pull(subject_id) 

length(remain_subject_id)

metabolomics_data <-
metabolomics_data  %>% 
activate_mass_dataset(what = "sample_info")  %>%
dplyr::filter(subject_id %in% remain_subject_id) 

###remove Blank and QC
metabolomics_data <-
metabolomics_data  %>% 
activate_mass_dataset(what = "sample_info")  %>%
dplyr::filter(!is.na(subject_id))


####get the cross sectional data
library(microbiomedataset)

metabolomics_data2 <-
metabolomics_data

metabolomics_data <-
metabolomics_data2  %>% 
as.microbiome_dataset()  %>% 
microbiomedataset::summarise_samples(
what = "median_intensity",
group_by = "subject_id")

metabolomics_data
metabolomics_data@sample_info
save(metabolomics_data, file = "3-data_analysis/11-correlation_network/1-cross_sectional_network/1-data_preparation/metabolomics_data.rda")




