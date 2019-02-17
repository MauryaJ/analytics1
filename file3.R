#my first r file
#comment by starting with #
women
#control+enter to execute command
?women
?mean
# to seek help put ? before the function shown above
mtcars
mean(mtcars$mpg)
#to find mean use above command
mean(mtcars$hp)
names(mtcars)
# to find list of columns or names of variables use names command
colMeans(mtcars)
rowMeans(mtcars)
head(mtcars,1)
# to find details of rows under different heads
head(mtcars)
# to find details of first 6 rows under different heads using head
tail(mtcars)
#to find details of last 6 rows under different heads using head
tail(mtcars,1)
# put 1 after comma to get details of last row
hist(mtcars$mpg)
# use above command to draw histogram of data given
hist(mtcars$mpg, breaks=3)
#use breaks command to increase gap in graph

#vectors
x= c(1,2,5,7)
# "c" joins data and above command create data set
class(x)
#class command tell you the type of the data
x1= c(2L,8L)
# put "L" to make data integer
x3= c('a','Jyotsana','Maurya','FMS')
# use '' to create enter character data
#Dataframe is a combination of vectors(columns)
#using "x=" you create vector of different types of data
class(x3)
x4= c(TRUE, FALSE, T, F)
x5= 1:100000
x6<-2
# use <- to assign value other way to assign value is =
(x7= rnorm(1000000))
hist(x7)
mean(x7)
sd(x7)
length(x7)
plot(density(x7))
hist(x7,freq = F)
points(density(x7))
# use above two commands to have bars and lines together
(x8=rnorm(100, mean=60, sd=10))
hist(x8)
plot(density(x8))
hist(x8, freq=F)
points(density(x8))
library(e1071)
kurtosis(x8)
skewness(x8)



x9= runif(100, 30, 90)
# uniform distribution command runif
?runif
trunc(x9)
# trunc command to remove decimal places
round(x9)
# round command to round off to one decimal point
ceiling(x9)
# ceiling round off to next integer
# floor command round off to previous digit
x10=ceiling(x9)
x10
mean(x10)
median(x10)
sort(x10)
sort(x10, decreasing=T)
# sort command sort data in ascending order
# sort with decreasing equals to False
x10[x10>60]
# the above command will get us the marks greater than 60
x10[1:10]
x10[20:30]
#the above command gets us the value of students positioned from 20th to 30th
x10[-c(1:20)]
# the above command removes first 20 position
x10[c(1,5,7)]



#matrices
m1= matrix(1:24, nrow=6)
# above gives the matrix, 24 is the number of data points
m1
m2= matrix(1:56, ncol=8)
m2
m3= matrix(1:24, ncol=6, byrow=T)
m3
m1
colnames(m3)=month.abb[1:6]
# to give names to columns
m3
rownames(m3)=paste('Product', 1:4, sep='_')
#to give names to rows 
m3
rowMeans(m3)
#to find means of row
colMeans(m3)
rowSums(m3)
colSums(m3)
m1[,1:2]
#to execute only column 1 to 2
m3[1:3,]
# Matrix format (Row,Column) 
m3[,1:3]
m3[c(1,3), ]
colMeans(m3[c(1,3), ])
m3[ ,c('Apr','Jun')]
max(m3)
#to find maximum value
min(m3)




