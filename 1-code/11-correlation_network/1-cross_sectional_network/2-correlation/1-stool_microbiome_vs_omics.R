no_souce()

library(tidyverse)
library(tidymass)
library(microbiomedataset)

rm(list = ls())

setwd(r4projects::get_project_wd())

#####load data
##stool microbiome
load("3-data_analysis/11-correlation_network//1-cross_sectional_network//1-data_preparation/stool_microbiome_data.rda")
stool_microbiome_data

####metabolome and lipidome
load("3-data_analysis/11-correlation_network//1-cross_sectional_network/1-data_preparation/metabolomics_data.rda")
load("3-data_analysis/11-correlation_network//1-cross_sectional_network/1-data_preparation/lipidomics_data.rda")

metabolomics_data
lipidomics_data

metabolomics_data@variable_info

colnames(metabolomics_data)

###get the interseaction of colnames of stool_Microbiome and metabolomics_data and lipidomics_data

intersect(intersect(colnames(stool_microbiome_data),colnames(metabolomics_data)), colnames(lipidomics_data))




