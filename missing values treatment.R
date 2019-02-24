library(Hmisc)

library(rpart)

library(DMwR)

library(mice)



path = 'https://raw.githubusercontent.com/nikhlesh17/Training/master/titanic.csv'

titanic <- read.csv(path)
head(titanic)
is.na(titanic$survived)
#to check is there any missing value
sum(is.na(titanic$survived))
#to check the number of missing values

sapply(titanic,function(x) sum(is.na(x)))
# to find number of missing values in whole data set

mean(titanic$age)
# no value as we have 263 missing values

mean(titanic$age,na.rm = T)

dim(titanic)
#to count number of rows and column
complete.cases(titanic)  # which row have complete data in T/ F

sum(complete.cases(titanic))  # no of rows have which no missing data

sum(!complete.cases(titanic))  # no of rows which have missing data

titanic_cc <- titanic[complete.cases(titanic),]  #rows which are complete

titanic_ncc <- titanic[!complete.cases(titanic),] #rows which have missing values

str(titanic_cc)

str(titanic_ncc)

?complete
# it extract the  complete values

impute(titanic$age,mean)
# filling the the missing values with constant. here it is mean.
?impute

impute(titanic$age,median)

impute(titanic$age,100)



library(DMwR)

knnOutput <- knnImputation(titanic[, !names(titanic) %in% "survived"])  
# it finds other rows with missing values based on the other column.
# as it takes care of all the misisng values in all the columns

anyNA(knnOutput)
sapply (knnOutput, function(x) sum(is.na(x))

# takes time to run

mice1 <- mice(titanic[, !names(titanic) %in% "survived"], method="rf",)  # perform mice imputation, based on random forests.
#This is where we can see the values

mice1$imp$age
# Pick the one which seems fine 

miceOutput <- complete(mice1,1)  # generate the completed data(by default first)

anyNA(miceOutput)