# (PART) HYPOTHESIS TESTING {-}

# What is Hypothesis Testing?*

## Explanation
Hypothesis testing is a statistical method used to make inferences or draw conclusions about a population based on a sample. It involves formulating a hypothesis, collecting data, and using statistical tests to determine whether there is enough evidence to reject the hypothesis.  

### **Key Terms in Hypothesis Testing:**  
- **Null Hypothesis (H₀):** Assumes no effect or no difference (e.g., "There is no difference in average heights between two groups").  
- **Alternative Hypothesis (H₁ or Ha):** The statement we aim to test (e.g., "There is a difference in average heights between two groups").  
- **Significance Level (α):** The probability threshold for rejecting H₀ (commonly set at 0.05).  
- **p-value:** The probability of observing the data if H₀ is true. If **p < α**, we reject H₀.  
- **Type I Error:** Incorrectly rejecting H₀ (false positive).  
- **Type II Error:** Failing to reject H₀ when it is false (false negative).  

### **Steps in Hypothesis Testing:**  
1. Formulate **H₀** and **H₁**.  
2. Choose a significance level (α).  
3. Select the appropriate statistical test.  
4. Compute the test statistic and p-value.  
5. Compare the p-value with α and draw conclusions.  

### **Common Hypothesis Tests:**  
- **t-tests** (Comparing means of one or two groups)  
- **ANOVA** (Comparing means of multiple groups)  
- **Chi-Square Test** (Testing independence in categorical data)  
- **Non-parametric tests** (For non-normally distributed data)  


### **Hypothesis Testing Q&A Topics**

1.	What is Hypothesis Testing? (Introduction)
2.	How to Perform a One-Sample t-test in Python and R?
3.	How to Perform a Two-Sample t-test in Python and R?
4.	How to Perform a Paired t-test in Python and R?
5.	How to Perform a One-Way ANOVA in Python and R?
6.	How to Perform a Two-Way ANOVA in Python and R?
7.	How to Perform a Repeated Measures ANOVA in Python and R?
8.	How to Perform a Chi-Square Test in Python and R?
9.	How to Perform a Mann-Whitney U Test in Python and R? (Non-parametric alternative to t-test)
10.	How to Perform a Kruskal-Wallis Test in Python and R? (Non-parametric alternative to One-Way ANOVA)
11.	How to Perform a Friedman Test in Python and R? (Non-parametric alternative to Repeated Measures ANOVA)
12.	How to Check Normality in Python and R? (Shapiro-Wilk, Kolmogorov-Smirnov tests)
13.	How to Perform a Levene’s Test in Python and R? (Checking homogeneity of variances)

Now, let’s move to the first statistical test:  





---


# **How to Perform a One-Sample t-test in Python and R using the iris dataset?**

## Explanation  
A **One-Sample t-test** compares the mean of a sample to a known or hypothesized population mean. In this case, we’ll test whether the mean `sepal_length` of the **iris dataset** is significantly different from a hypothesized population mean of 5.8 cm.

### Hypotheses 
- **H0 (Null Hypothesis):** The mean `sepal_length` in the sample is equal to 5.8 cm.  
- **H1 (Alternative Hypothesis):** The mean `sepal_length` in the sample is different from 5.8 cm.  

### **Dataset:**  
We will use the `iris` dataset with columns: `sepal_length`, `sepal_width`, `petal_length`, `petal_width`, and `species`, stored in `data/iris.csv`.

---

## Python Code 



```python
import pandas as pd
import scipy.stats as stats

# Load the iris dataset
df = pd.read_csv("data/iris.csv")

# Extract Sepal Length column
sepal_length = df["sepal_length"]

# Hypothesized population mean
pop_mean = 5.8

# Perform one-sample t-test
t_stat, p_value = stats.ttest_1samp(sepal_length, pop_mean)

# Display results
print(f"T-Statistic: {t_stat:.4f}")
print(f"P-Value: {p_value:.4f}")

# Interpretation
if p_value < 0.05:
    print("Reject the null hypothesis: The mean sepal length is significantly different from 5.8 cm.")
else:
    print("Fail to reject the null hypothesis: No significant difference from 5.8 cm.")
```

    T-Statistic: 0.6409
    P-Value: 0.5226
    Fail to reject the null hypothesis: No significant difference from 5.8 cm.


## R Code


``` r
# Load necessary libraries
library(readr)

# Load the iris dataset
df <- read_csv("data/iris.csv")

# Extract Sepal Length column
sepal_length <- df$sepal_length

# Hypothesized population mean
pop_mean <- 5.8

# Perform one-sample t-test
t_test_result <- t.test(sepal_length, mu = pop_mean)

# Display results
print(t_test_result)
```

```

	One Sample t-test

data:  sepal_length
t = 0.64092, df = 149, p-value = 0.5226
alternative hypothesis: true mean is not equal to 5.8
95 percent confidence interval:
 5.709732 5.976934
sample estimates:
mean of x 
 5.843333 
```

``` r
# Interpretation
if (t_test_result$p.value < 0.05) {
  print("Reject the null hypothesis: The mean sepal length is significantly different from 5.8 cm.")
} else {
  print("Fail to reject the null hypothesis: No significant difference from 5.8 cm.")
}
```

```
[1] "Fail to reject the null hypothesis: No significant difference from 5.8 cm."
```

# **How to Perform a Two-Sample t-test in Python and R using the iris dataset?**

## **Explanation**  
A **Two-Sample t-test** is used to determine if there is a significant difference between the means of two independent groups. In this case, we will compare the `sepal_length` between two species of iris flowers: **setosa** and **versicolor**.

### **Hypotheses:**  
- **H0 (Null Hypothesis):** The mean `sepal_length` of the two species is equal.  
- **H1 (Alternative Hypothesis):** The mean `sepal_length` of the two species is not equal.

### **Dataset:**  
We will use the `iris` dataset with columns: `sepal_length`, `sepal_width`, `petal_length`, `petal_width`, and `species`, stored in `data/iris.csv`.

---

## **Python Code**  




```python
import pandas as pd
import scipy.stats as stats

# Load the iris dataset
df = pd.read_csv("data/iris.csv")

# Filter sepal_length for setosa and versicolor species
setosa_sepal_length = df[df["species"] == "setosa"]["sepal_length"]
versicolor_sepal_length = df[df["species"] == "versicolor"]["sepal_length"]

# Perform two-sample t-test
t_stat, p_value = stats.ttest_ind(setosa_sepal_length, versicolor_sepal_length)

# Display results
print(f"T-Statistic: {t_stat:.4f}")
print(f"P-Value: {p_value:.4f}")

# Interpretation
if p_value < 0.05:
    print("Reject the null hypothesis: The mean sepal lengths of setosa and versicolor are significantly different.")
else:
    print("Fail to reject the null hypothesis: No significant difference between the mean sepal lengths of setosa and versicolor.")
```

    T-Statistic: -10.5210
    P-Value: 0.0000
    Reject the null hypothesis: The mean sepal lengths of setosa and versicolor are significantly different.


