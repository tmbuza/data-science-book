# (PART) MACHINE LEARNING {-}

# How to Perform Logistic Regression in Python and R?

## Explanation

**Logistic Regression** is a statistical method used for binary classification. It models the relationship between a dependent variable (binary outcome, e.g., 0 or 1) and one or more independent variables. The logistic regression equation is:

\[
\log\left(\frac{p}{1 - p}\right) = \beta_0 + \beta_1 X_1 + \beta_2 X_2 + \dots + \beta_n X_n
\]

Where:
- \( p \) is the probability of the dependent event occurring (i.e., the probability that the output is 1),
- \( X_1, X_2, \dots, X_n \) are the independent variables (predictors),
- \( \beta_0 \) is the intercept,
- \( \beta_1, \beta_2, \dots, \beta_n \) are the coefficients (slopes) for the predictors.

The model estimates the odds of the event occurring by taking the log of the odds ratio. The predicted probabilities are obtained using the logistic function, which is:

\[
p = \frac{1}{1 + e^{-z}}
\]

Where \( z = \beta_0 + \beta_1 X_1 + \beta_2 X_2 + \dots + \beta_n X_n \).

If the p-value of a coefficient is small (typically \( p < 0.05 \)), we reject the null hypothesis and conclude that the predictor significantly influences the outcome.





## Python Code




```python
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, confusion_matrix

# Load dataset (you can use any binary classification dataset)
df = pd.read_csv("data/iris.csv")

# Select independent variables (predictors)
X = df[['sepal_length', 'sepal_width', 'petal_length', 'petal_width']]  # Predictors

# Create a binary dependent variable (response)
df['is_setosa'] = (df['species'] == 'setosa').astype(int)  # Convert 'setosa' to 1, others to 0
y = df['is_setosa']  # Target variable

# Split data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Fit the logistic regression model
model = LogisticRegression()
model.fit(X_train, y_train)

# Make predictions
y_pred = model.predict(X_test)

# Evaluate the model
print("Accuracy:", accuracy_score(y_test, y_pred))
print("Confusion Matrix:\n", confusion_matrix(y_test, y_pred))
```

    Accuracy: 1.0
    Confusion Matrix:
     [[26  0]
     [ 0 19]]


## R Code


``` r
# Import necessary libraries
library(readr)   # For reading data
library(caret)   # For model training and evaluation
library(dplyr)   # For data manipulation

# Load dataset with show_col_types = FALSE
df <- read_csv("data/iris.csv", show_col_types = FALSE)

# Select independent variables (predictors)
X <- df %>% select(sepal_length, sepal_width, petal_length, petal_width)

# Create a binary dependent variable (response)
df$is_setosa <- ifelse(df$species == 'setosa', 1, 0)  # Convert 'setosa' to 1, others to 0
y <- df$is_setosa  # Target variable

# Split data into training and testing sets (70% training, 30% testing)
set.seed(42)  # For reproducibility
trainIndex <- createDataPartition(y, p = 0.7, list = FALSE)
X_train <- X[trainIndex, ]
y_train <- y[trainIndex]
X_test <- X[-trainIndex, ]
y_test <- y[-trainIndex]

# Fit the logistic regression model
model <- glm(is_setosa ~ sepal_length + sepal_width + petal_length + petal_width, 
             data = df[trainIndex, ], family = binomial())

# Make predictions on the test set
y_pred_prob <- predict(model, X_test, type = "response")
y_pred <- ifelse(y_pred_prob > 0.5, 1, 0)  # Convert probabilities to binary outcomes

# Evaluate the model
accuracy <- mean(y_pred == y_test)
conf_matrix <- table(Predicted = y_pred, Actual = y_test)

# Print results
cat("Accuracy:", accuracy, "\n")
```

```
Accuracy: 1 
```

``` r
print(conf_matrix)
```

```
         Actual
Predicted  0  1
        0 33  0
        1  0 12
```

# How to Perform Support Vector Machine (SVM) Classification in Python and R?

## Explanation

**Support Vector Machine (SVM)** is a powerful supervised learning algorithm that can be used for both classification and regression tasks. It works by finding the hyperplane that best separates data points of different classes in a high-dimensional space.

- **Linear SVM**: Finds a straight line or hyperplane that divides the classes.
- **Non-linear SVM**: Uses kernel functions (like Radial Basis Function (RBF)) to transform the data into higher dimensions to make it linearly separable.

The main objective of SVM is to maximize the margin between the two classes. The margin is the distance between the hyperplane and the closest data points from either class, known as support vectors.

The SVM classifier works well for both linear and non-linear classification problems.

## Python Code




```python
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score, confusion_matrix

# Load dataset (you can use any dataset)
df = pd.read_csv("data/iris.csv")

# Select independent variables (predictors)
X = df[['sepal_length', 'sepal_width', 'petal_length', 'petal_width']]  # Features

# Select target variable (species)
y = df['species']  # Target

# Split data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Fit the SVM classifier
model = SVC(kernel='linear', random_state=42)
model.fit(X_train, y_train)

# Make predictions
y_pred = model.predict(X_test)

# Evaluate the model
print("Accuracy:", accuracy_score(y_test, y_pred))
print("Confusion Matrix:\n", confusion_matrix(y_test, y_pred))
```

    Accuracy: 1.0
    Confusion Matrix:
     [[19  0  0]
     [ 0 13  0]
     [ 0  0 13]]


## R Code

