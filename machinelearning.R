data<-read.csv("http://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv",
               stringsAsFactors=F, na.strings=c(NA,"NA","#DIV/0!"))
library(caret)
library(randomForest)

data<-data[,8:160]
data$classe <- as.factor(data$classe)
inTrain<-createDataPartition(y=data$classe,p=0.75,list=FALSE)
training<-data[inTrain,]
testing<-data[-inTrain,]
model <- randomForest(classe~.,data=training,ntree=100,na.action=na.roughfix)

