GettingCleaningData
===================

Course #3 - Getting and Cleaning data - Project Submission
----------------------------------------------------------

### Introduction
This directory contains my work done for the Coursera course "Getting and Cleaning Data".

### This Directory has
README.md - this file  
codebook.md - the new code book  
features.txt - the old "code book" with list of all 561 features  
features_info.txt - the old "code book" explanations  
newFeatures.txt - all 89 new column names  
origREADME.txt - original README file  
run_analysis.R - the code to read raw data and generate the new tidy data  
tidy.txt - the tidy data  
viewCSV.R - a file that reads the tidy data and Views it in RStudio  

### Download and Unzip
Prior to the start, it is assumed that the raw data has been downloaded and unzipped in a directory called "data", from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The unzipping results in a directory "./data/UCI HAR Dataset"

### The Raw Data
The raw data was in a large number/set of files. However, an examination of the requirements and the explanatory writeup by the course TA on the discussions forum reveals that only some of this large data set is of relevance for this project.

30 subjects carried a device (a Samsung phone), which had an in-built gyroscope and an accelerometer. These subjects were divided into the "training" set and the "test" set.

Though not relevant for this project, I surmise that the data gathered from the training set subjects for six different activities was perhaps used to "guess" what the test set subjects were doing at various points of time. In the Data Science course #4, we are taught several clustering techniques, and I would assume that the training data was used to "learn" which were the most important parameters to make an accurate guess.

And there IS a HUGE set of parameters - 561 of them. For both sets of subjects (test and training), the data had the same number of columns - 561.

The test data had 2947 observations of 561 variables.
The training data had 7352 observations of 561 variables.
Total 10299 observations.

The names/nature of these observations is given in the file features.txt, with a short explanation given in features_info.txt

It was observed that in the test/training directories, there were 3 similar files
- X_test.txt and X_training.txt - 2947 X 561, 7352 X 561
- y_test.txt and y_training.txt - 2947 X 1, 7352 X 1
- subject_test.txt and subject_training.txt - 2947 X 1, 7352 X 1

It was safe to assume that the X files had the raw data, the y files had a row-wise annotation of the activity for which the data was collected, and the subject file identified the subject for which the row-wise data was collected.

Before describing the processing, the assumption - the place from which the file run_analysis.R is sourced/run has a subdirectory with all the data in the original form, in a directory - "data/UCI HAR Dataset"

### Processing
So the job now was to first collect all this data in a single table. The first act was to create 3 sets of columns
- read the X data on the 561 observations for both test and training set
- read the y data (the row-wise activity annotation) for both sets
- read the subject data (the row-wise subject annotation) for both sets
- paste each one over the other (training over test in each case) - a row-bind operation

Additionally, the project asked us to separate the columns that had the words mean/std in them, and then do a subject-wise and activity-wise aggregation of that data by using the "mean" operator.

After subsetting the X data for just the required columns, the last part was to
- column bind these columns
- aggregate the columns using the "mean" operation, as desired

The final output was 180 rows (30 subjects times 6 activities each) and 86 columns of means (of mean/std columns). This was written out in the file tidy.txt, as directed.

The list of features of this new file
- subject id/number
- activity name
- category of subject (test/train)

and then the means of the following columns (per subject, per activity)
- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z
- tBodyAcc-std()-X
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
- tGravityAcc-mean()-X
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z
- tGravityAcc-std()-X
- tGravityAcc-std()-Y
- tGravityAcc-std()-Z
... and so on, a total of 86 such columns

This is a total of 89 columns. 
A new file - newFeatures.txt, has also been added.


To read the tidy.txt file and view the data, I have created a file viewCSV.R, which has to be sourced from within rstudio by doing a source("viewCSV.R"). This will read in the tidy.txt file and View the resultant variable.

