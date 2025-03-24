#load packages
#some packages may not be necessary for the current analysis
#they were just loaded since they were frequently used in authors' analysis
library(tidyverse)
library(readr)
library(lme4)
library(dplyr)
library(readxl)
library(xlsx)
library(ggplot2)
library(readr)
library(Matrix)
library(lme4)
library(lmerTest)
library(effects)
library(interactions)
installed.packages('readxl')
library(readxl)

#read the data 
mydata <- read.xlsx('data.xlsx',1)
mydata
view(mydata)

#converting ordinal variables into factor vectors
mydata$Part <- as.factor(mydata$Part)
mydata$Part
mydata$Segment <- as.factor(mydata$Segment)
mydata$Segment
mydata$Task <- as.factor(mydata$Task)
mydata$Task
mydata$Expertise <- as.factor(mydata$Expertise)
mydata$Expertise
mydata$MTQuality <- as.factor(mydata$MTQuality)
mydata$MTQuality


#check the normality of the post-editing time
shapiro.test(mydata$Speed)
#p-value < 2.2e-16, requiring transformation of the data

#powertransform PE_Time
install.packages('car')
library(car)
newdf <- mydata
trans <- powerTransform(newdf$Speed)
newdf <- cbind(
  newdf,
  PE_Time = bcPower(
    with(mydata, cbind(Speed)), coef(trans))[, 1])

#check the normality of the transformed data
shapiro.test(newdf$PE_Time)

#p=0.1499>0.05 the post-editing time data is now normally distributed


#build the LMER model with task type (1: without QE; 2: with QE) as fixed effect 
#participants and segments as random effects
#results are reported in 4.1 The Impact of QE on Post-editing Time
LME1 <- lmer(PE_Time~Task+ (1|Part)+(1|Segment), data=newdf,REML = FALSE)
summary(LME1)
plot(allEffects(LME1))

#check residuals for normality
qqnorm(residuals(LME1))
qqline(residuals(LME1))
#residuals are normally distributed

#check homoscedasticity
# Extract residuals
residuals <- resid(LME1)
# Extract fitted values
fitted_values_LME1 <- fitted(LME1)
# Plot residuals vs fitted values
plot(fitted_values_LME1, residuals, main = "Residuals vs Fitted Values",
     xlab = "Fitted Values", ylab = "Residuals")
abline(h = 0, col = "red")
#the assumption of homoscedasticity is satisfied



#build the LMER model with task type (1: without QE; 2: with QE),
#MT quality (2: medium-quality; 3:high-quality), and their interaction as fixed effect
#participants and segments as random effects
#results are reported in 4.2 The Interaction Effect between QE and MT Quality

#as explained in 3.4, one segment being rated as low-quality was excluded
#data2 only contains medium and high-quality MT segments (47 segments in total)
mydata2 <- read.xlsx('data2.xlsx',1)
mydata2
view(mydata2)

#converting ordinal variables into factor vectors
mydata2$Part <- as.factor(mydata2$Part)
mydata2$Part
mydata2$Segment <- as.factor(mydata2$Segment)
mydata2$Segment
mydata2$Task <- as.factor(mydata2$Task)
mydata2$Task
mydata2$Expertise <- as.factor(mydata2$Expertise)
mydata2$Expertise
mydata2$MTQuality <- as.factor(mydata2$MTQuality)
mydata2$MTQuality


#check the normality of the post-editing time
shapiro.test(mydata2$Speed)
#p-value < 2.2e-16, requiring transformation of the data

#powertransform PE_Time
install.packages('car')
library(car)
newdf2 <- mydata2
trans <- powerTransform(newdf2$Speed)
newdf2 <- cbind(
  newdf2,
  PE_Time = bcPower(
    with(mydata2, cbind(Speed)), coef(trans))[, 1])

#check the normality of the transformed data
shapiro.test(newdf2$PE_Time)
#p=0.1621>0.05 the post-editing time data is now normally distributed 


LME2 <- lmer(PE_Time~Task*MTQuality+ (1|Part)+(1|Segment), data=newdf2,REML = FALSE)
summary(LME2)
interaction_effects <- allEffects(LME2)
plot(interaction_effects, multiline = TRUE, ci.style = "bands")

#check residuals for normality
qqnorm(residuals(LME2))
qqline(residuals(LME2))
#residuals are normally distributed

#check homoscedasticity
# Extract residuals
residuals2 <- resid(LME2)
# Extract fitted values
fitted_values_LME2 <- fitted(LME2)
# Plot residuals vs fitted values
plot(fitted_values_LME2, residuals2, main = "Residuals vs Fitted Values",
     xlab = "Fitted Values", ylab = "Residuals")
abline(h = 0, col = "red")
#the assumption of homoscedasticity is satisfied


#build the LMER model with task type (1: without QE; 2: with QE),
#Translation Expertise (2: students with CATTI Level 2; 3:students with CATTI Level 3), and their interaction as fixed effect
#participants and segments as random effects
#results are reported in 4.3 The Interaction Effect between QE and Translation Expertise
LME3 <- lmer(PE_Time~Task*Expertise+ (1|Part)+(1|Segment), data=newdf,REML = FALSE)
summary(LME3)
interaction_effects2 <- allEffects(LME3)
plot(interaction_effects2, multiline = TRUE, ci.style = "bands")

#check residuals for normality
qqnorm(residuals(LME3))
qqline(residuals(LME3))
#residuals are normally distributed

#check homoscedasticity
# Extract residuals
residuals3 <- resid(LME3)
# Extract fitted values
fitted_values_LME3 <- fitted(LME3)
# Plot residuals vs fitted values
plot(fitted_values_LME3, residuals3, main = "Residuals vs Fitted Values",
     xlab = "Fitted Values", ylab = "Residuals")
abline(h = 0, col = "red")
#the assumption of homoscedasticity is satisfied

