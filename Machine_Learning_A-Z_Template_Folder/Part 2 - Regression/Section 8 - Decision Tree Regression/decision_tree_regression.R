# Decision Tree Regression

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]


# Fitting the Decission Tree to the dataset
library(rpart)
regressor = rpart(formula = dataset$Salary ~ .,
                  data = dataset,
                  control = rpart.control(minsplit = 1))


# Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))


# Visualising the Regression Model results (for higher resolution and smoother curve)
# This must be done for a noncontinous model
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')