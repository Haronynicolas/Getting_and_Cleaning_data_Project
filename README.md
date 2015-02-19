# Getting and Cleaning Data Coursera Project

## This markdown file describes how the script works:


 
Note: The detailed information about each variable can be foung in the "CodeBook.Rmd"" file and the corresponding script for each of the steps below can be found in the "run_analysis.R"" file  


### Here are the steps starting from downloading the data until teh Tidy data is ready:

* Download the data to a temporary fiel using the temporary () function and the donwload.file function
* List the files. The aim of this step is to be able to see all files and decide on which to unzip
* Unzip the files that are required for the transormation of teh data to a Tidy data. Those included:
        * y_test data
        * x_test data
        * subect_test data
        * y_train data
        * x_train data
        * subject_train data
        * features data
* unlink the temporary file
* Merge the train and test datasets
* Extracts the names from the Features file  
* Add the extracted names to the Merged folder 
* Identify and extract the names that including mean or std 
* Merge the y data
* Create a vector with the descriptive activiies names
* Replace the old numbers/names with the new names 
* Appropriately rename the data set with descriptive variable names. This included replacing:
        * Acc by Accelerator
        * t by Time
        * f by Frequency
        * -mean() by Mean 
        * -std() by StdDev
        * Mag by Magnitude; Gyro by Gyroscope.
* Add activities and subject with nice names and combine them to the the main data set
* Create a second, independent tidy data set with the average of each variable for each activity and each subject.
* Save a copy of the data in the working directory        
* Return the tidy data
       
     

        
 