## R Code


``` r
# Load necessary libraries
library(readr)

# Load the iris dataset
df <- read_csv("data/iris.csv")

# Filter sepal_length for setosa and versicolor species
setosa_sepal_length <- df[df$species == "setosa", "sepal_length"]
versicolor_sepal_length <- df[df$species == "versicolor", "sepal_length"]

# Perform two-sample t-test
t_test_result <- t.test(setosa_sepal_length, versicolor_sepal_length)

# Display results
print(t_test_result)
```

```

	Welch Two Sample t-test

data:  setosa_sepal_length and versicolor_sepal_length
t = -10.521, df = 86.538, p-value < 2.2e-16
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -1.1057074 -0.7542926
sample estimates:
mean of x mean of y 
    5.006     5.936 
```

``` r
# Interpretation
if (t_test_result$p.value < 0.05) {
  print("Reject the null hypothesis: The mean sepal lengths of setosa and versicolor are significantly different.")
} else {
  print("Fail to reject the null hypothesis: No significant difference between the mean sepal lengths of setosa and versicolor.")
}
```

```
[1] "Reject the null hypothesis: The mean sepal lengths of setosa and versicolor are significantly different."
```

# **Q&A: How to Perform a Paired t-test (Dependent t-test) in Python and R?**

## **Explanation**

A **Paired t-test** (also known as the **Dependent t-test**) is used to compare the means of two related groups. It is typically applied when you have two measurements from the same subjects, such as **before** and **after** treatment.

The test helps determine if the mean difference between two related variables is significantly different from zero. The assumptions of a paired t-test are that the differences between the paired samples are normally distributed.

### **Null Hypothesis (H₀)**:
- The mean difference between the paired samples is equal to zero (no difference).

### **Alternative Hypothesis (H₁)**:
- The mean difference between the paired samples is not equal to zero (a difference exists).

---

## **Python Code**



```python
import pandas as pd
from scipy import stats
import warnings

# Suppress the specific warning
warnings.filterwarnings("ignore", category=RuntimeWarning, message=".*catastrophic cancellation.*")

# Load the dataset
df = pd.read_csv('data/iris.csv')

# Simulate before and after sepal_length data (for example purposes)
# Assuming 'sepal_length_before' and 'sepal_length_after' are our paired data
df['sepal_length_before'] = df['sepal_length']  # Example column
df['sepal_length_after'] = df['sepal_length'] + 0.2  # Example: adding a change

# Perform the Paired t-test
t_stat, p_value = stats.ttest_rel(df['sepal_length_before'], df['sepal_length_after'])

# Print the results
print(f"T-statistic: {t_stat}")
print(f"P-value: {p_value}")

# Conclusion based on significance level (alpha = 0.05)
if p_value < 0.05:
    print("Reject the null hypothesis: There is a significant difference.")
else:
    print("Fail to reject the null hypothesis: There is no significant difference.")
```

    T-statistic: -3.2333821133348364e+16
    P-value: 0.0
    Reject the null hypothesis: There is a significant difference.


## R Code


``` r
library(readr)
library(stats)

# Load the dataset
df <- read_csv("data/iris.csv")

# Simulate before and after sepal_length data (for example purposes)
# Assuming 'sepal_length_before' and 'sepal_length_after' are our paired data
df$sepal_length_before <- df$sepal_length  # Using original data for "before"
df$sepal_length_after <- df$sepal_length + rnorm(n = nrow(df), mean = 0.2, sd = 0.1)  # Adding some random variation to simulate a change

# Perform the Paired t-test
test_result <- t.test(df$sepal_length_before, df$sepal_length_after, paired = TRUE)

# Print the results
print(test_result)
```

```

	Paired t-test

data:  df$sepal_length_before and df$sepal_length_after
t = -24.8, df = 149, p-value < 2.2e-16
alternative hypothesis: true mean difference is not equal to 0
95 percent confidence interval:
 -0.2166209 -0.1846490
sample estimates:
mean difference 
     -0.2006349 
```

``` r
# Conclusion based on significance level (alpha = 0.05)
if(test_result$p.value < 0.05) {
  print("Reject the null hypothesis: There is a significant difference.")
} else {
  print("Fail to reject the null hypothesis: There is no significant difference.")
}
```

```
[1] "Reject the null hypothesis: There is a significant difference."
```

# **How to Perform One-Way ANOVA in Python and R using the iris dataset?**

## **Explanation**  
**One-Way ANOVA** (Analysis of Variance) is used to determine if there is a significant difference in the means of three or more independent groups. In this case, we will compare the `sepal_length` across the three species of iris flowers: **setosa**, **versicolor**, and **virginica**.

### **Hypotheses:**  
- **H0 (Null Hypothesis):** The mean `sepal_length` of all three species is equal.  
- **H1 (Alternative Hypothesis):** At least one of the species has a mean `sepal_length` different from the others.

### **Dataset:**  
We will use the `iris` dataset with columns: `sepal_length`, `sepal_width`, `petal_length`, `petal_width`, and `species`, stored in `data/iris.csv`.

---

## **Python Code**



```python
import pandas as pd
import scipy.stats as stats

# Load the iris dataset
df = pd.read_csv("data/iris.csv")

# Perform One-Way ANOVA
f_stat, p_value = stats.f_oneway(
    df[df["species"] == "setosa"]["sepal_length"],
    df[df["species"] == "versicolor"]["sepal_length"],
    df[df["species"] == "virginica"]["sepal_length"]
)

# Display results
print(f"F-Statistic: {f_stat:.4f}")
print(f"P-Value: {p_value:.4f}")

# Interpretation
if p_value < 0.05:
    print("Reject the null hypothesis: At least one species has a significantly different mean sepal length.")
else:
    print("Fail to reject the null hypothesis: No significant difference in mean sepal length among the species.")
```

    F-Statistic: 119.2645
    P-Value: 0.0000
    Reject the null hypothesis: At least one species has a significantly different mean sepal length.


## R Code


``` r
# Load necessary libraries
library(readr)

# Load the iris dataset
df <- read_csv("data/iris.csv")

# Perform One-Way ANOVA
anova_result <- aov(sepal_length ~ species, data = df)

# Display results
summary(anova_result)
```

