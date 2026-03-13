#1. R/Python and exploratory data analysis: Chapter 2: #10
 #a)
 library(ISLR2)
 Boston
 ?Boston
 #Rows : 506, Columns: 13 / 
 #Each row represents a different suburb in the Boston area, 
 #Each column represents a different variabels describing characters of that suburb
 #such as crime rate, average number of rooms, property tax rate
 
 #b)
  pairs(Boston[,c('crim','zn','lstat','age')])
  #1.crim is positively correlated with lstat and age, implicating that suburbs with older housing 
  #  and higher low-income populations tend to have higher crime rates. 
  #2. zn shows a negative relationship with crim and lstat, implicating that more larger zoning is
  #   associated with lower crime and low-income percentages.
  #3. lstat and age are positively related, indicating that older neighborhoods may have
  #   higher proportions of low-income residents.    

 #c)
  #Yes, some predictors are correlated with crime rate(crim)
  #lstat is positively correlated with crim, indicating that suburbs with more low-income people 
  #tend to have higher crime rates
  #age also shows a positive trend with crim
  #zn is negatively correlated with crim, suggesting that more affluent areas experiences less crime. 
  
 #d)
  range(Boston$crim)
  range(Boston$tax)
  range(Boston$ptratio)
  which.max(Boston$crim)
  which.max(Boston$tax)
  which.max(Boston$ptratio)
  #The highest crime rate is in tract 381 with crim=88.98
  #(crim range : 0.006 to 88.98)
  #The highest tax rate is in tract 488 with tax=711
  #(tax range : 187 to 711)
  #The highest pupil-teacher ratio is in tract 355 with ptratio=22.0
  #(tax range : 12.6 to 22.0)
  
 #e)
  sum(Boston$chas==1)
  #There are 35 census tracts in the Boston data set that bound the Charles River.
  
 #f)
  median(Boston$ptratio)
  #The median pupil-teacher ratio among the towns in Boston data set is 19.05
  
 #g)
  which.min(Boston$medv)
  Boston[which.min(Boston$medv),]
  #The census tract with the lowest median value of owner-occupied homes is
  #tract 399, where medv=5.0
  #The zn value for this tract is 0, indicating that none of the land in this tract
  #is zoned for large residential lots. 
  #The age value is 100, meaning 100% of the homes in this are are very old. 
  #This tract has the highest value(24) in rad, indicating strong proximity to major roads.
  
 #h)
  sum(Boston$rm>7)
  sum(Boston$rm>8)
  Boston[Boston$rm>8,]
  range(Boston$lstat)
  #64 census tracts have an average of more than 7 rooms per dwelling. 
  #13 census tracts have an average of more than 8 rooms per dwelling.
  #The tracts with more than 8 rooms per dwelling likely represnt affluent neighborhodds
  #with larger homes. These tracts tend to have higher medv, lower crim and lower lstat. 
  #Thus, those areas are generally more expensive and have better living conditions. 
  
