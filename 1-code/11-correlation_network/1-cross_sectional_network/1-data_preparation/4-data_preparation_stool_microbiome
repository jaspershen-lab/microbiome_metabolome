no_source()
library(tidyverse)
library(tidymass)

rm(list = ls())

setwd(r4projects::get_project_wd())

dir.create("3-data_analysis/11-correlation_network/1-cross_sectional_network/1-data_preparation", recursive = TRUE)

#####clinical_test
# Load data
load("3-data_analysis/3-clinical_test/1-data_preparation/clinical_test_data.rda")
clinical_test_data

load("3-data_analysis/2-phenotype//1-data_preparation//phenotype_data.rda")
phenotype_data

clinical_test_data@expression_data  %>% 
dim()

clinical_test_data@expression_data  %>% 
colnames()

rownames(clinical_test_data)

# clinical_test_data[7,]  %>% 
# tidyr::pivot_longer()  %>% 
# dplyr::left_join(clinical_test_data@sample_info, by = c("sample_id"))  %>% 
# dplyr::filter(subject_id == "69-001")  %>% 
# ggplot(aes(x = collection_date, y = value)) +
# geom_point() +
# geom_smooth(method = "loess") +
# theme_bw() 


###remove the subjects only have less than 3 time points (<=3)
remain_subject_id <-
clinical_test_data  %>% 
activate_mass_dataset(what = "sample_info")  %>% 
dplyr::count(subject_id)  %>% 
dplyr::filter(n > 3)  %>%
pull(subject_id) 

remain_subject_id

clinical_test_data <-
clinical_test_data  %>% 
activate_mass_dataset(what = "sample_info")  %>%
dplyr::filter(subject_id %in% remain_subject_id) 

####get the cross sectional data
expression_data <- clinical_test_data@expression_data
sample_info <- clinical_test_data@sample_info 
variable_info <- clinical_test_data@variable_info

dim(expression_data)


expression_data_new <-
unique(sample_info$subject_id)  %>% 
lapply(function(temp_id){
    cat(temp_id, " ")

    sample_id <-
    sample_info  %>% 
    dplyr::filter(subject_id == temp_id)  %>% 
    dplyr::pull(sample_id)

temp_value <-
    expression_data[,sample_id]  %>% 
    apply(1, function(x){median(x, na.rm = T)})


temp_value <-
data.frame(temp_value)

colnames(temp_value) <-
temp_id

temp_value
})  %>% 
do.call(cbind, .)  %>% 
as.data.frame()

rownames(expression_data_new)

sample_info_new <-
sample_info

colnames(sample_info_new) 

sample_info_new <-
sample_info_new  %>% 
dplyr::select(-sample_id)  %>% 
dplyr::rename(sample_id = subject_id)   %>% 
dplyr::distinct(sample_id, .keep_all = T)  %>% 
dplyr::select(sample_id)  %>% 
dplyr::left_join(phenotype_data, by = c("sample_id" = "subject_id"))

sample_info_new$sample_id == colnames(expression_data_new)

dim(variable_info)

head(variable_info)

variable_info_new <-
variable_info

dim(expression_data_new)
dim(sample_info_new)
dim(variable_info_new)

sample_info_new$class <- "Subject"

clinical_test_data <-
create_mass_dataset(expression_data_new, sample_info_new, variable_info_new)

clinical_test_data  

save(clinical_test_data, file = "3-data_analysis/11-correlation_network/1-cross_sectional_network/1-data_preparation/clinical_test_data.rda")