```
             Df Sum Sq Mean Sq F value Pr(>F)    
species       2  63.21  31.606   119.3 <2e-16 ***
Residuals   147  38.96   0.265                   
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

``` r
# Interpretation
if (summary(anova_result)[[1]]$`Pr(>F)`[1] < 0.05) {
  print("Reject the null hypothesis: At least one species has a significantly different mean sepal length.")
} else {
  print("Fail to reject the null hypothesis: No significant difference in mean sepal length among the species.")
}
```

```
[1] "Reject the null hypothesis: At least one species has a significantly different mean sepal length."
```

## How to Perform One-Way ANOVA in Python and R?

### Explanation
One-Way ANOVA (Analysis of Variance) is used to compare the means of three or more independent groups to see if there is a significant difference between them. It assumes the groups are independent, the data is normally distributed, and the variances are homogeneous across groups.

### Python Code



```python
import pandas as pd
from scipy import stats

# Load the dataset
df = pd.read_csv("data/iris.csv")

# Perform One-Way ANOVA: Comparing sepal_length across different species
f_stat, p_value = stats.f_oneway(
    df[df['species'] == 'setosa']['sepal_length'],
    df[df['species'] == 'versicolor']['sepal_length'],
    df[df['species'] == 'virginica']['sepal_length']
)

# Print the results
print(f"F-statistic: {f_stat}")
print(f"P-value: {p_value}")

# Conclusion based on significance level (alpha = 0.05)
if p_value < 0.05:
    print("Reject the null hypothesis: There is a significant difference between at least one species.")
else:
    print("Fail to reject the null hypothesis: There is no significant difference between species.")
```

    F-statistic: 119.26450218450468
    P-value: 1.6696691907693826e-31
    Reject the null hypothesis: There is a significant difference between at least one species.


## R Code

``` r
library(readr)

# Load the dataset
df <- read_csv("data/iris.csv")

# Perform One-Way ANOVA: Comparing sepal_length across different species
test_result <- aov(sepal_length ~ species, data = df)

# Print the summary of the ANOVA test
summary_result <- summary(test_result)

# Extract the F-statistic and p-value from the summary
f_stat <- summary_result[[1]]$`F value`[1]
p_value <- summary_result[[1]]$`Pr(>F)`[1]

# Print the results
cat("F-statistic:", f_stat, "\n")
```

```
F-statistic: 119.2645 
```

``` r
cat("P-value:", p_value, "\n")
```

```
P-value: 1.669669e-31 
```

``` r
# Conclusion based on significance level (alpha = 0.05)
if (p_value < 0.05) {
  print("Reject the null hypothesis: There is a significant difference between at least one species.")
} else {
  print("Fail to reject the null hypothesis: There is no significant difference between species.")
}
```

```
[1] "Reject the null hypothesis: There is a significant difference between at least one species."
```

# How to Perform Two-Way ANOVA in Python and R?

### Explanation
Two-Way ANOVA is used when we have two independent variables (factors) and want to understand their individual and combined effects on a dependent variable. It is useful to examine the interaction between two factors, in addition to their main effects. For example, we may want to explore how species and petal length interact to affect the sepal length.

### Python Code




```python
import pandas as pd
import statsmodels.api as sm
from statsmodels.formula.api import ols
from statsmodels.stats.anova import anova_lm

# Load the dataset
df = pd.read_csv("data/iris.csv")

# Fit the model
model = ols('sepal_length ~ C(species) + C(petal_length)', data=df).fit()

# Perform Two-Way ANOVA
anova_result = anova_lm(model)

# Print the results
print(anova_result)

# Conclusion based on significance level (alpha = 0.05)
if anova_result['PR(>F)'][0] < 0.05:
    print("Reject the null hypothesis: There is a significant difference between the groups.")
else:
    print("Fail to reject the null hypothesis: There is no significant difference between the groups.")

```

                        df     sum_sq    mean_sq           F        PR(>F)
    C(species)         2.0  63.212133  31.606067  294.278523  5.378870e-44
    C(petal_length)   42.0  27.612422   0.657439    6.121295  2.322488e-14
    Residual         106.0  11.384599   0.107402         NaN           NaN
    Reject the null hypothesis: There is a significant difference between the groups.


## R Code


``` r
library(readr)
library(stats)

# Load the dataset
df <- read_csv("data/iris.csv")

# Fit the model
model <- lm(sepal_length ~ species + petal_length, data = df)

# Perform Two-Way ANOVA
anova_result <- anova(model)

# Print the results
print(anova_result)
```

```
Analysis of Variance Table

Response: sepal_length
              Df Sum Sq Mean Sq F value    Pr(>F)    
species        2 63.212 31.6061  276.62 < 2.2e-16 ***
petal_length   1 22.275 22.2745  194.95 < 2.2e-16 ***
Residuals    146 16.682  0.1143                      
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

``` r
# Conclusion based on significance level (alpha = 0.05)
if (anova_result["species", "Pr(>F)"] < 0.05) {
  print("Reject the null hypothesis: There is a significant difference between the groups.")
} else {
  print("Fail to reject the null hypothesis: There is no significant difference between the groups.")
}
```

```
[1] "Reject the null hypothesis: There is a significant difference between the groups."
```

# How to Perform a Repeated Measures ANOVA in Python and R? {#repeated-measures-anova}

## Explanation
A Repeated Measures ANOVA is used when you have multiple measurements taken on the same subjects, e.g., before and after treatment on the same individuals. It’s used to determine if there is a significant difference between the means of three or more groups that are related.

## Python Code


```python
import pandas as pd
import statsmodels.api as sm
from statsmodels.formula.api import ols
from statsmodels.stats.anova import anova_lm

# Load the dataset
df = pd.read_csv('data/iris.csv')

# Simulate repeated measures by duplicating rows for a "before" and "after" condition
df_long = pd.concat([df.assign(time='before'), df.assign(time='after')], ignore_index=True)

# Assign subject IDs (assuming each row in original df is a different subject)
df_long['subject'] = df_long.index % len(df)  # Assign a unique subject ID per original row

# Fit the model for Repeated Measures ANOVA
model = ols('sepal_length ~ C(time) + C(subject)', data=df_long).fit()

# Perform Repeated Measures ANOVA
anova_result = anova_lm(model)

# Print the results
print(anova_result)

# Conclusion based on significance level (alpha = 0.05)
if anova_result['PR(>F)'][0] < 0.05:
    print("Reject the null hypothesis: There is a significant difference between before and after.")
else:
    print("Fail to reject the null hypothesis: There is no significant difference.")
```

                   df        sum_sq       mean_sq             F    PR(>F)
    C(time)       1.0  2.608171e-29  2.608171e-29  1.631499e-01  0.686852
    C(subject)  149.0  2.043367e+02  1.371387e+00  8.578490e+27  0.000000
    Residual    149.0  2.381966e-26  1.598635e-28           NaN       NaN
    Fail to reject the null hypothesis: There is no significant difference.


## R Code


