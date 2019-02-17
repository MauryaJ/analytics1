#modeling 
# linear programming- simple, multiple
#y ~ x1 (SLR); y~ x1+x2....(MLR)
#y- Dependent Variable, x - Independent

head(women)
# y~ weight, x~ height
cor(women$height, women$weight)
#correlation tells us the strength of relation (-1,0,1) like highly(1) related or weakly(0)
cov(women$height, women$weight)
#covariance tells us the direction of relation like positive or negative
# for example here it is positive means weight increases with height
plot(women$height, women$weight)
fit1= lm(weight ~ height, data= women)
# lm is a command to do linear modelling
summary(fit1)
#F stats Pvalue << 0.05 : linear model exist
#at least 1 independent variable is significant in dependent variable

#multiple Rsquare =0.991 Coeff of determination 
# where 0.991 shows 99% of variation in Y is explained by X
# Adjusted Rsquare= 0.9903 
# multiple Rsquare is taken when we have one independent variable otherwise Adjusted Rsquare
# y=mx+c m is slope and c is intercept; y=-87+3.45*height
range(women$height)
# only do interpolation not exterpolation
women$weight
#above are actual values
(y= -87 + 3.45*women$height)
#Predicted values for actual heights
fitted(fit1)
# fitted is a generic function for prediction
residuals(fit1)
# it is the difference between predicted and actual weights
summary(residuals(fit1))
summary(fit1)
# summary of model
newdata1=data.frame(height=c(60.4,55.9))
# the values for which the weight is to be predicted is shown
p1=predict(fit1, newdata=newdata1, type='response')
p1
cbind( newdata1, p1)
# cbind combines data