Feature Selection 
=================
The original set of features, a description for them, and the details of the experiment are described in the files 
- data/UCI HAR Dataset/features.txt
- data/UCI HAR Dataset/features_info.txt
- data/UCI HAR Dataset/README.txt  
These files have been added here and re-submitted for the sake of completeness, and also since they describe the units etc for all the measurements. The README.txt file has been renamed origREADME.txt to avoid a clash with the README.md here.   
(we are assuming a directory called "data/UCI HAR Dataset" exists)

The original data was in two directories
- data/UCI HAR Dataset/test
- data/UCI HAR Dataset/train

The following files existed in these directories
- subject file - the subject annotation for each row
- X file - the observations (561 columns)
- y file - the activity annotation for each row

These files had information on the observations on 30 subjects, 6 activities, a total of 10299 observations (7352 for the purpose of "training", and 2947 for "test")

Of the 561 columns of data, 86 of them which contained the keywords "mean" and "std" were extracted. The files/data were stitched together as follows
- test and training subject related information was bound together row-wise
- test and training activity related information was bound together row-wise 
- activity numbers were changed to activity names (from info in the file activity_labels.txt)
- test and training observations were bound together row-wise, and the 86 relevant columns were extracted
- the observations were tagged with whether they came from the test or training set
- this gave us 4 sets of columns - 1 column with subject id, 1 column with activity names, one column with subject category(test/train) and 86 columns of mean/std data
- these columns were bound together column-wise
- the data table was aggregated by subject and activity using the mean of all values for each subject and each activity
- the table now has the "mean of means" and "mean of standard deviations" for each subject and each activity for 86 different features.  
The complete list of variables of each feature vector is available in the file 'newFeatures.txt'. 

Summary of Columns
------------------

Each column is an average (mean) of several values. The initial values were themselves normalized, so are DIMENSIONLESS.

### mean() and std() in X/Y/Z directions for (5X6 = 30 columns)
- tBodyAcc
- tGravityAcc
- tBodyAccJerk
- tBodyGyro
- tBodyGyroJerk

### mean() and std() for (5 X 2 = 10 columns)
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag

### mean(), std() and meanFreq() in X/Y/Z direction for (3 X 3 X 3 = 27 columns)
- fBodyAcc
- fBodyAccJerk
- fBodyGyro

### mean(), std() and meanFreq() for (4 X 3 = 12 columns)
- fBodyAccMag
- fBodyBodyAccJerkMag
- fBodyBodyGyroMag
- fBodyBodyGyroJerkMag

### finally, angles related properties (7 columns)
- angle(tBodyAccMean,gravity)
- angle(tBodyAccJerkMean),gravityMean)
- angle(tBodyGyroMean,gravityMean)
- angle(tBodyGyroJerkMean,gravityMean)
- angle(X,gravityMean)
- angle(Y,gravityMean)
- angle(Z,gravityMean) 

A total of 86 mean of mean/std columns are present in the tidy set.  
The names are as per the original feature names, though they really represent the means of those quantities.  
The initial column naming had the feature appended by   
"-mean()" or "-std()" or "-meanFreq()" 
and (when the feature is tri-axial) by   
"-X", "-Y", "-Z".