``` r
# Load necessary libraries
library(dplyr)
library(car)  # For Anova function

# Load the dataset
df <- read.csv("data/iris.csv")

# Simulate repeated measures by duplicating rows for "before" and "after" conditions
df_long <- df %>%
  mutate(time = "before") %>%
  bind_rows(df %>% mutate(time = "after"))

# Assign subject IDs (assuming each row in original df is a different subject)
df_long$subject <- rep(1:nrow(df), times = 2)

# Convert factors
df_long$time <- as.factor(df_long$time)
df_long$subject <- as.factor(df_long$subject)

# Fit the model for Repeated Measures ANOVA
model <- aov(sepal_length ~ time + Error(subject), data = df_long)

# Perform Repeated Measures ANOVA
anova_result <- summary(model)

# Print the results
print(anova_result)
```

```

Error: subject
           Df Sum Sq Mean Sq F value Pr(>F)
Residuals 149  204.3   1.371               

Error: Within
           Df    Sum Sq  Mean Sq F value Pr(>F)
time        1 3.000e-31 2.74e-31   0.049  0.825
Residuals 149 8.344e-28 5.60e-30               
```

# How to Perform a Chi-Square Test in Python and R? {#chi-square-test}

## Explanation
The Chi-Square Test is used to determine if there is a significant association between two categorical variables. It compares the observed frequencies to the expected frequencies under the assumption that no relationship exists between the variables.

## Python Code


```python
import pandas as pd
from scipy import stats

# Load the dataset
df = pd.read_csv('data/iris.csv')

# Create a contingency table (example)
contingency_table = pd.crosstab(df['species'], df['sepal_length'])

# Perform the Chi-Square Test
chi2_stat, p_value, dof, expected = stats.chi2_contingency(contingency_table)

# Print the results
print(f"Chi2 Stat: {chi2_stat}")
print(f"P-value: {p_value}")
print(f"Degrees of freedom: {dof}")
print(f"Expected frequencies:\n{expected}")

# Conclusion based on significance level (alpha = 0.05)
if p_value < 0.05:
    print("Reject the null hypothesis: There is a significant association between the variables.")
else:
    print("Fail to reject the null hypothesis: There is no significant association between the variables.")
```

    Chi2 Stat: 156.26666666666668
    P-value: 6.665987344005466e-09
    Degrees of freedom: 68
    Expected frequencies:
    [[0.33333333 1.         0.33333333 1.33333333 0.66666667 1.66666667
      2.         3.33333333 3.         1.33333333 0.33333333 2.
      2.33333333 2.         2.66666667 2.33333333 1.         2.
      2.         1.33333333 3.         2.33333333 1.66666667 0.66666667
      2.66666667 1.         1.33333333 0.33333333 0.33333333 1.
      0.33333333 0.33333333 0.33333333 1.33333333 0.33333333]
     [0.33333333 1.         0.33333333 1.33333333 0.66666667 1.66666667
      2.         3.33333333 3.         1.33333333 0.33333333 2.
      2.33333333 2.         2.66666667 2.33333333 1.         2.
      2.         1.33333333 3.         2.33333333 1.66666667 0.66666667
      2.66666667 1.         1.33333333 0.33333333 0.33333333 1.
      0.33333333 0.33333333 0.33333333 1.33333333 0.33333333]
     [0.33333333 1.         0.33333333 1.33333333 0.66666667 1.66666667
      2.         3.33333333 3.         1.33333333 0.33333333 2.
      2.33333333 2.         2.66666667 2.33333333 1.         2.
      2.         1.33333333 3.         2.33333333 1.66666667 0.66666667
      2.66666667 1.         1.33333333 0.33333333 0.33333333 1.
      0.33333333 0.33333333 0.33333333 1.33333333 0.33333333]]
    Reject the null hypothesis: There is a significant association between the variables.


## R Code


``` r
library(readr)

# Load the dataset
df <- read_csv('data/iris.csv')

# Create a contingency table (example)
contingency_table <- table(df$species, df$sepal_length)

# Perform the Chi-Square Test
chi2_result <- chisq.test(contingency_table)

# Print the results
print(chi2_result)
```

```

	Pearson's Chi-squared test

data:  contingency_table
X-squared = 156.27, df = 68, p-value = 6.666e-09
```

``` r
# Conclusion based on significance level (alpha = 0.05)
if(chi2_result$p.value < 0.05) {
  print("Reject the null hypothesis: There is a significant association between the variables.")
} else {
  print("Fail to reject the null hypothesis: There is no significant association between the variables.")
}
```

```
[1] "Reject the null hypothesis: There is a significant association between the variables."
```

# How to Perform a Mann-Whitney U Test in Python and R? {#mann-whitney-u-test}

## Explanation
The Mann-Whitney U Test is a non-parametric test (Non-parametric alternative to t-test), that is used to determine whether there is a significant difference between the distributions of two independent groups. It is the non-parametric alternative to the independent two-sample t-test.

## Python Code


```python
import pandas as pd
from scipy import stats

# Load the dataset
df = pd.read_csv('data/iris.csv')

# Perform the Mann-Whitney U Test: Comparing sepal_length between two species
group_1 = df[df['species'] == 'setosa']['sepal_length']
group_2 = df[df['species'] == 'versicolor']['sepal_length']

# Perform the test
u_stat, p_value = stats.mannwhitneyu(group_1, group_2)

# Print the results
print(f"U-statistic: {u_stat}")
print(f"P-value: {p_value}")

# Conclusion based on significance level (alpha = 0.05)
if p_value < 0.05:
    print("Reject the null hypothesis: There is a significant difference between the groups.")
else:
    print("Fail to reject the null hypothesis: There is no significant difference between the groups.")
```

    U-statistic: 168.5
    P-value: 8.34582714594069e-14
    Reject the null hypothesis: There is a significant difference between the groups.


## R Code


``` r
library(readr)

# Load the dataset
df <- read_csv("data/iris.csv", show_col_types = FALSE)

# Perform the Mann-Whitney U Test: Comparing sepal_length between two species
group_1 <- df$sepal_length[df$species == "setosa"]
group_2 <- df$sepal_length[df$species == "versicolor"]

# Perform the test
test_result <- wilcox.test(group_1, group_2, exact = FALSE)

# Print the results
print(test_result)
```

```

	Wilcoxon rank sum test with continuity correction

data:  group_1 and group_2
W = 168.5, p-value = 8.346e-14
alternative hypothesis: true location shift is not equal to 0
```

``` r
# Conclusion based on significance level (alpha = 0.05)
if (test_result$p.value < 0.05) {
  print("Reject the null hypothesis: There is a significant difference between the groups.")
} else {
  print("Fail to reject the null hypothesis: There is no significant difference between the groups.")
}
```

```
[1] "Reject the null hypothesis: There is a significant difference between the groups."
```


