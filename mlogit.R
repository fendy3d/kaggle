setwd("/Users/fendylieanata/Dropbox/ESD_Term 8/40.220 Analytics Edge/kaggle")
train <- read.csv("train.csv")
test <- read.csv("test.csv")
library(mlogit)
traindata <- mlogit.data(train, shape = "wide", choice = "Choice", varying = c(4:83), sep = "", alt.levels = c("Ch1","Ch2","Ch3","Ch4"), id.var = "Case")
# testdata <- mlogit.data(test, shape = "wide", choice = "Choice", varying = c(4:83), sep = "", alt.levels = c("Ch1","Ch2","Ch3","Ch4"), id.var = "Case")
model1 <- mlogit(Choice~CC+GN+NS+BU+FA+LD+BZ+FC+FP+RP+PP+KA+SC+TS+NV+MA+LB+AF+HU+Price-1, data=traindata)
grep("CC", colnames(testdata)) #21
grep("Price", colnames(testdata)) #40
grep("Choice", colnames(testdata)) #19
predict(model1,newdata=testdata[,c(19,21:41)])

write.table(fitted(model1,outcome=F),file="mlogit.csv", sep=",",row.names = FALSE)












