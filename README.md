# gettingandcleaningdata
The data used for this project was from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The file used has txt files:
- X_test.txt: rows of feature measurements
- y_test.txt: activity labels corresponding to each row of x
- subject: the subjects on which each row of X was measured
- features.txt: to determine which features are required
- activity_labels.txt: activity label ids to descriptive names

Functions used in the project:
getwd()
-This function was used to know what is the current working directory.
setwd()
-It was used to set the new working directory for the project.
if(!file.exists("./data")){dir.create("./data")}
-This function was used to test whether the data directory exists.
unzip()
-This function was used to unzip the dataset to the current directory
read.table()
-This function was used to create a table out from the .txt file
cbind()
-This function was used to merge the cdata frame by columns
rbind()
-This function was used to merge the data frame by rows
grepl()
-This function was used to create a vector that defines the ID, mean and standard deviation of the data
write.table()
-This function was used to write the second tidy data set in txt file

