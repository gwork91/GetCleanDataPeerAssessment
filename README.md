GetCleanDataPeerAssessment
==========================

Assignment 2 for Peer Assessment

Steps:
------

Step 1 : Create a Folder 'Assignment2'

Step 2 : Unzip the .zip file 'getdata-projectfiles-UCI HAR Dataset.zip' in 'Assignment2' Folder.

Step 3 : Place the 'run_analysis.R' file and the extracted folder 'UCI HAR Dataset' in the **same folder** 'Assignment2'

Step 4 : Open R console and set working directory as 'Assignment2' folder:
		 setwd("..\\Assignment2")		
		 **Edit the path according to your machine specifications**
		
Step 5 : Run the 'run_analysis.R' file	
		 source("run_analysis.R")

Step 6 : 'tidy_data.txt' file will be created in the 'Assignment2' folder.  Open it with relevant application.


Explanation:
-----------
Files corresponding to 'train' and 'test' have been clubbed in a single data frame.
Subject and Activity_code columns were added to this data frame.
Names of the 561 columns from 'activity_labels' were allotted to the data frame columns, apart from 'Activity_code' and 'Subject' columns.

Columns with 'mean' and 'std' in their names were clubbed together with columns 'Activity_code' and 'Subject' into a data frame.
A new data set was created from the above created data frame which has the average of each variable for each activity and each subject.

Renaming of the activities was done by replacing the Activity_code by their labels, taken from file activity_labels.txt
New data table was created from the updated data frame, and used to write into a file 'tidy_data'.txt

