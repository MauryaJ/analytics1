# Graphs

mtcars
names(mtcars)
table(mtcars$cyl)
table(mtcars$cyl, mtcars$am)
mtcars$mpg

#continous data - histogram, boxplot
hist(mtcars$mpg)
boxplot(mtcars$mpg)
boxplot(mtcars$mpg, horizontal = T)
boxplot(mpg~ gear, data=mtcars,col=1:3)
t1= table(mtcars$gear)
t1
barplot(t1, col=1:3)
barplot(c(10,3,5))
pie(c(10,3,5))
mtcars
head(mtcars)
table(mtcars$cyl, mtcars$am)
students
t2= table(students$gender)
barplot(t2)
pie(t2)
t3= table(students$college)
t3
barplot(t3)
pie(t3, col=1:3)
title('Lucifer owns it', sub='Hell')
