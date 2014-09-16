Feature Selection 
=================
The original set of features, a description for them, and the details of the experiment are described in the files 
- data/UCI HAR Dataset/features.txt
- data/UCI HAR Dataset/features_info.txt
- data/UCI HAR Dataset/README.txt  
(we are assuming a directory called "data/UCI HAR Dataset" exists)

The original data was in two directories
- data/UCI HAR Dataset/test
- data/UCI HAR Dataset/train

The following files existed in these directories
- subject file - the subject annotation for each row
- X file - the observations (561 columns)
- y file - the activity annotation for each row

these files had information on the observations on 30 subjects, 6 activities, a total of 10299 observations (7352 for the purpose of "training", and 2947 for "test")

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
The complete list of variables of each feature vector is available in the file 'newFeatures.txt'
