download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
              destfile = './hw4_data.zip', method = 'curl', quiet = T)
unzip(zipfile = 'hw4_data.zip')

actvity_labels <- read.table("/Users/edwinelias/Desktop/R/Coursera/UCI HAR Dataset 2/activity_labels.txt",
                             col.names = c('actlabel', 'actname'), quote = "")

features <- read.table("/Users/edwinelias/Desktop/R/Coursera/UCI HAR Dataset 2/features.txt",
                       col.names = c('label', 'activity'), quote = "")

# test data - preparing 

subject_test <- read.table("/Users/edwinelias/Desktop/R/Coursera/UCI HAR Dataset 2/test/subject_test.txt",
                     col.names = c('subid'))

X_t <- read.table("/Users/edwinelias/Desktop/R/Coursera/UCI HAR Dataset 2/test/X_test.txt")
Y_t <- read.table("/Users/edwinelias/Desktop/R/Coursera/UCI HAR Dataset 2/test/y_test.txt")

colnames(X_t) <- features$activity
colnames(Y_t) <- c('actlabel')

test_merged <- cbind(subject_test, X_t,Y_t)


train_subject <- read.table("/Users/edwinelias/Desktop/R/Coursera/UCI HAR Dataset 2/train/subject_train.txt",
                            col.names = c('subid'))

train_x <- read.table("/Users/edwinelias/Desktop/R/Coursera/UCI HAR Dataset 2/train/X_train.txt")
train_y <- read.table("/Users/edwinelias/Desktop/R/Coursera/UCI HAR Dataset 2/train/y_train.txt")
colnames(train_x) <- features$activity
colnames(train_y) <- c('actlabel')
train_merged <- cbind(train_subject, train_x, train_y)

all <- rbind(train_merged, test_merged)

mean_std <- all[,c(1, grep(pattern = 'mean\\(\\)|std\\(\\)', x = names(all)), 563)]

str(mean_std)

mean_std$subid <- as.factor(mean_std$subid)

mean_std$actlabel

mean_std$actlabel <- factor(mean_std$actlabel,
                            levels = actvity_labels$actlabel,
                            labels = actvity_labels$actname)
class(mean_std$actlabel)

names(mean_std)
names(mean_std)

mean_std <- mean_std[,-68]
names(mean_std)

colnames(mean_std) <- gsub(pattern = '\\(\\)', replacement = "", x = names(mean_std))
View(mean_std)

write.table(mean_std, file = 'tidyData.txt', row.names = F, quote = F, sep = "\t")

# From the data set in step 4, creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.

#### redoing step 4 for 5 

all <- rbind(train_merged, test_merged)

mean_std_act <- all[,c(1, grep(pattern = 'mean\\(\\)|std\\(\\)', x = names(all)), 563)]
str(mean_std_act)

mean_std_act$subid <- as.factor(mean_std_act$subid)

mean_st_actd$actlabel

mean_std_act$actlabel <- factor(mean_std_act$actlabel,
                                levels = actvity_labels$actlabel,
                                labels = actvity_labels$actname)

names(mean_std_act)
colnames(mean_std_act) <- gsub(pattern = '\\(\\)', replacement = "", x = names(mean_std_act))
View(mean_std_act)


mean_std_act <- group_by(mean_std_act,subid, actlabel) %>% summarise_all(funs(mean))
write.table(mean_std, file = 'tidymeanData.txt', row.names = F, quote = F, sep = "\t")



mean_std <- group_by(mean_std,subid, activity) %>% summarize_all(funs(mean))









