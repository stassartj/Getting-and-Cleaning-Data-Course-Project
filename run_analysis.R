

#1. create a folder to download and unzip the data
        if (!file.exists("./data")) {dir.create("./data")
        }
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, "./data/data.zip") 
        unzip("./data/data.zip", exdir = "./data")
        dataDownloaded <- date()



library(tidyverse)

        
#2. import the labels of the activity that will e used in the next steps        
        labels_names <-  read.table("UCI HAR Dataset/activity_labels.txt")


#3. import all the necessary "test" data sets, 
# add the subject ID and the activity ID to the data, 
# add the activity labels related to the activity ID 
        data_test <- read.table("UCI HAR Dataset/test/X_test.txt",
                                      header = FALSE)
                subject_test <- read_csv("UCI HAR Dataset/test/subject_test.txt",
                                         col_names =   FALSE)
                labels_test <- read_csv("UCI HAR Dataset/test/y_test.txt",
                                         col_names =   FALSE)
                labels_test <- merge(labels_test,labels_names, by.x = "X1", by.y = "V1")
                data_test <-cbind(labels_test,subject_test,data_test) 


#4. repeat (3.) with the "train" data sets 
        data_train <- read.table("UCI HAR Dataset/train/X_train.txt", 
                                       header = FALSE)
                subject_train <- read_csv("UCI HAR Dataset/train/subject_train.txt",
                                          col_names =  FALSE)
                labels_train <- read_csv("UCI HAR Dataset/train/y_train.txt",
                                         col_names =  FALSE)
                labels_train <- merge(labels_train,labels_names, by.x = "X1", by.y = "V1")
                data_train <-cbind(labels_train,subject_train,data_train) 





full_data <- bind_rows(data_train, data_test)


# 6. import the variable names and add the name of the columns that were added in our datasets
features <- read_table2("UCI HAR Dataset/features.txt", 
                        col_names = FALSE)
features <- rbind(list(0,"label ID"),list(0, "label name"), list(0, "subject") , features)


#7. name the columns of our dataset 
names(full_data) <- features[[2]]


#8. filter the data to keep only the mean and std variables
desired_features <-  grepl("subject|label ID|label name|mean|std",features [[2]])
filtered_data <-  full_data[,desired_features]

#9. create a new dataset with the summarized data of the avearge of each data per subject and per activity
data_mean <-  filtered_data%>% group_by(subject, `label name`) %>% summarize_all(mean, na.rm=T ) 

#10. create new files with the tidy data
write_csv(filtered_data, "tidy_data.csv")
write_csv(data_mean, "tidy_data_mean.csv")
