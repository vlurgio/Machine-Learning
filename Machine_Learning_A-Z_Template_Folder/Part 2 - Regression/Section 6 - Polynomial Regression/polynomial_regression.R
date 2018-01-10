# Polynomial Regression

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# No splitting necessary as dataset is too small

# Fitting linear Regression to dataset
lin_reg = lm(formula = dataset$Salary ~ .,
             data = dataset)



# Fitting Polynomial Regression to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = dataset$Salary ~ .,
              data = dataset)

# Visualising linear regression results
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff') +
  xlab('Level') +
  ylab('Salary')


# Visualising polynomial regression results
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff') +
  xlab('Level') +
  ylab('Salary')

# Prediting a new result with Linear Regression
y_pred = predict(lin_reg, data.frame(Level = 6.5))

# Predicting a new result with Polynomial Regression
y_pred = predict(poly_reg, data.frame(Level = 6.5,
                                      Level2 = 6.5^2,
                                      Level3 = 6.5^3,
                                      Level4 = 6.5^4))
