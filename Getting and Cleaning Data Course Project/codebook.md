####---- 1.  Merges the training and the test sets to create one data set.  
#### RBIND is used in order to make one data.table from a data.train and data.test

data.all <- rbind(data.train, data.test)

data.all

####---- 2.  Extracts only the measurements on the mean and standard deviation for each measurement.
#### GREP is used to search for matches 'mean|std'

mean_std <- grep('mean|std', features)
mean_std

data.sub <- data.all[,c(1,2,mean_std + 2)]
data.sub

####---- 3.  Uses descriptive activity names to name the activities in the data set.
#### For this the dataset activity_labels.txt is used.

activity.labels <- read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)
activity.labels <- as.character(activity.labels[,2])
data.sub$activity <- activity.labels[data.sub$activity]
data.sub$activity 

####---- 4.  Appropriately labels the data set with descriptive variable names.

name.new <- names(data.sub)
name.new <- gsub("[(][)]", "", name.new)
name.new <- gsub("^t", "TimeDomain_", name.new)
name.new <- gsub("^f", "FrequencyDomain_", name.new)
name.new <- gsub("Acc", "Accelerometer", name.new)
name.new <- gsub("Gyro", "Gyroscope", name.new)
name.new <- gsub("Mag", "Magnitude", name.new)
name.new <- gsub("-mean-", "_Mean_", name.new)
name.new <- gsub("-std-", "_StandardDeviation_", name.new)
name.new <- gsub("-", "_", name.new)
names(data.sub) <- name.new

####---- 5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

data.tidy <- aggregate(data.sub[,3:81], by = list(activity = data.sub$activity, subject = data.sub$subject),FUN = mean)
write.table(x = data.tidy, file = "data_tidy.txt", row.names = FALSE)