install.packages("splitstackshape", repos="http://cran.rstudio.com/")
library("splitstackshape")
install.packages("qdapTools", repos="http://cran.rstudio.com/")
library(qdapTools)

raw <- read.csv("salarydata6_20.csv")

new_data<-mtabulate(as.data.frame(t(cSplit(raw, 'Certifications', sep = ';', 'wide'))))
new_data<-mtabulate(as.data.frame(t(cSplit(raw, 'customer_type', sep = ';', 'wide'))))
new_data<-mtabulate(as.data.frame(t(cSplit(raw, 'skills', sep = ';', 'wide'))))
new_data<-mtabulate(as.data.frame(t(cSplit(raw, 'SFDC_prod', sep = ';', 'wide'))))
new_data<-mtabulate(as.data.frame(t(cSplit(raw, 'background', sep = ';', 'wide'))))

write.csv(new_data,"salary.csv")

# after dt is converted, do analysis
