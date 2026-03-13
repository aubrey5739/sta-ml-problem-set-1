# Intro to Machine Learning — Problem Set 1

> STA (Intro to Machine Learning) 수업 과제 | Aubrey Oh (mo26298)  
> Language: R

This assignment covers foundational supervised learning methods applied to real-world datasets, including exploratory data analysis, linear and logistic regression, regularization, tree-based methods, and ensemble learning.

---

## 📋 Contents

| # | Topic | Methods | Dataset |
|---|-------|---------|---------|
| 1 | Exploratory Data Analysis | Pairwise scatterplots, correlation | Boston (ISLR2) |
| 2 | Linear Regression | Simple & Multiple OLS, Polynomial regression | Boston |
| 3 | Shrinkage & Selection | Stepwise, Ridge, LASSO | Boston |
| 4 | Logistic Regression | Binary classification, Confusion matrix | Weekly (ISLR2) |
| 5 | Regression Trees | Decision tree, Pruning (1-SE rule), Bagging, Random Forest, BART | Austin Housing |
| 6 | Classification Trees | Boosting (GBM), Logistic Regression | Caravan (ISLR2) |

---

## 🔍 Problem 1 — Exploratory Data Analysis (Boston)

**Dataset:** Boston housing data (506 suburbs, 13 variables)

- Examined relationships between crime rate (`crim`) and predictors via pairwise scatterplots
- Key findings:
  - `lstat` (% low-income) and `age` are positively correlated with crime
  - `zn` (large-lot zoning) is negatively correlated with crime
  - Tract 381 had the highest crime rate (88.98); Tract 488 had the highest tax rate (711)
  - 35 census tracts bound the Charles River
  - 13 tracts average more than 8 rooms per dwelling — generally affluent, low-crime areas

---

## 📐 Problem 2 — Linear Regression (Boston)

- Fit simple linear regression for each predictor vs. `crim`
- All predictors except `chas` showed statistically significant associations (p < 0.001)
- Fit multiple regression: only `zn`, `dis`, `rad`, `medv` significant at α = 0.05
- Compared univariate vs. multiple regression coefficients — notable sign flip for `nox`
- Tested polynomial (cubic) terms: `indus`, `nox`, `dis`, `age`, `ptratio`, `medv` show nonlinear relationships

---

## 🎯 Problem 3 — Shrinkage & Variable Selection (Boston)

| Model | Test RMSE |
|-------|-----------|
| Stepwise Selection | **9.94** ✅ Best |
| Ridge Regression | 11.80 |
| LASSO | 11.88 |

**Key finding:** Stepwise selection outperformed regularization methods on this dataset, achieving the lowest out-of-sample RMSE.

---

## 📊 Problem 4 — Logistic Regression (Weekly)

- Fit logistic regression predicting market direction (Up/Down) using 5 lag variables + Volume
- Only `Lag2` was statistically significant (p = 0.0296)
- Full model accuracy: **56.1%** — tends to overpredict "Up"
- Train (1990–2008) / Test (2009–2010) split with `Lag2` only: **62.5% accuracy**

---

## 🌳 Problem 5 — Regression Trees (Austin Housing)

**Task:** Predict `log(latestPrice)` using latitude, longitude, hasAssociation, livingAreaSqFt, numOfBathrooms, numOfBedrooms

| Model | Test MSE (original price scale) |
|-------|----------------------------------|
| Regression Tree | 30,339.5 |
| Full Tree | 845.28 |
| Pruned Tree (1-SE rule) | **505.71** ✅ |
| Bagging | 22,315.19 |
| Random Forest | 22,315.19 |
| BART | 31,165.16 |

**Key findings:**
- Pruning reduced overfitting significantly (MSE: 845 → 506)
- Most important variables: `livingAreaSqFt`, `latitude`, `longitude`
- Optimal `mtry` = 3 for Random Forest
- BART performed well in mid-price range but struggled with high-value homes

---

## 🛒 Problem 6 — Classification Trees (Caravan)

**Task:** Predict insurance purchase using boosting vs. logistic regression (threshold = 20%)

| Model | Precision |
|-------|-----------|
| Boosting (GBM, 1000 trees, shrinkage=0.01) | **0.213** ✅ |
| Logistic Regression | 0.142 |

**Key finding:** Boosting outperformed logistic regression in precision — more accurately identifying actual buyers among those predicted to purchase. Most important predictors: `MINKM30`, `MSKD`.

---

## 🛠 Tech Stack

```
R
├── ISLR2          — Boston, Weekly, Caravan datasets
├── glmnet         — Ridge & LASSO regression
├── rpart          — Decision & regression trees
├── rpart.plot     — Tree visualization
├── randomForest   — Bagging & Random Forest
├── BART           — Bayesian Additive Regression Trees
├── gbm            — Gradient Boosting
├── tidyverse      — Data manipulation
└── MASS           — Statistical utilities
```

---

## 🚀 How to Run

1. Clone this repository
   ```bash
   git clone https://github.com/aubrey5739/sta-ml-problem-set-1.git
   ```

2. Open `Problem_Set_1_Mikyung_Oh.R` in RStudio

3. Place the required dataset in the working directory:
   - `austinhouses.csv`

4. Install required packages if needed:
   ```r
   install.packages(c("ISLR2", "glmnet", "rpart", "rpart.plot",
                      "randomForest", "BART", "gbm", "tidyverse", "MASS"))
   ```

5. Run the script section by section

---

## 📁 Repository Structure

```
├── Problem_Set_1_Mikyung_Oh.R    # Main R script
├── Problem_Set_1_Mikyung_Oh.pdf  # Full report with outputs & comments
└── README.md
```

---

*Intro to Machine Learning | University of Texas at Austin*
