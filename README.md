GettingCleaningData
===================

Course #3 - Getting and Cleaning data - Project Submission

Introduction
This directory contains my work done for the Coursera course "Getting and Cleaning Data".

The Raw Data
The raw data was an extensive set of files. However, examination of the requirements and the explanatory writeup by the course TA on the discussions forum reveals that only some of this large data set is of relevance for this project.

30 subjects carried a device (a Samsung phone), which had an in-built gyroscope and an accelerometer. These subjects were divided into the "training" set and the "test" set.

Though not relevant for this project, I surmise that the data gathered from the training set subjects for six different activities was perhaps used to "guess" what the test set subjects were doing at various points of time. In the Data Science course #4, we are taught several clustering techniques, and I would assume that the training data was used to "learn" which were the most important parameters to make an accurate guess.

For there is a HUGE set of parameters - 561 of them.

For both sets of subjects, the data had the same number of columns - 561.

The test data had 2947 observations of 561 variables.
The training data had 7352 observations of 561 variables.
Total 10299 observations.

The names/nature of these observations is given in the file features.txt, with a short explanation given in features_info.txt

It was observed that in the test/training directories, there were 3 similar files
- X_test.txt and X_training.txt - 2947 X 561, 7352 X 561
- y_test.txt and y_training.txt - 2947 X 1, 7352 X 1
- subject_test.txt and subject_training.txt - 2947 X 1, 7352 X 1

It was safe to assume that the X files had the raw data, the y files had a row-wise annotation of the activity for which the data was collected, and the subject file identified the subject for which the row-wise data was collected.

Processing
So the job now was to first collect all this data in a single table. The first act was to create 3 sets of columns -
1. read the X data on the 561 observations for both test and training set
2. read the y data (the row-wise activity annotation) for both sets
3. read the subject data (the row-wise subject annotation) for both sets
4. paste each one over the other (training over test in each case) - a row-bind operation

Additionally, the project asked us to separate the columns that had the words mean/std in them, and then do a subject-wise and activity-wise aggregation of that data by using the "mean" operator.

After subsetting the X data for just the required columns, the last part was to
1. column bind these columns
2. aggreate the columns using the "mean" operation, as desired

The final output was 180 rows (30 subjects times 6 activities each) and 86 columns of means (of mean/std columns). This was written out in the file tidy.txt, as directed.
