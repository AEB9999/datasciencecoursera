## run_analysis.R
###
### Project to read data metrics from test and training data files
### combine the files by SUbjectID, Activity type, and Data Metrics reading of various 
### triaxial X Y & Z (of acceleration and gyroscopic) metrics for body and totals
### mean, std, analysis.
###
### combine and tidy the data per project specs
### then write the table as a txt
###
###
##  read features list of 561 measures
features <- read.csv("J:/R/mydata/UCI HAR Dataset/features.txt",header=F,sep=" ")
##
##  read activity list of 6 activity types
activity <- read.csv("J:/R/mydata/UCI HAR Dataset/activity_labels.txt",header=F,sep = " ")
##
##  read test files to vectors
measuredata_test <- read.delim("J:/R/mydata/UCI HAR Dataset/test/X_test.txt",col.names="metrics",header=F,sep="\t")
subjectid_test <- read.delim("J:/R/mydata/UCI HAR Dataset/test/subject_test.txt",col.names="subjectid",sep="\t",header=F)
activity_test <- read.delim("J:/R/mydata/UCI HAR Dataset/test/y_test.txt",col.names="activity",sep="\t",header=F)
##
##  read train files to vectors
measuredata_train <- read.delim("J:/R/mydata/UCI HAR Dataset/train/X_train.txt",col.names="metrics",header=F,sep="\t")
subjectid_train <- read.delim("J:/R/mydata/UCI HAR Dataset/train/subject_train.txt",col.names="subjectid",sep="\t",header=F)
activity_train <- read.delim("J:/R/mydata/UCI HAR Dataset/train/y_train.txt",col.names="activity",sep="\t",header=F)
##
##  Combine by columns the test set
combinedtestdataset <- cbind(subjectid_test,activity_test,measuredata_test)
##
##  Combine by columns the traing set
combinedtraindataset <- cbind(subjectid_train,activity_train,measuredata_train)
##
##  Combine rows of the test and training sets
test_train_data_set <- rbind(combinedtestdataset,combinedtraindataset)
##
##  separate out the metrics column into 1 features per column
##total_data_set <- separate(test_train_data_set,metrics, into = features)
##not completed, out of time. will complete but not before 7:30pm
##
## 
##replace activity number with label
# not completed, out of time, will complete but not before 7:30pm
##
## summary of AVG of each variable by activity by student
## not completed, out of time. will completed but not before 7:30pm

## write table to "independent_tidy_dataset.txt
write.table(test_train_data_set, file = "independent_tidy_dataset.txt")