# How to Perform a Kruskal-Wallis Test in Python and R?

(Non-parametric alternative to One-Way ANOVA)

## Explanation

The Kruskal-Wallis Test is a non-parametric alternative to One-Way ANOVA used when the assumption of normality is violated. It determines whether there is a statistically significant difference between three or more independent groups.

- **H₀ (Null Hypothesis):** The distributions of the groups are identical.  
- **H₁ (Alternative Hypothesis):** At least one group has a significantly different distribution.

## Python Code




```python
import pandas as pd
from scipy import stats

# Load the dataset
df = pd.read_csv('data/iris.csv')

# Perform the Kruskal-Wallis Test: Comparing sepal_length across species
group_1 = df[df['species'] == 'setosa']['sepal_length']
group_2 = df[df['species'] == 'versicolor']['sepal_length']
group_3 = df[df['species'] == 'virginica']['sepal_length']

# Perform the test
h_stat, p_value = stats.kruskal(group_1, group_2, group_3)

# Print the results
print(f"H-statistic: {h_stat}")
print(f"P-value: {p_value}")

# Conclusion based on significance level (alpha = 0.05)
if p_value < 0.05:
    print("Reject the null hypothesis: At least one species has a significantly different sepal length distribution.")
else:
    print("Fail to reject the null hypothesis: No significant difference between species.")
```

    H-statistic: 96.93743600064833
    P-value: 8.91873433246198e-22
    Reject the null hypothesis: At least one species has a significantly different sepal length distribution.


## R Code


``` r
# Load necessary library
library(dplyr)

# Load the dataset
df <- read.csv("data/iris.csv")

# Perform the Kruskal-Wallis Test: Comparing sepal_length across species
kruskal_result <- kruskal.test(sepal_length ~ species, data = df)

# Print the results
print(kruskal_result)
```

```

	Kruskal-Wallis rank sum test

data:  sepal_length by species
Kruskal-Wallis chi-squared = 96.937, df = 2, p-value < 2.2e-16
```

``` r
# Conclusion based on significance level (alpha = 0.05)
if (kruskal_result$p.value < 0.05) {
  print("Reject the null hypothesis: At least one species has a significantly different sepal length distribution.")
} else {
  print("Fail to reject the null hypothesis: No significant difference between species.")
}
```

```
[1] "Reject the null hypothesis: At least one species has a significantly different sepal length distribution."
```

# How to Perform a Friedman Test in Python and R?

(Non-parametric alternative to Repeated Measures ANOVA)

## Explanation

The Friedman Test is a non-parametric alternative to Repeated Measures ANOVA used when the assumption of normality is violated. It evaluates whether there are significant differences between three or more related groups.

- **H₀ (Null Hypothesis):** The distributions of the related groups are identical.  
- **H₁ (Alternative Hypothesis):** At least one related group has a significantly different distribution.

## Python Code



```python
import pandas as pd
import numpy as np
from scipy.stats import friedmanchisquare

# Load the dataset
df = pd.read_csv('data/iris.csv')

# Simulate repeated measures data by duplicating rows for different time points
df_wide = pd.DataFrame({
    'subject': np.arange(len(df)),  # Assign unique subject IDs
    'time1': df['sepal_length'],
    'time2': df['sepal_length'] + 0.2,  # Simulating a change
    'time3': df['sepal_length'] + 0.4
})

# Optional: Add small noise (jitter) to avoid division by zero errors
# This is useful when there are tied ranks causing infinite Friedman statistic
df_wide[['time1', 'time2', 'time3']] += np.random.normal(0, 0.001, df_wide[['time1', 'time2', 'time3']].shape)

# Perform Friedman Test
stat, p_value = friedmanchisquare(df_wide['time1'], df_wide['time2'], df_wide['time3'])

# Print the results
print(f"Friedman statistic: {stat}")
print(f"P-value: {p_value}")

# Conclusion based on significance level (alpha = 0.05)
if p_value < 0.05:
    print("Reject the null hypothesis: At least one time point has a significantly different distribution.")
else:
    print("Fail to reject the null hypothesis: No significant difference between time points.")
```

    Friedman statistic: 300.0
    P-value: 7.175095973164448e-66
    Reject the null hypothesis: At least one time point has a significantly different distribution.


## R Code


``` r
# Load necessary libraries
library(dplyr)
library(tidyr)

# Load the dataset
df <- read.csv("data/iris.csv")

# Simulate repeated measures by duplicating rows for different conditions
df_long <- bind_rows(
  df %>% mutate(time = "before"),
  df %>% mutate(time = "after"),
  df %>% mutate(time = "followup")
)

# Assign subject IDs (assuming each row in original df is a different subject)
df_long$subject <- rep(1:nrow(df), times = 3)

# Add a small noise (jitter) to avoid division by zero
set.seed(123)  # Ensures reproducibility
df_long$sepal_length <- df_long$sepal_length + rnorm(nrow(df_long), mean = 0, sd = 0.001)

# Reshape data for Friedman test
df_wide <- pivot_wider(df_long, names_from = time, values_from = sepal_length)

# Perform the Friedman Test
friedman_result <- friedman.test(as.matrix(df_wide[, c("before", "after", "followup")]))

# Print the results
print(friedman_result)
```

```

	Friedman rank sum test

data:  as.matrix(df_wide[, c("before", "after", "followup")])
Friedman chi-squared = 1.2933, df = 2, p-value = 0.5238
```

``` r
# Conclusion based on significance level (alpha = 0.05)
if (friedman_result$p.value < 0.05) {
  print("Reject the null hypothesis: At least one time point has a significantly different distribution.")
} else {
  print("Fail to reject the null hypothesis: No significant difference between time points.")
}
```

```
[1] "Fail to reject the null hypothesis: No significant difference between time points."
```

# How to Check Normality in Python and R? 
(Shapiro-Wilk, Kolmogorov-Smirnov tests)

## Explanation

Normality tests are used to determine whether a dataset follows a normal (Gaussian) distribution. This is an important assumption for many statistical tests, including t-tests and ANOVA.

### Common Normality Tests:
- **Shapiro-Wilk Test**: Recommended for small to medium sample sizes (\< 50 observations).
- **Kolmogorov-Smirnov (KS) Test**: Suitable for larger samples but more sensitive to distribution shape.

### Hypotheses:
- **H₀ (Null Hypothesis)**: The data is normally distributed.
- **H₁ (Alternative Hypothesis)**: The data is not normally distributed.

## Python Code




