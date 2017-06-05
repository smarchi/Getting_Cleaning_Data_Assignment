#1. Read data from test and train datasets and join them
subject <- read.table("UCI_HAR_Dataset/test/subject_test.txt",col.names=c("subject"))
activities <- read.table("UCI_HAR_Dataset/test/y_test.txt",col.names=c("activity"))
data <- read.table("UCI_HAR_Dataset/test/X_test.txt")

test_data <- cbind(subject,activities,data)

subject <- read.table("UCI_HAR_Dataset/train/subject_train.txt",col.names=c("subject"))
activities <- read.table("UCI_HAR_Dataset/train/y_train.txt",col.names=c("activity"))
data <- read.table("UCI_HAR_Dataset/train/X_train.txt")

train_data <- cbind(subject,activities,data)

all_data <- rbind(test_data,train_data)

#2. Select feature measurements with mean() and std() in their names.
features <- read.table("UCI_HAR_Dataset/features.txt")
feat_indexes <- grep("mean\\(\\)|std\\(\\)",features$V2)
all_data <- all_data[,c(1,2,feat_indexes+2)]

#3. Assign descriptive activity names to numbers in "activity" column
act_names <- read.table("UCI_HAR_Dataset/activity_labels.txt")
act_names$V2 <- tolower(act_names$V2)
all_data$activity <- sapply(all_data$activity, function(x) act_names[x,"V2"])

#4. Assign descriptive names to variables
feat_names <- features[feat_indexes, "V2"]
feat_names <- sub("BodyBody","Body",feat_names,fixed = TRUE)
feat_names <- sub("-mean()-X","X_mean",feat_names,fixed = TRUE)
feat_names <- sub("-mean()-Y","Y_mean",feat_names,fixed = TRUE)
feat_names <- sub("-mean()-Z","Z_mean",feat_names,fixed = TRUE)
feat_names <- sub("-std()-X","X_std",feat_names,fixed = TRUE)
feat_names <- sub("-std()-Y","Y_std",feat_names,fixed = TRUE)
feat_names <- sub("-std()-Z","Z_std",feat_names,fixed = TRUE)
feat_names <- sub("-mean()","_mean",feat_names,fixed = TRUE)
feat_names <- sub("-std()","_std",feat_names,fixed = TRUE)
names(all_data)[3:dim(all_data)[2]] <- feat_names

#5. Group data by subject and activity and calculate mean and standard deviation for each feature
library(dplyr)
grouped_means <- all_data %>% group_by(subject, activity) %>% summarize_all(.funs="mean") 
write.table(grouped_means,"feature_mean.txt",row.name=FALSE,sep="\t")
