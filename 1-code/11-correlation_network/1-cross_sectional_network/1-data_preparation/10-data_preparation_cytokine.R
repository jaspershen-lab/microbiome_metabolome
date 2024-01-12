no_source()
library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

dir.create("3-data_analysis/11-correlation_network/1-cross_sectional_network/1-data_preparation", recursive = TRUE)

#####cytokine
# Load data
load("3-data_analysis/10-plasma_cytokine/1-data_preparation/cytokine_data.rda")
cytokine_data

load("3-data_analysis/2-phenotype/1-data_preparation//phenotype_data.rda")
phenotype_data

dim(cytokine_data)

colnames(cytokine_data)

rownames(cytokine_data)

###remove the subjects only have less than 3 time points (<=3)
remain_subject_id <-
cytokine_data  %>% 
activate_mass_dataset(what = "sample_info")  %>% 
dplyr::count(subject_id)  %>% 
dplyr::filter(n > 3)  %>%
pull(subject_id) 

length(remain_subject_id)

cytokine_data <-
cytokine_data  %>% 
activate_mass_dataset(what = "sample_info")  %>%
dplyr::filter(subject_id %in% remain_subject_id) 

###remove Blank and QC
cytokine_data <-
cytokine_data  %>% 
activate_mass_dataset(what = "sample_info")  %>%
dplyr::filter(!is.na(subject_id))

####get the cross sectional data
library(microbiomedataset)

cytokine_data2 <-
cytokine_data

cytokine_data <-
cytokine_data2  %>% 
as.microbiome_dataset()  %>% 
microbiomedataset::summarise_samples(
what = "median_intensity",
group_by = "subject_id")

cytokine_data
cytokine_data@sample_info
save(cytokine_data, file = "3-data_analysis/11-correlation_network/1-cross_sectional_network/1-data_preparation/cytokine_data.rda")