#2. 
  #a)
  model_zn<-lm(crim~zn, data=Boston)
  summary(model_zn)
  plot(crim~zn, data=Boston)
  abline(lm(crim~zn, data=Boston))
  #There is a statistically significant negative relationship between zn and crim (p < 0.001)
  
  model_indus<-lm(crim~indus,data=Boston)
  summary(model_indus)
  plot(crim~indus, data=Boston)
  abline(lm(crim~indus, data=Boston))
  #There is a positive and statistically significant relationship between indus and crim (p<0.001)
  
  model_chas<-lm(crim~chas,data=Boston)
  summary(model_chas)
  plot(crim~chas, data=Boston)
  abline(lm(crim~chas, data=Boston))
  #There is a statistically insignificant negative relationship between chas and crim (p = 0.209).
  
  model_nox<-lm(crim~nox, data=Boston)
  summary(model_nox)
  plot(crim~nox, data=Boston)
  abline(lm(crim~nox, data=Boston))
  #There is a statistically significant positive relationship between nox and crim (p < 0.001).
  
  model_rm<-lm(crim~rm, data=Boston)
  summary(model_rm)
  plot(crim~rm,data=Boston)
  abline(lm(crim~rm,data=Boston))
  #There is a statistically significant negative relationship between rm and crim (p < 0.001).
  
  model_age<-lm(crim~age,data=Boston)
  summary(model_age)
  plot(crim~age,data=Boston)
  abline(lm(crim~age,data=Boston))
  #There is statistically significant positive relationship between age and crim (p<0.001)
  
  model_dis<-lm(crim~dis,data=Boston)
  summary(model_dis)
  plot(crim~dis, data=Boston)
  abline(lm(crim~dis, data=Boston))
  #There is a statistically significant negative relationship between crim and dis(p<0.001)

  model_rad<-lm(crim~rad,data=Boston)
  summary(model_rad)
  plot(crim~rad,data=Boston)
  abline(lm(crim~rad,data=Boston))
  #There is a statistically significant positive relationship between rad and crim (p < 0.001),
  #but the linear relationship is weak due to a cluster of points above 20
  
  model_tax<-lm(crim~tax,data=Boston)
  summary(model_tax)
  plot(crim~tax,data=Boston)
  abline(lm(crim~tax,data=Boston))
  #There is a statistically significant positive relationship between tax and crim (p < 0.001),
  #but the linear relationship is weak due to a cluster of points between 600 and 700
  
  model_ptratio<-lm(crim~ptratio,data=Boston)
  summary(model_ptratio)
  plot(crim~ptratio,data=Boston)
  abline(lm(crim~ptratio,data=Boston))
  #There is a statistically significant positive relationship between ptratio and crim (p < 0.001),
  #but the linear relationship is weak due to a cluster of points near 14 and 20
  
  model_lstat<-lm(crim~lstat,data=Boston)
  summary(model_lstat)
  plot(crim~lstat,data=Boston)
  abline(lm(crim~lstat,data=Boston))
  #There is a statistically significant positive relationship between lstat and crim (p < 0.001)
  
  model_medv<-lm(crim~medv,data=Boston)
  summary(model_medv)
  plot(crim~medv,data=Boston)
  abline(lm(crim~medv,data=Boston))
  #There is a statistically significant negative relationship between medv and crim (p < 0.001)

  #b)
  model_all=lm(crim~.,data=Boston)
  summary(model_all)
  #We can reject null hypothesis for zn,dis,rad and medv at the 0.05 significance level.
  #These predictors have a statistically important influence on crim.
  
  #c)
  simple_coefs<-c(
    zn=coef(model_zn)[2],
    indus=coef(model_indus)[2],
    chas=coef(model_chas)[2],
    nox=coef(model_nox)[2],
    rm=coef(model_rm)[2],
    age=coef(model_age)[2],
    dis=coef(model_dis)[2],
    rad=coef(model_rad)[2],
    tax=coef(model_tax)[2],
    ptratio=coef(model_ptratio)[2],
    lstat=coef(model_lstat)[2],
    medv=coef(model_medv)[2]
    )
  
  model_all=lm(crim~.,data=Boston)
  multi_coefs<-coef(model_all)[-1]
  
  valid<-is.finite(simple_coefs)&is.finite(multi_coefs)
  
  plot(simple_coefs[valid],multi_coefs[valid],
       xlab ="Simple Regression Coefficients",
       ylab="Multiple Regression Coefficients",
       main="Simple vs. Multiple Regression Coefs",
       pch=19, col="green")
  
  text(simple_coefs, multi_coefs,
       labels = names(simple_coefs),
       pos = 3, cex = 0.6)
  #In the simple regressions (a), each variable was considered alone, so some effects were likely overestimated.
  #In the multiple regression (b), all variables were considered together, revealing more realistic and adjusted effects.
  #For example, nox showed a strong positive relationship in simple regression but switched to a negative effect in the multiple regression
  
  #d)
  model_age_poly<-lm(crim~age+I(age^2)+I(age^3), data=Boston)
  summary(model_age_poly)
  #There is evidence of a non-linear association between age and crim. 
  #The squared and cubic terms of age are statistically significant (p < 0.05), 
  #indicating a curved relationship rather than a simple linear one.
  
  model_zn_poly<-lm(crim~zn+I(zn^2)+I(zn^3), data=Boston)
  summary(model_zn_poly)
  #Only the linear term is significant (p = 0.0026), so there’s no strong evidence of a nonlinear relationship between zn and crim.
  
  model_indus_poly<-lm(crim~indus+I(indus^2)+I(indus^3), data=Boston)
  summary(model_indus_poly)
  #There is strong evidence of a nonlinear relationship between indus and crim — all terms including the squared and cubic terms are statistically significant (p < 0.001).
  
  model_chas_poly<-lm(crim~chas+I(chas^2)+I(chas^3), data=Boston)
  summary(model_chas_poly)
  #chas is binary, so chas² and chas³ are redundant. No non-linear relationship can be tested.
  
  model_nox_poly<-lm(crim~nox+I(nox^2)+I(nox^3), data=Boston)
  summary(model_nox_poly)
  #There is strong evidence of a non-linear relationship between nox and crim (all polynomial terms are highly significant, p < 0.001).
  
  model_rm_poly<-lm(crim~rm+I(rm^2)+I(rm^3), data=Boston)
  summary(model_rm_poly)
  #There is no strong evidence of a non-linear relationship between rm and crim, as none of the polynomial terms are statistically significant (all p-values > 0.2)
  
  model_dis_poly<-lm(crim~dis+I(dis^2)+I(dis^3), data=Boston)
  summary(model_dis_poly)
  #There is strong evidence of a non-linear relationship between dis and crim, as the squared and cubic terms are both highly statistically significant (p < 0.001)
  
  model_rad_poly<-lm(crim~rad+I(rad^2)+I(rad^3), data=Boston)
  summary(model_rad_poly)
  #There is no statistically significant linear or non-linear relationship between rad and crim, as all p-values are greater than 0.05.
  
  model_tax_poly<-lm(crim~tax+I(tax^2)+I(tax^3), data=Boston)
  summary(model_tax_poly)
  #There is no statistically significant linear or non-linear relationship between tax and crim, as all p-values are greater than 0.05.
  
  model_ptratio_poly<-lm(crim~ptratio+I(ptratio^2)+I(ptratio^3), data=Boston)
  summary(model_ptratio_poly)
  #There is evidence of a statistically significant non-linear relationship between ptratio and crim, 
  #as all polynomial terms (linear, squared, and cubed) have p-values < 0.01.
  
  model_lstat_poly<-lm(crim~lstat+I(lstat^2)+I(lstat^3), data=Boston)
  summary(model_lstat_poly)
  #There is no statistically significant linear or non-linear relationship between lstat and crim (all p > 0.05).
  
  model_medv_poly<-lm(crim~medv+I(medv^2)+I(medv^3), data=Boston)
  summary(model_medv_poly)
  #There is strong statistical evidence of a non-linear relationship between medv and crim (all p < 0.001).
  
