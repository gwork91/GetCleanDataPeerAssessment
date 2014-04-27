GetCleanDataPeerAssessment
==========================

Assignment 2 for Peer Assessment
--------------------------------

List of variables:
------------------
> x1			   : 
Data Frame with 'X_train.txt' data

> s1			   : 
Data Frame with 'subject_train.txt' data

> y1			   : 
Data Frame with 'y_train.txt' data

> x2			   : 
Data Frame with 'X_test.txt' data

> s2			   : 
Data Frame with 'subject_test.txt' data

> y2			   : 
Data Frame with 'y_test.txt' data


> train1 		   : 
Data frame combining all the three variables of 'train': X_train, subject_train, y_train

> test1 		   : 
Data frame combining all the three variables of 'test': X_test, subject_test, y_test

> features_names : 
Data frame with names of 561 features in it, size = 561x2, to be used for naming the columns

> activity_names : 
Data frame with activity_labels in it, size=6x2

> vec1	       : 
Numeric vector, with values of 1st column of 'activity_names'

> vec2	       : 
Character vector, with values of 2nd column of 'activity_names'

> merged 		   : 
Data frame binding test1 and train1 by rows


> merg1		   : Data frame with columns which have 'mean()' in the column names of the 'merged' data frame
> merg2		   : Data frame with columns which have 'std()' in the column names of the 'merged' data frame
> merg3		   : Data frame with 'Subject' column of the 'merged' data frame
> merg4		   : Data frame with 'Activity_Code' column of the 'merged' data frame

> final		   : 
Data frame combining all the above four merg[i] data frames

> melting		   : 
Single column of data with stacks of columns other than 'Activity_Code' and 'Subject' from 'final' data frame

> casting		   : 
Data frame casted from the molten data frame 'melting'.

> DT	   		   : 
Converting the data frame 'casting' to data.table 'DT', and then saving it as a .txt file



Commands  :
-----------
> merg1 <- merged[grep("mean()", names(merged),fixed=TRUE)]

Selects only the columns with 'mean()' in their column names, 'fixed=TRUE' removes any other column with 'mean' in their name, like 'meanFreq()'


> melting<-melt(final, id.vars=c("Activity_Code","Subject"))

> casting<-dcast(melting, Activity_Code + Subject ~ variable, mean)

Since 'Activity_Code' is specified earlier, so it varies faster as compared to 'Subject'


> casting$Activity_Code[casting$Activity_Code ==vec1[i]] <- vec2[i]
Naming the columns of the 'merged' data frame, using 'features_names' for 561 columns, and 'Subject' and 'Activity_Code' for last 2 columns.
Replacing the numbers in Activity_Code column by the Activity labels, which have been already put in the vector 'vec2'



