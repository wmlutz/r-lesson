# install.packages("splitstackshape", repos="http://cran.rstudio.com/")
library("splitstackshape")
# install.packages("qdapTools", repos="http://cran.rstudio.com/")
library(qdapTools)
# install.packages("readr", repos="http://cran.rstudio.com/")
library(readr)

raw <- read.csv("salarydata_raw.csv")

new_data<-cSplit_e(raw, "Certifications", ";", mode = "binary", type = "character", fill = 0)
new_data<-cSplit_e(new_data, "customer_type", ";", mode = "binary", type = "character", fill = 0)
new_data<-cSplit_e(new_data, "skills", ";", mode = "binary", type = "character", fill = 0)
new_data<-cSplit_e(new_data, "SFDC_prod", ";", mode = "binary", type = "character", fill = 0)
new_data<-cSplit_e(new_data, "background", ";", mode = "binary", type = "character", fill = 0)

write.csv(new_data,"salary.csv")