#3. 
  #a)
  library(MASS)
  library(glmnet)
  
  data(Boston)
  set.seed(333)
  
  n<-nrow(Boston)
  test_indices<-sample(n,size=floor(0.2*n))
  train_data<-Boston[-test_indices,]
  test_data<-Boston[test_indices,]
  
  #stepwise
  null_model<-lm(crim~1,data=train_data)
  full_model<-lm(crim~.,data = train_data)
  stepwise_model<-step(full_model,direction="both",scope=list(lower=null_model, upper=full_model))
  
  pred_stepwise<-predict(stepwise_model, newdata=test_data)
  rmse_stepwise<-sqrt(mean((test_data$crim-pred_stepwise)^2))
  cat("Stepwise RMSE:", rmse_stepwise, "\n")
  
  #Ridge&LASSO
  x_train<-model.matrix(crim~., data=train_data)[,-1]
  y_train<-train_data$crim
  x_test<-model.matrix(crim~., data=test_data)[,-1]
  y_test<-test_data$crim
  
  ridge_cv<-cv.glmnet(x_train, y_train, alpha=0, nfolds=10,lambda=10^(seq(-3,2,length.out=100)), standardize=TRUE)
  lasso_cv<-cv.glmnet(x_train, y_train, alpha=1, nfolds=10, standardize=TRUE)
  plot(lasso_cv)
  plot(ridge_cv)
  
  lambda_min_ridge<-ridge_cv$lambda.min
  lambda_1se_ridge<-ridge_cv$lambda.1se
  lambda_min_lasso<-lasso_cv$lambda.min
  lambda_1se_lasso<-lasso_cv$lambda.1se
  
  pred_lasso_1se<-predict(lasso_cv,newx= x_test, s=lambda_1se_lasso)
  pred_ridge_1se<-predict(ridge_cv, newx = x_test, s=lambda_1se_ridge)
  
  rmse_lasso<-sqrt(mean((y_test-pred_lasso_1se)^2))
  rmse_ridge<-sqrt(mean((y_test-pred_ridge_1se)^2))
  
  cat("LASSO RMSE:",rmse_lasso, "\n" )
  cat("Ridge RMSE:",rmse_ridge, "\n" )
  
  #I evaluated Stepwise selection, LASSO, and Ridge regression on the Boston data set. 
  #The Stepwise model yielded the lowest test RMSE (9.94), followed by Ridge (11.80) and LASSO (11.88). 
  #This suggests that Stepwise had the best out-of-sample performance among the three.
  
  #b)
  #Based on the test set RMSE, the Stepwise model appears to perform best and is therefore recommended. 
  #It showed the lowest prediction error on the validation set, which is a reliable measure of generalization. 
  #Although LASSO and Ridge provide regularization and may help in preventing overfitting in high-dimensional settings, 
  #they did not outperform Stepwise in this case.
  
  #c)
  #No, the Stepwise model does not use all features in the dataset. 
  #It selects a subset of predictors based on their contribution to the model fit. 
  #This helps improve performance by reducing overfitting and enhancing model interpretability.
  
