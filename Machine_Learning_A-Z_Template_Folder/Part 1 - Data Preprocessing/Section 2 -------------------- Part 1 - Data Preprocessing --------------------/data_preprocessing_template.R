# Data Preprocessing

# Importing the dataset
dataset = read.csv('Data.csv')
# dataset = dataset[, 2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
traing_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# Feature Scaling
# traing_set[, 2:3] = scale(traing_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])
