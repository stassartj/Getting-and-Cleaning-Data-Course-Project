


This document is a codebook that provides descriptions of the variables, the data, and all transformations and work that I performed to clean up the data.



#The data
        
        - 'tidy_data.csv' : the tidy data keeping only the mean and the std variables
        
        - 'tidy_data_mean.csv': the tidy data  with the summarized data of the avearge of each data per subject and per activity


#The variables


        - 'label ID' : ID of the activity
        
        - 'label name' : litteral name of the activity
        
        - 'subject': ID of the subject
        
        - ... : all the measured variables:
                For each record in the dataset it is provided the mean and the standard deviation of the following variables:
                - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
                - Triaxial Angular velocity from the gyroscope.
                - A 561-feature vector with time and frequency domain variables.
                - Its activity label.
                - An identifier of the subject who carried out the experiment. 




#Transformations performed on the original datasets

        1. create a folder to download and unzip the data
        2. import the labels of the activity that will e used in the next steps
        3. import all the necessary "test" data sets, add the subject ID and the activity ID to the data, add the activity labels related to the activity ID 
        4. repeat (3.) with the "train" datasets
        5. merge the "train" and the "test" datasets
        6. import the variable names and add the name of the columns that were added in our datasets
        7. name the columns of our dataset
        8. filter the data to keep only the mean and std variables
        9. create a new dataset with the summarized data of the avearge of each data per subject and per activity
        10. create new files with the tidy data