#4-6)
  #a)
  beta_0<--6
  beta_1<-0.05
  beta_2<-1  
  X1<-40
  X2<-3.5
  log_odds<-beta_0+beta_1*X1+beta_2*X2
  prob<-1/(1+exp(-log_odds))
  print(prob)
  #Estimated probability of receiving an A is 0.378 (37.8%)
  
  #b)
  target_prob<-0.5
  target_hours<--(beta_0+beta_2*X2)/beta_1
  print(target_hours)
  #Student needs to study 50 hours to get 50% chance of receiving an A grade
  
#4-9)
  #a)
  odds<-0.37
  p<-odds/(1+odds)
  cat("Probability of default:", round(p,4))
  #On average, 27% of people with 0.37 odds with default
  
  #b)
  p<-0.16
  odds<-p/(1-p)
  cat("Odds of default:", round(odds,4))
  #Person who has 16% chance of default has 0.19 odds
  
#4-13)
  #a)
  data("Weekly")
  str(Weekly)
  summary(Weekly)
  cor(Weekly[,sapply(Weekly, is.numeric)])
  pairs(Weekly[,c("Lag1","Lag2","Lag3","Lag4","Lag5","Today")])
  #Based on the numerical and graphical summaries of the Weekly dataset, there appear to be very weak or no clear patterns between past returns and the current week's return.
  #The pairwise scatterplots show no obvious linear relationships, and the correlation coefficients between these variables are all close to zero.
  
  #b)
  multi_logit<-glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume, data=Weekly, family=binomial)
  summary(multi_logit)
  #Among the predictors, only Lag2 is statistically significant (p = 0.0296), while the others do not show a significant relationship with the response variable.
  
  #c)
  Weekly$prob_multi<-predict(multi_logit,type="response")
  Weekly$pred_05<-ifelse(Weekly$prob_multi>0.5, "Up", "Down")
  Weekly$pred_05<-factor(Weekly$pred_05, levels=c("Down","Up"))
  Weekly$Direction<-factor(Weekly$Direction, levels=c("Down", "Up"))
  
  conf_05<- table(Predicted=Weekly$pred_05, Actual=Weekly$Direction)
  print("Confusion Matrix at 0.5 threshold:")
  print(conf_05)
  accuracy<-(554+57)/(54+48+430+557)
  print(accuracy)
  #The confusion matrix shows the model predicts "Up" much more often than "Down". 
  #It correctly classified 611 out of 1089 observations, giving an accuracy of 56.1%. 
  #This suggests the model tends to overpredict "Up" and struggles with identifying "Down" weeks.
  
  #d)
  train_data<-Weekly[Weekly$Year <= 2008,]
  test_data<-Weekly[Weekly$Year>2008,]

  logit_model<-glm(Direction~Lag2, data=train_data, family=binomial)
  pred_probs<-predict(logit_model, newdata=test_data, type="response")
  
  pred_class<-ifelse(pred_probs>0.5,"Up","Down")
  pred_class<-factor(pred_class,levels=c("Down","Up"))
  
  actual_class<-test_data$Direction
  conf_matrix<-table(Predicted=pred_class, Actual=actual_class)
  print(conf_matrix)
  
  #I trained a logistic regression model using data from 1990 to 2008 with Lag2 as the only predictor. 
  #Using this model on the 2009–2010 test data, we obtained a confusion matrix with 56 true positives and 9 true negatives. 
  #The overall accuracy is approximately 62.5%, suggesting moderate predictive performance on the held-out data.
  
