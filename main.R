print("Sinking output text")
sink("output.txt", append=TRUE, split=TRUE)

    # read raw data - should clean first
raw <- read.csv("salary.csv")

    # run linear models
model <- lm(salary~gender+bckgrd_admin,data=raw)

print(model)
print(summary(model))