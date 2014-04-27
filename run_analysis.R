
x1<- read.table("UCI HAR Dataset\\train\\X_train.txt")
s1<- read.table("UCI HAR Dataset\\train\\subject_train.txt")
y1<- read.table("UCI HAR Dataset\\train\\y_train.txt")

x2<- read.table("UCI HAR Dataset\\test\\X_test.txt")
s2<- read.table("UCI HAR Dataset\\test\\subject_test.txt")
y2<- read.table("UCI HAR Dataset\\test\\y_test.txt")

train1 <- cbind(x1, s1,y1)
test1 <- cbind(x2, s2,y2)

features_names <- read.table("UCI HAR Dataset\\features.txt")
activity_names<- read.table("UCI HAR Dataset\\activity_labels.txt")
##Converting activity_names[,2] to character, as it is of FACTOR class
vec1<-as.numeric(activity_names[,1])
vec2<-as.character(activity_names[,2])

merged <- rbind(test1,train1)

colnames(merged)<- features_names[,2]
colnames(merged)[562]<-"Subject"
colnames(merged)[563]<-"Activity_Code"


merg1 <- merged[grep("mean()", names(merged),fixed=TRUE)]
merg2 <- merged[grep("std()", names(merged))]
merg3 <- merged[grep("Subject", names(merged))]
merg4 <- merged[grep("Activity_Code", names(merged))]

final <- cbind(merg1, merg2,merg3, merg4)

library(reshape2)
melting<-melt(final, id.vars=c("Activity_Code","Subject"))
casting<-dcast(melting, Activity_Code + Subject ~ variable, mean)
 
##Replacing numbers of the Activity_Code column with Activity_labels:
for (i in 1:length(vec1)){
casting$Activity_Code[casting$Activity_Code ==vec1[i]] <- vec2[i]
}

library(data.table)
DT <- data.table(casting)
write.table(DT, file="tidy_data.txt")
