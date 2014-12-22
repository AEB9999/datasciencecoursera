Background:
human motion Data metrics was captured from a samsun galaxy.


Raw Data:
test and training data
by body
by accel
by gyro
along the X Y Z triaxial magnitude and angular velocity
also 
9 file for test and 9 files for training
subject, activity and metrics for each

Data used was Activity, Subject and X file data for both test and training subjects.
Subject_test, y_test (activity labels) and X_test (calculations from metrics)
Subject_train, y_train (activity labels) and X_train (calculations from metrics)


Processed Data:

features: read features list of 561 measures
activity: list of activity codes and labels
measuredata_test: table data from source file "J:/R/mydata/UCI HAR Dataset/test/X_test.txt"
subjectid_test: table data from source file "J:/R/mydata/UCI HAR Dataset/test/subject_test.txt"
activity_test: table data from source file "J:/R/mydata/UCI HAR Dataset/test/y_test.txt"
measuredata_train: table data from source file"J:/R/mydata/UCI HAR Dataset/train/X_train.txt"
subjectid_train: table data from source file "J:/R/mydata/UCI HAR Dataset/train/subject_train.txt"
activity_train: table data from source file "J:/R/mydata/UCI HAR Dataset/train/y_train.txt"

## filter out table (test and train) data mesaures that have "std" or "mean" in description
## summary of AVG of each variable row
fmeasuredata_test: 
fmeasuredata_train:

##Combine by columns the test & train data sets 
combinedtestdataset 
combinedtraindataset

Combine rows of the test and training sets
test_train_data_set:

## Arrange final dataset by subjectID by Activity and TBL_DF
total_data_set <- tbl_df(arrange(test_train_data_set,subjectid,activity))

write.table(total_data_set, file = "independent_tidy_dataset.txt",row.name = F)
print(cat("run analysis script completed",date(),sep = " @ "))