#5)
  #a)
  library(tidyverse)  
  
  data<-read.csv("C:/Users/miso9/Desktop/미경이 유학중/2025 Summer/Machine Learning/Assignment 1/austinhouses.csv")
  data<-data %>%
    select(latestPrice,latitude, longitude, hasAssociation, livingAreaSqFt,
           numOfBathrooms, numOfBedrooms) %>%
    drop_na()
  
  data$logPrice<-log(data$latestPrice)
  
  set.seed(111)
  n<-nrow(data)
  train_index<-sample(1:n, size=0.8*n)
  train_data<-data[train_index,]
  test_data<-data[-train_index,]
  
  #b)
  library(rpart)
  library(rpart.plot)
  
  
  tree_model <- rpart(logPrice ~ latitude + longitude + hasAssociation + 
                        livingAreaSqFt + numOfBathrooms + numOfBedrooms,
                      data = train_data,
                      method = "anova", 
                      control = rpart.control(cp = 0.001))
  
  rpart.plot(tree_model, type = 3, extra = 1, fallen.leaves = TRUE,
             main = "Regression Tree for log(latestPrice)")
  
  log_preds <- predict(tree_model, newdata = test_data) 
  price_preds <- exp(log_preds)
  
  test_mse <- mean((test_data$latestPrice - price_preds)^2)
  cat("Test MSE (on original price scale):", round(test_mse, 2), "\n")
  
  #c)
  tree_full <- rpart(log(latestPrice) ~ ., data = train_data, method = "anova",
                     control = rpart.control(cp = 0.0001, minsplit = 10))
  
  plotcp(tree_full)
  print(tree_full$cptable)
  
  min_row <- which.min(tree_full$cptable[, "xerror"])
  min_cp <- tree_full$cptable[min_row, "CP"]
  
  se_threshold <- tree_full$cptable[min_row, "xerror"] + tree_full$cptable[min_row, "xstd"]
  se_row <- min(which(tree_full$cptable[, "xerror"] <= se_threshold))
  se_cp <- tree_full$cptable[se_row, "CP"]
  
  tree_pruned <- prune(tree_full, cp = se_cp)
  
  rpart.plot(tree_pruned, type = 3, extra = 1, fallen.leaves = TRUE,
             main = "Pruned Regression Tree (1-SE Rule)")
  
  preds_pruned <- predict(tree_pruned, newdata = test_data)
  mse_pruned <- mean((exp(preds_pruned) - test_data$latestPrice)^2)
  cat("Test MSE (Pruned Tree):", round(mse_pruned, 2), "\n")
  
  preds_full <- predict(tree_full, newdata = test_data)
  mse_full <- mean((exp(preds_full) - test_data$latestPrice)^2)
  cat("Test MSE (Full Tree):", round(mse_full, 2), "\n")
  
  #Pruning based on the 1-SE rule helped reduce the test MSE from 845.28 to 505.71.
  #The full tree was too complex and overfit the training data, while the pruned tree performed better on the 
  #test set.
  
  
  #d)
  library(randomForest)
  
  
  set.seed(111)
  bag_model <- randomForest(
    logPrice ~ latitude + longitude + hasAssociation + livingAreaSqFt + numOfBathrooms + numOfBedrooms,
    data = train_data,
    importance = TRUE
  )
  
  
  preds_bag_log <- predict(bag_model, newdata = test_data)
  mse_bag <- mean((exp(preds_bag_log) - test_data$latestPrice)^2)
  
  cat("Test MSE (Bagging, using formula):", round(mse_bag, 2), "\n")
  
  importance(bag_model)
  varImpPlot(bag_model)
  
  #Test MSE for Bagging : 22315.19 
  #Based on the importance() function, the most critical variables are latitude and livingAreaSqFt
  
  #e)
  set.seed(111)
  rf_model <- randomForest(
    logPrice ~ latitude + longitude + hasAssociation + livingAreaSqFt +
      numOfBathrooms + numOfBedrooms,
    data = train_data,
    importance = TRUE
  )
  
  rf_preds_log <- predict(rf_model, newdata = test_data)
  rf_preds_price <- exp(rf_preds_log)
  
  mse_rf <- mean((rf_preds_price - test_data$latestPrice)^2)
  cat("Test MSE (Random Forest):", round(mse_rf, 2), "\n")
  
  importance(rf_model)
  varImpPlot(rf_model)
  
  set.seed(111)
  p <- ncol(train_data) - 1 
  mtry_vals <- 1:p
  mse_vals <- numeric(length(mtry_vals))

  for (i in seq_along(mtry_vals)) {
    model <- randomForest(
      logPrice ~ latitude + longitude + hasAssociation + livingAreaSqFt +
        numOfBathrooms + numOfBedrooms,
      data = train_data,
      mtry = mtry_vals[i]
    )
    preds_log <- predict(model, newdata = test_data)
    preds_price <- exp(preds_log)
    mse_vals[i] <- mean((preds_price - test_data$latestPrice)^2)
  }
  
  plot(mtry_vals, mse_vals, type = "b", pch = 17, col = "green",
       xlab = "mtry (variables considered at each split)",
       ylab = "Test MSE",
       main = "Effect of mtry on Random Forest Test MSE")
  
  #I used random forests to predict log(latestPrice), and the test MSE (converted back to original scale) was
  #22,315.19. According to importance(), the most important variable was livingAreaSqFt, followed by 
  #latitude and longitude. I also tuned mtry and found that the test error was lowest when mtry = 3. After that,
  #the error slightly increased, suggesting that using too many variables per split may hurt performance.
  
  
  #f)
  library(BART)
  x_train <- train_data %>% 
    dplyr::select(latitude, longitude, hasAssociation, livingAreaSqFt, 
                  numOfBathrooms, numOfBedrooms) %>% 
    as.matrix()
  y_train <- train_data$logPrice
  x_test <- test_data %>% 
    dplyr::select(latitude, longitude, hasAssociation, livingAreaSqFt, 
                  numOfBathrooms, numOfBedrooms) %>% 
    as.matrix()
  y_test <- test_data$latestPrice
  
  set.seed(111)
  bart_model <- wbart(x.train = x_train, y.train = y_train,
                      x.test = x_test)
  yhat_test_log <- apply(bart_model$yhat.test, 2, mean)
  
  yhat_test <- exp(yhat_test_log)
  mse_bart <- mean((yhat_test - y_test)^2)
  cat("Test MSE (BART):", round(mse_bart, 2), "\n")
  
  plot(y_test, yhat_test,
       xlab = "Actual Price", ylab = "Predicted Price",
       main = "BART: Actual vs Predicted", pch = 18, col = "green")
  abline(0, 1, col = "orange", lwd = 2)
  
  #Using BART, the test MSE was 31,165.16. Most predictions aligned well with actual prices, especially in
  #the lower to mid range. However, prediction errors tended to increase for higher-priced homes. 
  #Overall, BART performed reasonably well but did not outperform Random Forest.
  
  
