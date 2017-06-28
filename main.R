print("Sinking output text")
sink("output.txt", append=TRUE, split=TRUE)

    # read raw data - should clean first
raw <- read.csv("salary.csv")

    # segment out states I care about
states_I_want<-c("AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY","DC")
just_states<-raw[raw$state %in% states_I_want,]

    # Basic model
model <- lm(salary~gender+exper+state+fn,data=just_states)
print(summary(model))

    # Just NY
print("New York City Area data only")
states_I_want<-c("NY", "NJ", "CT")
just_ny<-raw[raw$state %in% states_I_want,]
model <- lm(salary~gender+exper+fn,data=just_ny)
print(summary(model))

    # Just CA
print("California data only")
just_ca<-raw[raw$state == "CA",]
model <- lm(salary~gender+exper+fn,data=just_ca)
print(summary(model))

    # Just MA
print("Massachusetts Area data only")
states_I_want<-c("MA", "RI", "VT", "NH", "ME")
just_ma<-raw[raw$state %in% states_I_want,]
model <- lm(salary~gender+exper+fn,data=just_ma)
print(summary(model))

#vif(model)
#if vif>10, then multicollinearity is an issue
# pull out highest vifs systematically until not an issue
