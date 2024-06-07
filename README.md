# Loan Approval Prediction Using Logistic Regression and SAS Programming
This study focuses on developing a machine learning model for loan approval prediction using the SAS programming language. 

Here are the Categorical variables found in dataset:
1. gender
2. marital_status
3. family_members
4. qualification
5. employment
6. loan_history
7. loan_location

Here are the Continuous variables found in dataset:
1. candidate_income
2. guarantee_income
3. loan_amount
4. loan_duration

# EDA(training set)
Univariate analysis of variable:
Categorical: 
1. marital_status
2. loan_location
3. qualification
4. family_members

Continuous:
1. candidate_income
2. guarantee_income
3. loan_amount
4. loan_duration

Bivariate analysis of variable:
(Categorical VS Categorical)
1. qualification VS employment
2. qualification VS marital_status
3. qualification VS loan_location
(Categorical VS Continuous)

1. loan_location VS loan_amount
2. qualification VS guarantee_income
3. loan_duration VS loan_amount

# EDA(testing set)
Using SAS MACRO for univariate and bivariate analysis

# Impute missing value
There are missing values in both training and testing set.
Here are the variables that contain missing values:
(training - Categorical)
1. gender
2. family_members
3. marital_status
4. employment
5. loan_history

(training - Continuous)
1. loan_amount
2. loan_duration

(testing - Categorical)
1. gender
2. family_members
3. employment
4. loan_history

(testing - Continuous)
1. loan_amount
2. loan_duration

Treatment for missing value:
1.Categorical - impute by its mode 
2.Continuous - impute by its mean

# Model Creation
Logistic Regression Model will be created in this project. \\
After create the model, apply the model to predict the loan approval status for 
applicants in testing set.\\
A visualization for the predicted output will be done.