# Hi friend - R Lessons
# Title	Desired Salary	Current/Last Salary	Gender	Experience Level	Work State/Province	AppExchange Products	Certifications	Customer Type	Work Eligibilty	Skills	SFDC Products	Open to Contract	Background	Industry	Function

raw <- read.csv("salarydata6_20.csv")
ifelse('Admin' %in% raw[,'Certifications'], raw$Admin=1, raw$Admin=0)

    # need to do this for like everything
    # Need to change col values to independent variables
    
model <- lm(Salary~Gender,data=raw)

summary(model)


#### ------ OLD Below

# R Programming

print("Reading Salary CSV data")
raw <- read.csv("salary.csv")

print("Sinking output text")
sink("output.txt", append=TRUE, split=TRUE)

print("Creating subset without clients-na")
input <- subset(raw, funct != "Client/NA")

print("Creating subsets for NY, CA, and MA")
ca_data <- subset(input, state == "CA")
ma_data <- subset(input, state == "MA" || state == "NH" || state == "RI" || state == "ME" || state == "VT")
ny_data <- subset(input, state == "NY" || state == "NJ" || state == "CT")

print("Model for total and states")
model <- lm(input$cur_salary~input$funct, input)
ca_model <- lm(ca_data$cur_salary~ca_data$funct, ca_data)
#ma_model <- lm(ma_data$cur_salary~ma_data$funct, ma_data)
#ny_model <- lm(ny_data$cur_salary~ny_data$funct, ny_data)

print("Start doing outputs")


# Getting and printing all the outputs

print("---- Printing summary of input ----")
print(summary(input))

print("---- Printing Model ----")
print(summary(model))

# California
print("---- Printing Cali input ----")
print(summary(ca_data))

print("---- Printing Cali Model ----")
print(summary(ca_model))

# Mass
print("---- Printing mass summary input ----")
print(summary(ma_data))

#print("---- Printing Mass Model ----")
#print(summary(ma_model))

# NYC
print("---- Printing NY input ----")
print(summary(ny_data))

#print("---- Printing Model ----")
#print(summary(ny_model))