#Get the data
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

unzip(zipfile="./data/Dataset.zip", exdir="./data")
path1<-file.path("./data" , "UCI HAR Dataset")
library(plyr)

#Step1 Merge the training and the test sets to create one data set.

x_train <- read.table(file.path(path1, "train" , "X_train.txt" ))
y_train <- read.table(file.path(path1, "train", "Y_train.txt"))
subject_train <- read.table(file.path(path1, "train", "subject_train.txt"))

x_test <- read.table(file.path(path1, "test" , "X_test.txt" ))
y_test <- read.table(file.path(path1, "test" , "Y_test.txt" ))
subject_test <- read.table(file.path(path1, "test" , "subject_test.txt"))

# Concatenate the x data
x1 <- rbind(x_train, x_test)

# Concatenate the y data
y1 <- rbind(y_train, y_test)

# Concatenate the subject data
subject1 <- rbind(subject_train, subject_test)

#Step 2 Extract only the measurements on the mean and standard deviation for each measurement. 

features <- read.table(file.path(path1, "features.txt"))

#get only mean and std
mean_std <- grep("-(mean|std)\\(\\)", features[, 2])

x1 <- x1[, mean_std]
names(x1) <- features[mean_std, 2]

#Step 3 Use descriptive activity names to name the activities in the data set
activity_labels <- read.table(file.path(path1, "activity_labels.txt"))
y1[, 1] <- activity_labels[y1[, 1], 2]
names(y1) <- "activity"

#Step4 Appropriately label the data set with descriptive activity names. 

names(subject1) <- "subject"
final <- cbind(x1, y1, subject1)

#Step 5 From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

final1<-aggregate(. ~subject + activity, final, mean)
write.table(final1, "final_data.txt", row.name=FALSE)
