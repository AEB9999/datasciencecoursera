##run_analysis.R
Data used was Activity, Subject and X file data for both test and training subjects.
Subject_test, y_test (activity labels) and X_test (calculations from metrics)
Subject_train, y_train (activity labels) and X_train (calculations from metrics)

##Variables list:
features: read features list of 561 measures
activity: list of activity codes and labels
measuredata_test: table data from source file "J:/R/mydata/UCI HAR Dataset/test/X_test.txt"
subjectid_test: table data from source file "J:/R/mydata/UCI HAR Dataset/test/subject_test.txt"
activity_test: table data from source file "J:/R/mydata/UCI HAR Dataset/test/y_test.txt"
measuredata_train: table data from source file"J:/R/mydata/UCI HAR Dataset/train/X_train.txt"
subjectid_train: table data from source file "J:/R/mydata/UCI HAR Dataset/train/subject_train.txt"
activity_train: table data from source file "J:/R/mydata/UCI HAR Dataset/train/y_train.txt"
#### filter out table (test and train) data mesaures that have "std" or "mean" in description
#### summary of AVG of each variable row
fmeasuredata_test:
fmeasuredata_train:
#### Combine by columns the test & train data sets
combinedtestdataset
combinedtraindataset
Combine rows of the test and training sets
test_train_data_set:
## Arrange final dataset by subjectID by Activity and TBL_DF
total_data_set <- tbl_df(arrange(test_train_data_set,subjectid,activity))
write.table(total_data_set, file = "independent_tidy_dataset.txt",row.name = F)
print(cat("run analysis script completed",date(),sep = " @ "))


##run analysis script:
## run_analysis.R
## completed version
print(cat("run analysis script started",date(),sep = " @ "))
##
## read features list of 561 measures
features <- read.csv("J:/R/mydata/UCI HAR Dataset/features.txt",header=F,sep=" ")
## transpose to include in "read.table col.names = features[2,]" parameter for 561 metrics
features <- t(features)
##
##
## read activity list of 6 activity types
activity <- read.csv("J:/R/mydata/UCI HAR Dataset/activity_labels.txt",header=F,sep = " ")
##
##
## read test files to vectors
measuredata_test <- read.table("J:/R/mydata/UCI HAR Dataset/test/X_test.txt", col.names= features[2,],header=FALSE, stringsAsFactors = TRUE)
subjectid_test <- read.table("J:/R/mydata/UCI HAR Dataset/test/subject_test.txt",col.names="subjectid", header=F)
activity_test <- read.table("J:/R/mydata/UCI HAR Dataset/test/y_test.txt",col.names="activity", header=F)
##
##
## read train files to vectors
measuredata_train <- read.table("J:/R/mydata/UCI HAR Dataset/train/X_train.txt",col.names= features[2,], header=FALSE, stringsAsFactors = TRUE)
subjectid_train <- read.table("J:/R/mydata/UCI HAR Dataset/train/subject_train.txt",col.names="subjectid", header=F)
activity_train <- read.table("J:/R/mydata/UCI HAR Dataset/train/y_train.txt",col.names="activity", header=F)
##
##
### replace all 6 activity type numbers with activity label descriptions for activity_test & activity_train
for (i in 1:6){
activity_test$activity <- gsub(activity[i,1],activity[i,2],activity_test$activity)
activity_train$activity <- gsub(activity[i,1],activity[i,2],activity_train$activity)
}
##
##
## filter out table (test and train) data mesaures that have "std" or "mean" in description
fmeasuredata_test <- measuredata_test[,grep("std|mean", colnames(measuredata_test))]
fmeasuredata_train <- measuredata_train[,grep("std|mean", colnames(measuredata_train))]
##
##
## summary of AVG of each variable row
fmeasuredata_test <- mutate(fmeasuredata_test, averages = rowMeans(fmeasuredata_test))
fmeasuredata_train <- mutate(fmeasuredata_train, averages = rowMeans(fmeasuredata_train))
##
##Combine by columns the test & train data sets
combinedtestdataset <- cbind(subjectid_test,activity_test,fmeasuredata_test)
combinedtraindataset <- cbind(subjectid_train,activity_train,fmeasuredata_train)
##
##
## Combine rows of the test and training sets
test_train_data_set <- rbind(combinedtestdataset,combinedtraindataset)
##
##
## Arrange final dataset by subjectID by Activity and TBL_DF
total_data_set <- tbl_df(arrange(test_train_data_set,subjectid,activity))
## write table to "independent_tidy_dataset.txt
write.table(total_data_set, file = "independent_tidy_dataset.txt",row.name = F)
print(cat("run analysis script completed",date(),sep = " @ "))
