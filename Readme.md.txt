Getting and Cleaning Data Course Project

This file describes how run_analysis.R script works.

The code takes for granted all the data is present in the same folder, un-compressed and without names altered.
CodeBook.md describes the variables, the data  the data and any transformations or work that was performed to clean up the data.

run_analysis.R contains all the code neccessary to perform the following:

1. Merges the training and the test sets to create one data set.
- Reading the raw data and merging it.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
- Getting the columns with only mean and standard deviation.
3. Uses descriptive activity names to name the activities in the data set
- Adding the right names.
4. Appropriately labels the data set with descriptive variable names. 
- Adding the right labels
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- Create the final_data.txt