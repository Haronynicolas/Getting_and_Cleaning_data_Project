## Project Assingmnet week 3:

## Part 1:

        # Downloded the data to a temporary file
        temporary.file<- tempfile()  
        download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                temporary.file)
        
        # List the files in the temporary file 
        unzip(temporary.file, list = TRUE) 
        
        # Unzip and read the data needed for the assignment
        y_test_data <- read.table(unzip(temporary.file, "UCI HAR Dataset/test/y_test.txt"))
        x_test_data <- read.table(unzip(temporary.file, "UCI HAR Dataset/test/X_test.txt"))
        subject_test_data <- read.table(unzip(temporary.file, "UCI HAR Dataset/test/subject_test.txt"))
        y_train_data <- read.table(unzip(temporary.file, "UCI HAR Dataset/train/y_train.txt"))
        x_train_data <- read.table(unzip(temporary.file, "UCI HAR Dataset/train/X_train.txt"))
        subject_train_data <- read.table(unzip(temporary.file, "UCI HAR Dataset/train/subject_train.txt"))
        Features <- read.table(unzip(temporary.file, "UCI HAR Dataset/features.txt"))
        
        # Unlinked the temporary file       
        unlink(temporary.file) 
        
        # Merge the train and test datasets
        Merged <- rbind(x_train_data, x_test_data) # the dimensions are simimlar
        
        # Extracts the names from the Features file:  
        featureNames <- Features[, 2]
        
        # Add the extracted names to the Merged folder: 
        names(Merged) <-featureNames
      
## Part 2:
        
        # Identify and extract the names that including mean or std 
        mean_std_names <- grep("(mean|std)\\(\\)", names(Merged))
        All_mean_std <- Merged[, mean_std_names]    
        
## Part 3:
        
        # 1. Merge the y data
        # 2. Create a vector with the descriptive activiies names
        # 3. Replace the old numbers/names with the new names 
        
        Merged_y <- rbind(y_train_data, y_test_data)[, 1]
        activityNames <-c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
        activities_data <- activityNames[Merged_y]
        
## part 4: 
        # Appropriately rename the data set with descriptive variable names
        # This included replacing Acc by Accelerator; t by Time; f by Frequency; -mean() by Mean; -std() by StdDev; 
        # Mag by Magnitude; Gyro by Gyroscope.
        
        names(Merged) <- gsub("Acc", "Accelerator", names(Merged))
        names(Merged) <- gsub("^t", "Time", names(Merged))
        names(Merged) <- gsub("^f", "Frequency", names(Merged))
        names(Merged) <- gsub("-mean\\(\\)", "Mean", names(Merged))
        names(Merged) <- gsub("-std\\(\\)", "StdDev", names(Merged))
        names(Merged) <- gsub("-", "", names(Merged)) #remove the slash
        names(Merged) <- gsub("Mag", "Magnitude", names(Merged))
        names(Merged) <- gsub("Gyro", "Gyroscope", names(Merged))

## part 5 
        
        # Add activities and subject with nice names and combine them to the the main data set
        subjects <- rbind(subject_train_data, subject_test_data)[, 1]
        organized_data <- cbind(Subject=subjects, Activity=activities_data, Merged)
        
        # Create a second, independent tidy data set with the average of each variable for each activity and each subject.
        library(data.table)
        organized.data.dt <- data.table(organized_data)
        tidy_data <- organized.data.dt[, lapply(.SD, mean), by = 'Subject,Activity']
        
        #write the table
        write.table(tidy_data, file = "Tidy.txt", row.names = FALSE)
        
        #returns the data
        tidy_data
        
        