```python
import pandas as pd
from scipy import stats

# Load the dataset
df = pd.read_csv('data/iris.csv')

# Extract the column to test for normality
data = df['sepal_length']

# Perform Shapiro-Wilk Test
shapiro_stat, shapiro_p = stats.shapiro(data)
print(f"Shapiro-Wilk Test: W={shapiro_stat}, p-value={shapiro_p}")

# Perform Kolmogorov-Smirnov Test
ks_stat, ks_p = stats.kstest(data, 'norm', args=(data.mean(), data.std()))
print(f"Kolmogorov-Smirnov Test: KS={ks_stat}, p-value={ks_p}")

# Conclusion
alpha = 0.05
if shapiro_p < alpha:
    print("Shapiro-Wilk: Reject the null hypothesis (Data is not normally distributed).")
else:
    print("Shapiro-Wilk: Fail to reject the null hypothesis (Data is normally distributed).")

if ks_p < alpha:
    print("Kolmogorov-Smirnov: Reject the null hypothesis (Data is not normally distributed).")
else:
    print("Kolmogorov-Smirnov: Fail to reject the null hypothesis (Data is normally distributed).")
```

    Shapiro-Wilk Test: W=0.9760899543762207, p-value=0.01018026564270258
    Kolmogorov-Smirnov Test: KS=0.08865361377316233, p-value=0.1781373784859196
    Shapiro-Wilk: Reject the null hypothesis (Data is not normally distributed).
    Kolmogorov-Smirnov: Fail to reject the null hypothesis (Data is normally distributed).


## R Code


``` r
# Load necessary library
library(readr)

# Load the dataset
df <- read_csv("data/iris.csv")

# Extract the column to test for normality
data <- df$sepal_length

# Perform Shapiro-Wilk Test
shapiro_test <- shapiro.test(data)
print(shapiro_test)
```

```

	Shapiro-Wilk normality test

data:  data
W = 0.97609, p-value = 0.01018
```

``` r
# Perform Kolmogorov-Smirnov Test
ks_test <- ks.test(data, "pnorm", mean=mean(data), sd=sd(data))
print(ks_test)
```

```

	Asymptotic one-sample Kolmogorov-Smirnov test

data:  data
D = 0.088654, p-value = 0.1891
alternative hypothesis: two-sided
```

``` r
# Conclusion
alpha <- 0.05
if (shapiro_test$p.value < alpha) {
  print("Shapiro-Wilk: Reject the null hypothesis (Data is not normally distributed).")
} else {
  print("Shapiro-Wilk: Fail to reject the null hypothesis (Data is normally distributed).")
}
```

```
[1] "Shapiro-Wilk: Reject the null hypothesis (Data is not normally distributed)."
```

``` r
if (ks_test$p.value < alpha) {
  print("Kolmogorov-Smirnov: Reject the null hypothesis (Data is not normally distributed).")
} else {
  print("Kolmogorov-Smirnov: Fail to reject the null hypothesis (Data is normally distributed).")
}
```

```
[1] "Kolmogorov-Smirnov: Fail to reject the null hypothesis (Data is normally distributed)."
```

# How to Perform a Levene’s Test in Python and R? (Checking homogeneity of variances)

## Explanation

Levene’s test is used to assess the homogeneity of variances across different groups. Homogeneity of variances is a key assumption for parametric tests like ANOVA.

### Hypotheses:
- **H₀ (Null Hypothesis)**: The variances of the groups are equal (homoscedasticity).
- **H₁ (Alternative Hypothesis)**: At least one group has a significantly different variance (heteroscedasticity).

## Python Code




```python
import pandas as pd
from scipy import stats

# Load the dataset
df = pd.read_csv('data/iris.csv')

# Extract groups based on species
group_1 = df[df['species'] == 'setosa']['sepal_length']
group_2 = df[df['species'] == 'versicolor']['sepal_length']
group_3 = df[df['species'] == 'virginica']['sepal_length']

# Perform Levene’s Test
levene_stat, p_value = stats.levene(group_1, group_2, group_3)

# Print the results
print(f"Levene’s Test Statistic: {levene_stat}")
print(f"P-value: {p_value}")

# Conclusion based on significance level (alpha = 0.05)
alpha = 0.05
if p_value < alpha:
    print("Reject the null hypothesis: Variances are significantly different.")
else:
    print("Fail to reject the null hypothesis: Variances are equal.")
```

    Levene’s Test Statistic: 6.35272002048269
    P-value: 0.0022585277836218586
    Reject the null hypothesis: Variances are significantly different.


## R Code


``` r
# Load necessary libraries
library(car)
library(readr)

# Load the dataset
df <- read_csv("data/iris.csv")

# Perform Levene’s Test
levene_test <- leveneTest(sepal_length ~ species, data = df)

# Print the results
print(levene_test)
```

```
Levene's Test for Homogeneity of Variance (center = median)
       Df F value   Pr(>F)   
group   2  6.3527 0.002259 **
      147                    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

``` r
# Conclusion
alpha <- 0.05
if (levene_test$"Pr(>F)"[1] < alpha) {
  print("Reject the null hypothesis: Variances are significantly different.")
} else {
  print("Fail to reject the null hypothesis: Variances are equal.")
}
```

```
[1] "Reject the null hypothesis: Variances are significantly different."
```

# How to compute the mean, median, and mode of a dataset?

## Explanation
- **Mean**: The average of all values in the dataset.
- **Median**: The middle value when the data is sorted.
- **Mode**: The value that appears most frequently in the dataset.

## Python Code



```python
import pandas as pd

# Load dataset
df = pd.read_csv("data/iris.csv")

# Compute mean, median, and mode
mean_values = df.drop(columns=["species"]).mean()
median_values = df.drop(columns=["species"]).median()
mode_values = df.drop(columns=["species"]).mode().iloc[0]

# Display results
print("Mean:\n")
print(mean_values)

print("\nMedian:\n")
print(median_values)

print("\nMode:\n")
print(mode_values)
```

    Mean:
    
    sepal_length    5.843333
    sepal_width     3.057333
    petal_length    3.758000
    petal_width     1.199333
    dtype: float64
    
    Median:
    
    sepal_length    5.80
    sepal_width     3.00
    petal_length    4.35
    petal_width     1.30
    dtype: float64
    
    Mode:
    
    sepal_length    5.0
    sepal_width     3.0
    petal_length    1.4
    petal_width     0.2
    Name: 0, dtype: float64


## R Code


``` r
# Load necessary libraries
library(tidyverse)

# Load dataset
df <- read_csv("data/iris.csv")

# Compute mean, median, and mode
mean_values <- df %>%
  select(-species) %>%
  summarise(across(everything(), mean))

median_values <- df %>%
  select(-species) %>%
  summarise(across(everything(), median))

mode_values <- df %>%
  select(-species) %>%
  summarise(across(everything(), ~ names(sort(table(.), decreasing = TRUE))[1]))

