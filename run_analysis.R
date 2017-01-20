library(dplyr)
if (dir.exists("UCI HAR Dataset"))
{
        print("Generating dataset file, please wait...")
        
        #Test data
        #Get the column name for each feature
        features_info <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
        features_labels <- features_info[[2]]
        
        #Loading and binding Test data
        subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
        x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features_labels)  %>%
                #Extracting only the measurements on the mean and standard deviation
                select(contains(".mean."), contains(".std."))
        
        #Reading activities and assigning a label name to each actiuvity
        y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")
        y_test[1] <- factor(y_test[[1]], levels = c(1,2,3,4,5,6), labels = c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying"))
        
        #Combining all the rows together
        test <- bind_cols(subject_test, x_test, y_test) 
        
        
        #Training Data
        #Loading and binding Function data
        subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
        x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features_labels) %>%
                #Extracting only the measurements on the mean and standard deviation
                select(contains(".mean."), contains(".std."))
        
        #Reading activities and assigning a label name to each activity
        y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")
        y_train[1] <- factor(y_train[[1]], levels = c(1,2,3,4,5,6), labels = c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying"))
        
        #Combining all the rows together
        train <- bind_cols(subject_train, x_train, y_train) 
        
        #Merging the training and the test data sets
        harDataSet <- bind_rows(test, train) %>%
                group_by(activity, subject) %>%
                summarize_all(mean) %>%
                write.table(file = "tidySummary.txt", row.name = FALSE)
        print("The new dataset file (tidySummary.txt) was generated successfully in your current working directory.")
} else
{
        wd <- getwd()
        print(paste("A problem has occurred. The UCI HAR Dataset folder was not found in your current working directory", wd))
}
