#partition the data into training and test set

mtcars

nrow(mtcars)

#train-70%, test-30%

sample(x=1:32, size=.7 * 32)

index = sample(x=1:nrow(mtcars), size=.7 * nrow(mtcars), replace=F)
#index stores the sampled row values 
#the replace is false as we have to choose less number 

index

train= mtcars[index,]
#the values which have gotten from mtcars after sampling

test= mtcars[-index,]
#this stores the remaining 30% values

nrow(train)

nrow(test)

nrow(train) + nrow(test)











#-------

data(mtcars)



## 75% of the sample size

smp_size <- floor(0.75 * nrow(mtcars))



## set the seed to make your partition reproducible

set.seed(123)

train_ind <- sample(seq_len(nrow(mtcars)), size = smp_size)



train <- mtcars[train_ind, ]

test <- mtcars[-train_ind, ]



# -----

require(caTools)

set.seed(101) 

sample = sample.split(mtcars$am, SplitRatio = .75)

sample

train = subset(mtcars, sample == TRUE)

test  = subset(mtcars, sample == FALSE)

train; test

table(train$am); table(test$am)



mtcars$id <- 1:nrow(mtcars)

train <- mtcars %>% dplyr::sample_frac(.75)

test  <- dplyr::anti_join(mtcars, train, by = 'id')



library(caret)

intrain<-createDataPartition(y=factor(mtcars$am),p=0.7,list=FALSE)

intrain

training<-mtcars[intrain,]

testing<-mtcars[-intrain,]

training  

testing

table(training$am)

table(testing$am)
women
sample(x=1:nrow(women), size=0.7*nrow(women), replace=F)
index=sample(x=1:nrow(women), size=0.7*nrow(women), replace=F)
index
trainData= women[index, ]
testData= women[-index, ]
nrow(trainData)
nrow(testData)
women[index, ]
fit1= lm(weight~height, data=trainData)
summary(fit1)
p4= predict(fit1, newdata = testData, type= 'response')
p4
cbind(p4,testData$weight)