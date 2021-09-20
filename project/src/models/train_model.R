
# Libraries 

library(data.table)
library(tidyverse)

# Loading 'train' and 'test'

train <- fread('./project/volume/data/interim/train.csv')
test <- fread('./project/volume/data/interim/test.csv')

# Making a null model by taking mean of training data

test$model0 <- mean(train)

# Making submission file

test$SalePrice <- test$model # replace with intended model

fwrite(test[, .(Id, SalePrice)], './project/volume/data/processed/submit.csv')
