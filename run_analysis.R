library(plyr)

# read the training data, activity labels and subject identifiers
trgData <- read.table("data/UCI HAR Dataset/train/X_train.txt")
trgActivity <- read.table("data/UCI HAR Dataset/train/y_train.txt")
trgSubject <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
# add a tag that these subjects belong to the "training" set
trgTag <- rep("train",nrow(trgSubject))

# read the test data, activity labels and subject identifiers
testData <- read.table("data/UCI HAR Dataset/test/X_test.txt")
testActivity <- read.table("data/UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
# add a tag that these subjects belong to the "test" set
testTag <- rep("test",nrow(testSubject))

# merge the two sets
allData <- rbind(trgData, testData)
allActivity <- rbind(trgActivity, testActivity)
allSubject <- rbind(trgSubject, testSubject)
allTag <- as.data.frame(c(trgTag,testTag))

# read feature names, extract just the mean and std data columns
features <- read.table("data/UCI HAR Dataset/features.txt")
allCol <- grep("mean|std",features[,2],ignore.case=TRUE)
meanStdColumns <- allData[, allCol]
colnames(meanStdColumns) <- features[allCol, 2]

# change activity labels to activity names
activityLabels <- read.table("data/UCI HAR Dataset/activity_labels.txt")
actNames <- as.data.frame(apply(allActivity, 1, 
                          FUN = function(x) activityLabels[x,2])) 
colnames(actNames) <- "activity"
colnames(allSubject) <- "subject"
colnames(allTag) <- "category"

# combine all of the columns to make one data frame
combo <- cbind(actNames, allSubject, allTag, meanStdColumns)

# apply column means for all columns except the first 3
tidy <- ddply(combo, .(subject, activity, category), function(x) colMeans(x[,-c(1:3)]))

# write out this tidy data into a file
write.table(tidy, "tidy.txt", row.names=FALSE)