#6)
  #a)
  library(ISLR2)
  
  data(Caravan)
  train_data<-Caravan[1:1000,]
  test_data<-Caravan[-(1:1000),]
  
  #b)
  library(gbm)
  train_data$PurchaseBinary <- ifelse(train_data$Purchase == "Yes", 1, 0)
  test_data$PurchaseBinary  <- ifelse(test_data$Purchase == "Yes", 1, 0)
  
  set.seed(111)
  boost_model <- gbm(PurchaseBinary ~ . -Purchase, data = train_data, distribution = "bernoulli",
                     n.trees = 1000, shrinkage = 0.01, interaction.depth = 3)
  probs <- predict(boost_model, newdata = test_data, n.trees = 1000, type = "response")
  preds <- ifelse(probs > 0.5, 1, 0)
  
  table(Predicted = preds, Actual = test_data$PurchaseBinary)
  summary(boost_model)
  
  #I fitted a boosting model with 1,000 trees and shrinkage = 0.01. The most important predictors were
  #MINKM30 and MSKD. But overall performance was weak — only 9 buyers were correctly identified.
  
  
  #c)
  set.seed(111)
  boost_model <- gbm(PurchaseBinary ~ . -Purchase, data = train_data, distribution = "bernoulli",
                     n.trees = 1000, shrinkage = 0.01)
  probs_boost <- predict(boost_model, newdata = test_data, n.trees = 1000, type = "response")
  preds_boost <- ifelse(probs_boost > 0.2, 1, 0)
  
  cm_boost <- table(Predicted = preds_boost, Actual = test_data$PurchaseBinary)
  print(cm_boost)
  
  precision_boost <- cm_boost["1", "1"] / sum(cm_boost["1", ])
  cat("Boosting Precision:", round(precision_boost, 3), "\n")
  
  logit_model <- glm(PurchaseBinary ~ . -Purchase, data = train_data, family = "binomial")
  probs_logit <- predict(logit_model, newdata = test_data, type = "response")
  preds_logit <- ifelse(probs_logit > 0.2, 1, 0)
  
  cm_logit <- table(Predicted = preds_logit, Actual = test_data$PurchaseBinary)
  print(cm_logit)
  
  precision_logit <- cm_logit["1", "1"] / sum(cm_logit["1", ])
  cat("Logistic Regression Precision:", round(precision_logit, 3), "\n")
  
  #We compared the predictive performance of a boosting model and logistic regression on the Caravan dataset, 
  #using a 20% probability threshold. Boosting achieved a higher precision (0.213) compared to logistic regression (0.142), 
  #meaning that among people predicted to purchase, a greater proportion actually did under boosting. 