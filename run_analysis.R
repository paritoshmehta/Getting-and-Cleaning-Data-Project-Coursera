
# Set to TRUE to attempt the download automatically
# May not work on all platforms or in VM environments
download_file_automatically <- FALSE
data_file <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
local_data_file <- './getdata_projectfiles_UCI HAR Dataset.zip'
local_data_dir <- './UCI HAR Dataset'
tidy_data_file <- './tidy-dataset.csv'
tidy_avgs_data_file <- './tidy-avgs-dataset.csv'
# Make sure the original data file is in the working directory, downloading
# it if needed (and allowed)
if (! file.exists(local_data_file)) {
  if (download_file_automatically) {
    download.file(data_file,
                  destfile = local_data_file, method = 'curl')
  }
}
# Crash if file is not present
if (! file.exists(local_data_file)) {
  stop(paste(local_data_file, 'must be present in working directory.'))
}
# Uncompress the original data file
if (! file.exists(local_data_dir)) {
  unzip(local_data_file)
}
# Fail if unzip failed
if (! file.exists(local_data_dir)) {
  stop(paste('Unable to unpack the compressed data.'))
}
# Read activity labels
activitys <- read.table(paste(local_data_dir, 'activity_labels.txt', sep = '/'),
                   header = FALSE)
names(activitys) <- c('id', 'name')
# Read feature labels
features <- read.table(paste(local_data_dir, 'features.txt', sep = '/'),
                    header = FALSE)
names(features) <- c('id', 'name')
# Read the plain data files, assigning sensible column names
train.X <- read.table(paste(local_data_dir, 'train', 'X_train.txt', sep = '/'),
                      header = FALSE)
names(train.X) <- features$name
train.y <- read.table(paste(local_data_dir, 'train', 'y_train.txt', sep = '/'),
                      header = FALSE)
names(train.y) <- c('activity')
train.subject <- read.table(paste(local_data_dir, 'train', 'subject_train.txt',
                                  sep = '/'),
                            header = FALSE)
names(train.subject) <- c('subject')
test.X <- read.table(paste(local_data_dir, 'test', 'X_test.txt', sep = '/'),
                     header = FALSE)
names(test.X) <- features$name
test.y <- read.table(paste(local_data_dir, 'test', 'y_test.txt', sep = '/'),
                     header = FALSE)
names(test.y) <- c('activity')
test.subject <- read.table(paste(local_data_dir, 'test', 'subject_test.txt',
                                 sep = '/'),
                           header = FALSE)
names(test.subject) <- c('subject')
# Merge the training and test sets
X <- rbind(train.X, test.X)
y <- rbind(train.y, test.y)
subject <- rbind(train.subject, test.subject)
# Extract just the mean and SD features
# Note that this includes meanFreq()s - it's not clear whether we need those,
# but they're easy to exlude if not needed.
X <- X[, grep('mean|std', features$name)]
# Convert activity labels to meaningful names
y$activity <- activitys[y$activity,]$name
# Merge partial data sets together
tidy_data_set <- cbind(subject, y, X)
# Dump the data set
write.csv(tidy_data_set, tidy_data_file)
# Compute the averages grouped by subject and activity
tidy_abgs_data_set <- aggregate(tidy_data_set[, 3:dim(tidy_data_set)[2]],
                                list(tidy_data_set$subject,
                                     tidy_data_set$activity),
                                mean)
names(tidy_abgs_data_set)[1:2] <- c('subject', 'activity')
# Dump the second data set
write.csv(tidy_abgs_data_set, tidy_avgs_data_file, row.names=FALSE)

