## getting the current working directory
getwd()
## setting the new working directory which is the data folder
setwd("C:/Users/City of Tagum/Documents/data")
## testing if the directory exists
if(!file.exists("./data")){dir.create("./data")}
## putting the file url
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## downloading the file
download.file(fileUrl,destfile="./data/Dataset.zip")
## unzip the dataset to the current directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")
## Reading the training tables
xtrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
## Reading the testing tables
xtest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
## Reading the feature vector
features <- read.table('./data/UCI HAR Dataset/features.txt')
## Reading the activity labels
activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
## Assigning names to the columns
colnames(xtrain) <- features[,2] 
colnames(ytrain) <-"activityId"
colnames(subjecttrain) <- "subjectId"

colnames(xtest) <- features[,2] 
colnames(ytest) <- "activityId"
colnames(subjecttest) <- "subjectId"

colnames(activity_labels) <- c('activityId','activityType')
## Merging the data into one
merge_train <- cbind(ytrain, subjecttrain, xtrain)
merge_test <- cbind(ytest, subjecttest, xtest)
setAllInOne <- rbind(merge_train, merge_test)
## Reading the column names
ColumnNames <- colnames(setAllInOne)
## Creating a vector that defines the ID, Mean and the Standard Deviation
meanandstd <- (grepl("activityId" , ColumnNames) | grepl("subjectId" , ColumnNames) | grepl("mean" , ColumnNames) | grepl("std" , ColumnNames) 
)
setformeanandstd <- setAllInOne[ , meanandstd == TRUE]
setwithactivitynames <- merge(setformeanandstd, activity_labels,
                              by='activityId',
                              all.x=TRUE)
## Creating the second tidy set
secondTidySet <- aggregate(. ~subjectId + activityId, setwithactivitynames, mean)
secondTidySet <- secondTidySet[order(secondTidySet$subjectId, secondTidySet$activityId),]
## Making a text file for the second tidy set
write.table(secondTidySet, "tidyset.txt", row.name=FALSE)
