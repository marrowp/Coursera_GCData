**CodeBook.md**

*CodeBook for the Coursera/Johns Hopkins University Getting & Cleaning Data project*

This CodeBook describes (1) the source and nature of the original dataset that was used in this project (2) the changes that were made using the R script enclosed in this repository *(run_analysis.R)* in order that a tidy dataset of means of selected variables could be created (3) the structure and variables of the final tidy dataset.

The original dataset is not enclosed in this repository. It was downloaded and read into R using the R script enclosed in this repository.

The final tidy dataset is not enclosed in this repository.  It has been uploaded separately for assessment via the Coursera/Johns Hopkins University Getting & Cleaning Data website.

*The original dataset that was used in this project*

The original dataset that was used in this project was acquired from the following URL
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and had been deposited in the UCIrvine Machine Learning Repository.

The original study, on human activity while using smartphones, had been carried out in support of the following conference publication:
 Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

30 (anonymous) human volunteers participated, distinguished by numeric labels.

Measurements were made during 6 types of activity, described in the original dataset using numeric labels:

1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING.

Measurements were collected using the accelerometer and gyroscope functions of smartphones in the X, Y and Z axes, as well as carrying out transforms that generated measurements independent of the axis. Based on the original measurements it was possible to generate additional measures:

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between to vectors.
The angle() measure could also be used in the calculation of additional measurements. 

For further information see the features_info.txt and features.txt files enclosed with the original dataset from the URL above.

These calculations led to 561 features for each activity carried out by each subject that could be used for analysis. The dataset was divided up 70% for training and 30% for test.

*The changes that were made using the R script*

Step(0) Data preparation.

The datasets were downloaded from the URL given above, unzipped, and read into R.

Step(1) Merging training and test datasets.

In order to progress to a tidy dataset for analysis, the training and test sets were combined. This led to a total of 10299 observations for each of 561 features. 

2 columns were added to the merged dataset to represent subjects and activities, each labelled by numbers. Thus there were 10299 rows (observations) by 563 columns (labels & features) in this the largest dataset.

The feature columns were given names, by reading into R the features.txt file and using the colnames() function.

Step(2) Extract only the measurements on the mean and standard deviation for each measurement.

This project required only the use of features where mean() or std() had been measured on the original smartphone dataset. The R grep() function was used to extract columns where these functions had been applied. In addition -grep() was used to extract columns from the resulting smaller dataset where meanFreq() had been used, rather than mean().

This resulted in a smaller dataset of 10299 observations of 66 variables (features.) 2 columns were reintroduced to represent subjects and activities, so that there were 10299 observations of 68 variables (2 labels, 66 features).

The resulting column names were as follows ("" represents a string in R, column numbers are not shown but can be deduced from the sequence, starting with "Subject"):

"Subject"                     
"Activity"                    
"tBodyAcc-mean()-X"          
"tBodyAcc-mean()-Y"           
"tBodyAcc-mean()-Z"           
"tGravityAcc-mean()-X"       
"tGravityAcc-mean()-Y"        
"tGravityAcc-mean()-Z"        
"tBodyAccJerk-mean()-X"      
"tBodyAccJerk-mean()-Y"       
"tBodyAccJerk-mean()-Z"       
"tBodyGyro-mean()-X"         
"tBodyGyro-mean()-Y"          
"tBodyGyro-mean()-Z"          
"tBodyGyroJerk-mean()-X"     
"tBodyGyroJerk-mean()-Y"      
"tBodyGyroJerk-mean()-Z"      
"tBodyAccMag-mean()"         
"tGravityAccMag-mean()"       
"tBodyAccJerkMag-mean()"      
"tBodyGyroMag-mean()"        
"tBodyGyroJerkMag-mean()"     
"fBodyAcc-mean()-X"           
"fBodyAcc-mean()-Y"          
"fBodyAcc-mean()-Z"           
"fBodyAccJerk-mean()-X"       
"fBodyAccJerk-mean()-Y"      
"fBodyAccJerk-mean()-Z"       
"fBodyGyro-mean()-X"          
"fBodyGyro-mean()-Y"         
"fBodyGyro-mean()-Z"          
"fBodyAccMag-mean()"          
"fBodyBodyAccJerkMag-mean()" 

"fBodyBodyGyroMag-mean()"     
"fBodyBodyGyroJerkMag-mean()" 

"tBodyAcc-std()-X"           
"tBodyAcc-std()-Y"            
"tBodyAcc-std()-Z"            
"tGravityAcc-std()-X"        
"tGravityAcc-std()-Y"         
"tGravityAcc-std()-Z"         
"tBodyAccJerk-std()-X"       
"tBodyAccJerk-std()-Y"        
"tBodyAccJerk-std()-Z"        
"tBodyGyro-std()-X"          
"tBodyGyro-std()-Y"           
"tBodyGyro-std()-Z"           
"tBodyGyroJerk-std()-X"      
"tBodyGyroJerk-std()-Y"       
"tBodyGyroJerk-std()-Z"       
"tBodyAccMag-std()"          
"tGravityAccMag-std()"        
"tBodyAccJerkMag-std()"       
"tBodyGyroMag-std()"         
"tBodyGyroJerkMag-std()"      
"fBodyAcc-std()-X"            
"fBodyAcc-std()-Y"           
"fBodyAcc-std()-Z"            
"fBodyAccJerk-std()-X"        
"fBodyAccJerk-std()-Y"       
"fBodyAccJerk-std()-Z"        
"fBodyGyro-std()-X"           
"fBodyGyro-std()-Y"          
"fBodyGyro-std()-Z"           
"fBodyAccMag-std()"           
"fBodyBodyAccJerkMag-std()"  
"fBodyBodyGyroMag-std()"      
"fBodyBodyGyroJerkMag-std()".

Step(3) Use descriptive activity names to name the activities in the dataset.

This step was not completed due to time constraints. The activities were labelled by number as in the original dataset, and could be changed in future work.

Step(4) Appropriately label the dataset with descriptive variable names.

The colnames() R function was used to label the variables with names from the original feature set. See above under Step(2).

Step(5) From the data in step (4) create a second, independent, tidy dataset with the average of each variable for each activity and each subject.

Since there are 6 activities and 30 subjects, a data frame for 180 averages (6 times 30) for each of the 66 variables was created. 2 additional columns were added for the subject and activity identifiers. Thus the data frame had dimensions of 180 rows by 68 columns.

Step(5) was not completed due to time constraints.

*The nature of the final tidy dataset that was produced*

The final tidy dataset resulting from Step(5) was planned to contain entries for each variable of the following form.

For each activity and subject, each element of the dataset would show the mean calculated for that variable across all observations from the data in step(4) corresponding to that activity, subject and variable. 

The names of variables in the final tidy dataset would be modified to reflect the calculation of means based on the original dataset from step(4).

The final tidy dataset was not produced due to time constraints.