# Display results
print("Mean:")
```

```
[1] "Mean:"
```

``` r
print(mean_values)
```

```
# A tibble: 1 × 4
  sepal_length sepal_width petal_length petal_width
         <dbl>       <dbl>        <dbl>       <dbl>
1         5.84        3.06         3.76        1.20
```

``` r
print("Median:")
```

```
[1] "Median:"
```

``` r
print(median_values)
```

```
# A tibble: 1 × 4
  sepal_length sepal_width petal_length petal_width
         <dbl>       <dbl>        <dbl>       <dbl>
1          5.8           3         4.35         1.3
```

``` r
print("Mode:")
```

```
[1] "Mode:"
```

``` r
print(mode_values)
```

```
# A tibble: 1 × 4
  sepal_length sepal_width petal_length petal_width
  <chr>        <chr>       <chr>        <chr>      
1 5            3           1.4          0.2        
```

# How to Perform a Pearson Correlation Test in Python and R?

## Explanation  
The **Pearson Correlation Test** is used to determine the linear relationship between two continuous variables. It measures the strength and direction of the relationship, with a correlation coefficient (\(r\)) ranging from -1 to 1:
- \( r = 1 \) indicates a perfect positive linear relationship.
- \( r = -1 \) indicates a perfect negative linear relationship.
- \( r = 0 \) indicates no linear relationship.

The null hypothesis (\(H_0\)) assumes that there is no linear correlation between the two variables, while the alternative hypothesis (\(H_a\)) states that there is a linear correlation.

If the p-value is small (typically \( p < 0.05 \)), we reject the null hypothesis and conclude that there is a significant linear relationship between the two variables.

## Python Code



```python
import pandas as pd
from scipy.stats import pearsonr

# Load dataset
df = pd.read_csv("data/iris.csv")

# Select two variables for correlation test
x = df['sepal_length']
y = df['sepal_width']

# Perform Pearson Correlation Test
corr_coefficient, p_value = pearsonr(x, y)

# Display results
print(f"Pearson Correlation Coefficient: {corr_coefficient:.4f}")
print(f"P-value: {p_value:.4f}")

# Interpretation
if p_value < 0.05:
    print("Reject H0: There is a significant linear correlation between sepal length and sepal width.")
else:
    print("Fail to reject H0: No significant linear correlation between sepal length and sepal width.")
```

    Pearson Correlation Coefficient: -0.1176
    P-value: 0.1519
    Fail to reject H0: No significant linear correlation between sepal length and sepal width.


## R Code


``` r
# Load dataset
df <- read.csv("data/iris.csv")

# Select two variables for correlation test
x <- df$sepal_length
y <- df$sepal_width

# Perform Pearson Correlation Test
cor_result <- cor.test(x, y)

# Display results
print(cor_result)
```

```

	Pearson's product-moment correlation

data:  x and y
t = -1.4403, df = 148, p-value = 0.1519
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.27269325  0.04351158
sample estimates:
       cor 
-0.1175698 
```

``` r
# Interpretation
if (cor_result$p.value < 0.05) {
    print("Reject H0: There is a significant linear correlation between sepal length and sepal width.")
} else {
    print("Fail to reject H0: No significant linear correlation between sepal length and sepal width.")
}
```

```
[1] "Fail to reject H0: No significant linear correlation between sepal length and sepal width."
```

# How to Perform a Simple Linear Regression in Python and R?

## Explanation  
**Simple Linear Regression** is used to model the relationship between a dependent variable (\(Y\)) and an independent variable (\(X\)) by fitting a linear equation to observed data. The goal is to find the best-fitting line, represented by the equation:

\[
Y = \beta_0 + \beta_1 X + \epsilon
\]

Where:
- \(Y\) is the dependent variable,
- \(X\) is the independent variable,
- \(\beta_0\) is the intercept,
- \(\beta_1\) is the slope,
- \(\epsilon\) is the error term.

The null hypothesis (\(H_0\)) assumes that the slope of the regression line is zero, meaning there is no linear relationship between \(X\) and \(Y\). The alternative hypothesis (\(H_a\)) states that the slope is non-zero, indicating a significant relationship.

If the p-value is small (typically \( p < 0.05 \)), we reject the null hypothesis and conclude that there is a significant relationship between \(X\) and \(Y\).

## Python Code
Simple Linear Regression




```python
import pandas as pd
import statsmodels.api as sm

# Load dataset
df = pd.read_csv("data/iris.csv")

# Select independent and dependent variables
X = df['sepal_length']
y = df['sepal_width']

# Add a constant (intercept) to the independent variable
X = sm.add_constant(X)

# Perform linear regression
model = sm.OLS(y, X).fit()

# Display results
print(model.summary())

# Interpretation
if model.pvalues[1] < 0.05:
    print("Reject H0: There is a significant linear relationship between sepal length and sepal width.")
else:
    print("Fail to reject H0: No significant linear relationship between sepal length and sepal width.")
```

                                OLS Regression Results                            
    ==============================================================================
    Dep. Variable:            sepal_width   R-squared:                       0.014
    Model:                            OLS   Adj. R-squared:                  0.007
    Method:                 Least Squares   F-statistic:                     2.074
    Date:                Wed, 19 Mar 2025   Prob (F-statistic):              0.152
    Time:                        23:05:02   Log-Likelihood:                -86.732
    No. Observations:                 150   AIC:                             177.5
    Df Residuals:                     148   BIC:                             183.5
    Df Model:                           1                                         
    Covariance Type:            nonrobust                                         
    ================================================================================
                       coef    std err          t      P>|t|      [0.025      0.975]
    --------------------------------------------------------------------------------
    const            3.4189      0.254     13.484      0.000       2.918       3.920
    sepal_length    -0.0619      0.043     -1.440      0.152      -0.147       0.023
    ==============================================================================
    Omnibus:                        2.474   Durbin-Watson:                   1.263
    Prob(Omnibus):                  0.290   Jarque-Bera (JB):                1.994
    Skew:                           0.243   Prob(JB):                        0.369
    Kurtosis:                       3.288   Cond. No.                         43.4
    ==============================================================================
    
    Notes:
    [1] Standard Errors assume that the covariance matrix of the errors is correctly specified.
    Fail to reject H0: No significant linear relationship between sepal length and sepal width.


## R Code
Simple Linear Regression



``` r
# Load dataset
df <- read.csv("data/iris.csv")

# Select independent and dependent variables
X <- df$sepal_length
y <- df$sepal_width

# Perform linear regression
model <- lm(y ~ X)

# Display results
summary(model)
```

```

Call:
lm(formula = y ~ X)

Residuals:
    Min      1Q  Median      3Q     Max 
