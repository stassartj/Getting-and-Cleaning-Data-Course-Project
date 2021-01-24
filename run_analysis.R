if (!file.exists("./data")) {dir.create("./data")
        
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, "./data/data.zip") 
unzip("./data/data.zip", exdir = "./data")
dataDownloaded <- date()

library(tidyverse)
data_test <- read.table("UCI HAR Dataset/test/X_test.txt",
                              header = FALSE)
data_train <- read.table("UCI HAR Dataset/train/X_train.txt", 
                       header = FALSE)

features <- read_table2("UCI HAR Dataset/features.txt", 
                        col_names = FALSE)

full_data <- bind_rows(data_train, data_test)

names(full_data) <- features[2]
class(full_data)



df<- data.frame(v1 = c(1:5),v2 =c(6:10))
names(df) <- c("name1", "name2")
df
