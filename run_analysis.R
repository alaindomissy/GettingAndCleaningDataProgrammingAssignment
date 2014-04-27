## Peer assessment project for the Getting and Cleaning Data course 
## by Jeffery Leek from Johns Hopkins University] 
## This course is part of the Coursera Data Science Signature Track.


## Needed R packages
library(plyr)
library(reshape2)


## Read input data files into dataframes
## -------------------------------------
# using colClasses for activities and featires ensure we get a vector class of character and not factor, which is a first step towards meaningful values
activities<-read.table("./input/activity_labels.txt", colClasses=c("integer","character"),col.names=c("activityid","activityraw"))
features<-read.table("./input/features.txt",colClasses=c("integer","character"),col.names=c("featureid","featureraw"))

testsubjects<-read.table("./input/test/subject_test.txt", col.names=c("subject") )
testlabels<-read.table("./input/test/y_test.txt", col.names=c("activityid") )
testattributes<-read.table("./input/test/X_test.txt")

trainsubjects<-read.table("./input/train/subject_train.txt", col.names=c("subject") )
trainlabels<-read.table("./input/train/y_train.txt", col.names=c("activityid") )
trainattributes<-read.table("./input/train/X_train.txt")

## Combine training and test sets into a single data set
## -----------------------------------------------------
subjects<-rbind(testsubjects,trainsubjects)
labels<-rbind(testlabels,trainlabels)
attributes<-rbind(testattributes,trainattributes)


## Clean activities: lowercase and remove _ :
## (Uses descriptive activity names to name the activities in the data set)
## ------------------------------------------------------------------------
activities$activityclean<-gsub("_","",tolower(activities$activityraw))

## Clean labels: decode and use tidy name activities
## (Appropriately labels the data set with descriptive activity names)
## -------------------------------------------------------------------
labels$activity <- activities[labels$activityid,"activityclean"]



## Clean features: lowercase and remove ,-()
## -----------------------------------------
features$featureclean <- gsub(",|-|\\(|\\)","",tolower(features$featureraw) )

## Find features which have mean() or std() in their name (before clean up)
## ----------------------------------------------------------------------
features$ismeanorstd <- grepl("mean\\(\\)|std\\(\\)", features$featureraw )
selectedfeatures <- which(features$ismeanorstd)


## Extract from attributes only the mean and standard deviation variables
## ----------------------------------------------------------------------
tidydataset1<-cbind(subjects, labels[,"activity"],attributes[selectedfeatures] )
names(tidydataset1)<-c("subject","activity", features$featureclean[selectedfeatures] )


## Write tidy1 into space-delimited text file tidy1.txt
## ----------------------------------------------------
write.table(tidydataset1, "tidydataset1.txt", row.names = FALSE) 



## Calculate means by subject and activity
## ------------------------------------------
## convert to long format
longformat <- melt(tidydataset1, id=c("subject", "activity"))
## calculate the means summarizing by  subject and activity
means <- ddply(longformat, .(subject, activity, variable),  summarize,  value = mean(value))
## convert back from long to wide format
tidydataset2 <- dcast(means, subject + activity ~ variable) 

## Write tidydataset2 into space-delimited text file tidy2.txt
write.table(tidydataset2, "tidydataset2.txt",  row.names = FALSE) 

