
# Libraries 

library(data.table)
library(tidyverse)

# Loading 'train' and 'test'

train <- fread('./project/volume/data/interim/train.csv')
test <- fread('./project/volume/data/interim/test.csv')

# Making a null model by taking mean of training data

test$model0 <- mean(train$result)

# Making first model using logistic regression and all variables

model1 <- glm(result ~ . , data=train, family=binomial)

test$model1 <- predict(model1, newdata=test, type='response')

# Save model to a separate file

saveRDS(model1,"./project/volume/models/model1.model") # replace with intended model

# Making submission file

test$result <- test$model1 # replace with intended model

fwrite(test[, .(id, result)], './project/volume/data/processed/submit.csv')
