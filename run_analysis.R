#run_analysis.R
#for Coursera/Johns Hopkins University Getting and Cleaning Data Project

#Step (0) Data preparation
#importing dataset and unzipping files
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "temp.zip", method = "wininet")
unzip("temp.zip")
list.files()
#[1] "Coursera_GCD_Project.Rproj" "GCD_Project_Comments.R"
#[3] "temp.zip"   "UCI HAR Dataset"
## /UCI HAR Dataset is an unzipped directory containing documentation and further
## sub-directories with data

#importing data from sub-directories
setwd("~/R/data/Coursera_GCD_Project/UCI HAR Dataset/test")
##read data from files into data.frames
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")
setwd("~/R/data/Coursera_GCD_Project/UCI HAR Dataset/train")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

##Step(1) Merging training and test sets
##merging columns in test and training sets
##use cbind()
test_set <- cbind(subject_test, y_test, x_test)
training_set <- cbind(subject_train, y_train, x_train)

##merging test and training sets by rows
##use rbind()
merged_set <- rbind(training_set, test_set)
##merged_set has columns: subject, training/test labels, and 561 feature columns
##merged_set has training before test #seems reasonable in machine learning
##merged_set 10299 rows (training and test), 2 label variables + 561 features

##In /UCI HAR Dataset top directory
##features.txt describes the 561 features
##only some involve mean or standard deviation (std)
##these need to be extracted
setwd("~/R/data/Coursera_GCD_Project/UCI HAR Dataset")
feature_names <- read.table("features.txt")

##added rows for "subject" and "label"
temp_df <- data.frame(V1="0", V2="subject")
temp_df2 <- data.frame(V1="0", V2="label")
feature_names <- rbind(temp_df, temp_df2, feature_names)
##what does feature_names look like?
head(feature_names)
#    V1                V2
#1    0           subject
#2    0             label
#4 <NA> tBodyAcc-mean()-X
#5 <NA> tBodyAcc-mean()-Y
#6 <NA> tBodyAcc-mean()-Z
#7 <NA>  tBodyAcc-std()-X
##V2 ##unnamed is the one needed

##cleaned up data
rm("temp_df")
rm("temp_df2")

##added column names to merged_set
colnames(merged_set) <- as.character(feature_names$V2)

##Step (2) Extract only the measurements on the mean and standard deviation for 
#each measurement
new_merged <- merged_set[,union(grep("mean", names(merged_set), value = TRUE), grep("std", names(merged_set), value = TRUE))]

#additional use of grep() removes "meanFreq()" #contains mean
new_merged2 <- new_merged[,-grep("meanFreq", names(new_merged))]

##produces a data.frame new_merged2 with 10299 observations (training + test)
##of 66 variables (all names containing mean or std)

##adding subject and activity labels to merged data set
subject <- rbind(subject_train, subject_test)
colnames(subject) <- c("Subject")
activity <- rbind(y_train, y_test)
colnames(activity) <- c("Activity")
new_merged3 <- cbind(subject, activity, new_merged2)

##cleaning up intermediate files
rm(new_merged)
rm(new_merged2)

#Step(3) Use descriptive activity names to name the activities in the dataset
#incomplete: currently labelled by number as in the original dataset

#Step(4) Appropriately label the dataset with descriptive variable names
##colnames(merged_set) <- as.character(feature_names$V2) 
##used above imports feature names from the information provided with the
##original dataset

#Step(5) From the data in step (4) create a second, independent, tidy
#dataset with the average of each variable for each activity and each subject

##There are 66 variables, 6 activities and 30 subjects, therefore there will be
##180 averages (assume mean()) for each variable
##could create a 3-dimensional array (activity x subject x variable)
##but 2-dimensional data.frame seems more tidy 
##(2 columns for subject and activity and 66 for variables)

##creating an empty matrix to hold values
M<- matrix(nrow=180, ncol = 68)
##converting matrix to data.frame
mean_set <- as.data.frame(M)

##removing matrix
rm(M)

##adding column names
##note that these will have to be modified to show means of means and stds
colnames(mean_set) <- colnames(new_merged3)

##analysis incomplete due to lack of time
##mean_set does not hold data, but does have column names