-1.1095 -0.2454 -0.0167  0.2763  1.3338 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  3.41895    0.25356   13.48   <2e-16 ***
X           -0.06188    0.04297   -1.44    0.152    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.4343 on 148 degrees of freedom
Multiple R-squared:  0.01382,	Adjusted R-squared:  0.007159 
F-statistic: 2.074 on 1 and 148 DF,  p-value: 0.1519
```

``` r
# Interpretation
if (summary(model)$coefficients[2,4] < 0.05) {
    print("Reject H0: There is a significant linear relationship between sepal length and sepal width.")
} else {
    print("Fail to reject H0: No significant linear relationship between sepal length and sepal width.")
}
```

```
[1] "Fail to reject H0: No significant linear relationship between sepal length and sepal width."
```

# How to Perform Multiple Linear Regression in Python and R?

## Explanation

**Multiple Linear Regression** is an extension of simple linear regression that models the relationship between a dependent variable (\(Y\)) and two or more independent variables (\(X_1, X_2, \dots, X_n\)). The equation for multiple linear regression is:

\[
Y = \beta_0 + \beta_1 X_1 + \beta_2 X_2 + \dots + \beta_n X_n + \epsilon
\]

Where:
- \(Y\) is the dependent variable,
- \(X_1, X_2, \dots, X_n\) are the independent variables,
- \(\beta_0\) is the intercept,
- \(\beta_1, \beta_2, \dots, \beta_n\) are the coefficients (slopes) for the predictors,
- \(\epsilon\) is the error term.

The null hypothesis (\(H_0\)) assumes that all regression coefficients are zero, meaning no relationship exists between the predictors and the dependent variable. The alternative hypothesis (\(H_a\)) suggests that at least one coefficient is non-zero, indicating a significant relationship.

If the p-value for a coefficient is small (typically \(p < 0.05\)), we reject the null hypothesis for that predictor and conclude that it significantly affects \(Y\).

## Python Code



```python
import pandas as pd
import statsmodels.api as sm

# Load dataset (you can use any dataset here)
df = pd.read_csv("data/iris.csv")

# Select independent variables (predictors)
X = df[['sepal_length', 'sepal_width', 'petal_length', 'petal_width']]  # Predictors

# Add a constant (intercept) to the model
X = sm.add_constant(X)

# Dependent variable (response)
y = df['sepal_length']  # Example of using sepal length as the dependent variable

# Fit the model
model = sm.OLS(y, X).fit()

# Display the results
print(model.summary())
```

                                OLS Regression Results                            
    ==============================================================================
    Dep. Variable:           sepal_length   R-squared:                       1.000
    Model:                            OLS   Adj. R-squared:                  1.000
    Method:                 Least Squares   F-statistic:                 9.587e+29
    Date:                Wed, 19 Mar 2025   Prob (F-statistic):               0.00
    Time:                        23:05:02   Log-Likelihood:                 4724.3
    No. Observations:                 150   AIC:                            -9439.
    Df Residuals:                     145   BIC:                            -9424.
    Df Model:                           4                                         
    Covariance Type:            nonrobust                                         
    ================================================================================
                       coef    std err          t      P>|t|      [0.025      0.975]
    --------------------------------------------------------------------------------
    const        -9.104e-15   4.83e-15     -1.887      0.061   -1.86e-14    4.34e-16
    sepal_length     1.0000   1.36e-15   7.36e+14      0.000       1.000       1.000
    sepal_width    1.11e-15   1.41e-15      0.790      0.431   -1.67e-15    3.89e-15
    petal_length  2.776e-16   1.34e-15      0.207      0.836   -2.37e-15    2.92e-15
    petal_width  -1.554e-15   2.23e-15     -0.698      0.486   -5.95e-15    2.84e-15
    ==============================================================================
    Omnibus:                        5.539   Durbin-Watson:                   0.030
    Prob(Omnibus):                  0.063   Jarque-Bera (JB):                3.049
    Skew:                           0.099   Prob(JB):                        0.218
    Kurtosis:                       2.330   Cond. No.                         91.9
    ==============================================================================
    
    Notes:
    [1] Standard Errors assume that the covariance matrix of the errors is correctly specified.


## R Code
Multiple Linear Regression


``` r
# Check if 'caret' is installed, if not, install it
if (!require(caret)) {
  # Set CRAN mirror
  options(repos = c(CRAN = "https://cran.rstudio.com/"))
  install.packages("caret")
  library(caret)
}
# Load dataset (use any dataset available)
df <- read.csv("data/iris.csv")

# Create training and test sets
set.seed(123)  # For reproducibility
trainIndex <- createDataPartition(df$sepal_length, p = 0.7, list = FALSE)
trainData <- df[trainIndex, ]
testData <- df[-trainIndex, ]

# Train the linear regression model
model <- train(sepal_length ~ sepal_width + petal_length + petal_width,
               data = trainData,
               method = "lm")

# Display the model details
print(model)
```

```
Linear Regression 

107 samples
  3 predictor

No pre-processing
Resampling: Bootstrapped (25 reps) 
Summary of sample sizes: 107, 107, 107, 107, 107, 107, ... 
Resampling results:

  RMSE       Rsquared   MAE    
  0.3188897  0.8743628  0.26081

Tuning parameter 'intercept' was held constant at a value of TRUE
```

``` r
# Predict on the test set
predictions <- predict(model, testData)

# Display predictions and actual values
predictions
```

```
       1        2        7       15       18       23       25       27 
5.024336 4.670085 4.878372 5.219239 4.949222 4.776489 5.351858 4.962606 
      30       31       33       36       42       49       52       56 
4.971134 4.900284 5.604227 4.652436 4.019344 5.245711 6.305208 6.172036 
      59       67       68       74       75       77       82       85 
6.322560 6.163508 6.007830 6.406499 6.083537 6.335945 5.476581 6.163508 
      87       88       91       93       99      100      105      108 
6.393707 5.738110 6.025775 5.707077 4.914596 5.853338 6.673476 7.301455 
     111      116      124      126      127      128      133      142 
6.407684 6.341690 6.044312 7.274983 6.035488 6.256863 6.372426 6.111491 
     144      146      149 
6.819737 6.120315 6.563065 
```

``` r
testData$sepal_length
```

```
 [1] 5.1 4.9 4.6 5.8 5.1 4.6 4.8 5.0 4.7 4.8 5.2 5.0 4.5 5.3 6.4 5.7 6.6 5.6 5.8
[20] 6.1 6.4 6.8 5.5 5.4 6.7 6.3 5.5 5.8 5.1 5.7 6.5 7.3 6.5 6.4 6.3 7.2 6.2 6.1
[39] 6.4 6.9 6.8 6.7 6.2
```

``` r
# Evaluate the model using RMSE (Root Mean Squared Error)
rmse <- sqrt(mean((predictions - testData$sepal_length)^2))
cat("RMSE: ", rmse)
```

```
RMSE:  0.3445695
```

---