#data.frame
n=30
rollno= paste( 'FMS', 1:30, sep='-')
# Paste command is used to join two types of data or strings
rollno
sname= paste('Student', 1:30, sep='*')
sname
set.seed(1234)
# set.seed assigns equal values to each category
gender= sample (c('M','F'), size=n, replace=T)
# to assign gender to 60 students randomly with equal proportion
table(gender)
set.seed
gender= sample (c('M','F'), size=n, replace=T, prob= c(0.7,0.3))
# to assign gender to 60 students randomly with  proportion of 70:30
table(gender)
#to count the number of gender: female and male here
gender
t1=table(gender)
t1
prop.table(t1)
# to find proportion
prop.table(table(gender))
set.seed(12)
college= sample(c('SRCC','FMS','IIM'), size=n, replace=T, prob=c(0.4,0.3,0.3))
table(college)
t2=table(college)
prop.table(t2)
college
marks1= round(rnorm(n=n, mean=60, sd=10), 0)
?rnorm
marks1
marks2= round(rnorm(n=n, mean=55, sd=15), 0)
marks2
rollno; sname; gender; college; marks1; marks2
#use semicolon to seperate vectors and execute them simultaneously
length(gender)
length(gender)
students= data.frame(rollno, sname, gender, college, marks1,marks2)
students
class(students)
head(students)
students$rollno
# to see just rollno
students [,c(2,5:6)]
students[ ,c('sname','marks1',"marks2")]
str(students)
summary(students)
quantile(students$marks1)
# divide data into segments of 25% 
quantile(students$marks1, probs= seq(0,1,0.1))
#to divide data set into 10% segments
seq(0,1, 0.1)
# to generate sequence with 0.1 interval=> seq( lowest, highest, gap)
quantile(students$marks1, probs= seq(0,1,0.01))
quantile(students$marks1, probs= seq(0,1,0.25))
summary(students)
str(students)
students$rollno= as.character(students$rollno)
# changing type of rollno from factor to characters
students$sname= as.character(students$sname)
summary(students)
str(students)
head(students)
write.csv(students, 'fms.csv', row.names = F)
# to export data to be read in excel
students2= read.csv('fms.csv')
# to import data to R
head(students2)
students3=read.csv(file.choose())
head(students3)
str(students)
head(students)
students[students$marks1>60 , ]
#above shows the students who have scored greater than 60 
students[students$gender== 'F' | students$college == 'SRCC' , ]
#above shows the all the females from SRCC '|' is OR function
students[students$gender== 'F' & students$college == 'SRCC' , ]
# | is a pipeline function
# == sign to check equality
students[students$gender=='M' & students$marks1<50, ]

#highest from all college 
library(dplyr)
students %>% filter(gender=='M' & marks1>60)
# %>% is a pipe filter
#the above command filters data by gender 'M' who scored greater than 60
students %>% filter(gender=='F' & marks1>60)
students %>% group_by(gender) %>% summarise(mean(marks1),mean(marks2))
# to get mean of marks by gender
# %>% is filtering function
students %>% group_by(college) %>% summarise(max(marks1),max(marks2))
students %>% group_by(rollno) %>% summarise(max(marks1),max(marks2))
students %>% filter(college=='FMS') %>% select(marks1, marks2)
students %>% filter(college=='FMS') %>% select(sname,marks1, marks2)
students %>% filter(college=='FMS') %>% select(sname, rollno,marks1, marks2)
students
students %>% group_by(college, gender) %>% summarise(countTotal=n())
#to find out number of students in every college
#What is the percentage of FMS students in the list of top 10 students?
students %>% tally()
#to find out the total no. of students
students %>% group_by(college, gender) %>% summarise(countTotal=n(), mean(marks1), max(marks2))
library(e1071)
TotalMarks= marks1+marks2
TotalMarks
students %>% mutate(TotalMarks)
# Mutate is used to add another column
students %>% mutate(TotalMarks) %>% arrange(-TotalMarks)
#put '-' before vector to arrange in decreasing order
students %>% arrange(-marks1)
students %>% arrange(-marks2)
students %>% mutate(TotalMarks) %>% arrange(-TotalMarks) %>% head(n=5)
# getting top 5 students data
students %>% slice(1:5)
# to get data for first five students
students %>% slice(seq(1,30,2))
# the above prints every alternate row
students %>% sample_n(5)
# above shows random 5 rows
students %>% sample_frac(0.2)
students %>% mutate(TotalMarks) %>% filter(TotalMarks== max(TotalMarks))

