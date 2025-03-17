# (PART) STATISTICAL ANALYSIS {-}

# How to Perform Statistical Analysis in Python and R?

## Explanation

Statistical analysis helps us understand the characteristics of our dataset, identify patterns, and make data-driven decisions. In this section, we will cover basic statistical measures such as mean, median, variance, and correlation.



## Python Code


```python
import pandas as pd

# Load dataset
df = pd.read_csv("data/iris.csv")

# Summary statistics
summary_stats = df.describe()

# Calculate variance for numerical columns
variance = df.var(numeric_only=True)

# Calculate correlation between numerical variables
correlation = df.corr(numeric_only=True)

# Display results
print("Summary Statistics:\n", summary_stats)
print("\nVariance:\n", variance)
print("\nCorrelation:\n", correlation)
```

    Summary Statistics:
            sepal_length  sepal_width  petal_length  petal_width
    count    150.000000   150.000000    150.000000   150.000000
    mean       5.843333     3.057333      3.758000     1.199333
    std        0.828066     0.435866      1.765298     0.762238
    min        4.300000     2.000000      1.000000     0.100000
    25%        5.100000     2.800000      1.600000     0.300000
    50%        5.800000     3.000000      4.350000     1.300000
    75%        6.400000     3.300000      5.100000     1.800000
    max        7.900000     4.400000      6.900000     2.500000
    
    Variance:
     sepal_length    0.685694
    sepal_width     0.189979
    petal_length    3.116278
    petal_width     0.581006
    dtype: float64
    
    Correlation:
                   sepal_length  sepal_width  petal_length  petal_width
    sepal_length      1.000000    -0.117570      0.871754     0.817941
    sepal_width      -0.117570     1.000000     -0.428440    -0.366126
    petal_length      0.871754    -0.428440      1.000000     0.962865
    petal_width       0.817941    -0.366126      0.962865     1.000000


## R Code


``` r
# Load dataset
df <- read.csv("data/iris.csv")

# Summary statistics
summary_stats <- summary(df)

# Calculate variance for numerical columns
variance <- apply(df[, 1:4], 2, var)

# Calculate correlation between numerical variables
correlation <- cor(df[, 1:4])

# Display results
print("Summary Statistics:")
```

```
[1] "Summary Statistics:"
```

``` r
print(summary_stats)
```

```
  sepal_length    sepal_width     petal_length    petal_width   
 Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
 Median :5.800   Median :3.000   Median :4.350   Median :1.300  
 Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
 Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
   species         
 Length:150        
 Class :character  
 Mode  :character  
                   
                   
                   
```

``` r
print("\nVariance:")
```

```
[1] "\nVariance:"
```

``` r
print(variance)
```

```
sepal_length  sepal_width petal_length  petal_width 
   0.6856935    0.1899794    3.1162779    0.5810063 
```

``` r
print("\nCorrelation:")
```

```
[1] "\nCorrelation:"
```

``` r
print(correlation)
```

```
             sepal_length sepal_width petal_length petal_width
sepal_length    1.0000000  -0.1175698    0.8717538   0.8179411
sepal_width    -0.1175698   1.0000000   -0.4284401  -0.3661259
petal_length    0.8717538  -0.4284401    1.0000000   0.9628654
petal_width     0.8179411  -0.3661259    0.9628654   1.0000000
```

# How to Calculate Skewness and Kurtosis in Python and R?

## Explanation

Skewness and kurtosis help us understand the distribution of data.  
- **Skewness** measures the asymmetry of the data distribution. A skewness of 0 indicates a perfectly symmetric distribution.  
- **Kurtosis** measures the "tailedness" of the distribution. A normal distribution has a kurtosis of 3. Values greater than 3 indicate heavy tails, while values less than 3 indicate light tails.

## Python Code




```python
import pandas as pd
from scipy.stats import skew, kurtosis

# Load dataset
df = pd.read_csv("data/iris.csv")

# Compute skewness
skewness = df.iloc[:, :-1].apply(skew)

# Compute kurtosis
kurt = df.iloc[:, :-1].apply(kurtosis)

# Display results
print("Skewness:\n", skewness)
print("\nKurtosis:\n", kurt)
```

    Skewness:
     sepal_length    0.311753
    sepal_width     0.315767
    petal_length   -0.272128
    petal_width    -0.101934
    dtype: float64
    
    Kurtosis:
     sepal_length   -0.573568
    sepal_width     0.180976
    petal_length   -1.395536
    petal_width    -1.336067
    dtype: float64


## R Code


``` r
# Check and load necessary libraries from CRAN mirror
if(!require(tidyverse)) install.packages("tidyverse", dependencies = TRUE, repos = "https://cloud.r-project.org/")
if(!require(e1071)) install.packages("e1071", dependencies = TRUE, repos = "https://cloud.r-project.org/")

library(tidyverse)
library(e1071)

# Load dataset
df <- read_csv("data/iris.csv")

# Compute skewness and kurtosis
skewness_values <- df %>%
  select(-species) %>%
  summarise(across(everything(), skewness))

kurtosis_values <- df %>%
  select(-species) %>%
  summarise(across(everything(), kurtosis))

# Display results
print("Skewness:")
```

```
[1] "Skewness:"
```

``` r
print(skewness_values)
```

```
# A tibble: 1 × 4
  sepal_length sepal_width petal_length petal_width
         <dbl>       <dbl>        <dbl>       <dbl>
1        0.309       0.313       -0.269      -0.101
```

``` r
print("Kurtosis:")
```

```
[1] "Kurtosis:"
```

``` r
print(kurtosis_values)
```

```
# A tibble: 1 × 4
  sepal_length sepal_width petal_length petal_width
         <dbl>       <dbl>        <dbl>       <dbl>
1       -0.606       0.139        -1.42       -1.36
```

# How to Perform a t-test in Python and R?

## Explanation

**t-tests** are used to compare the means of two groups and determine whether they are significantly different from each other. In the iris dataset, we can compare the sepal length of two species to see if their means differ significantly.

There are different types of t-tests:

**Independent t-test**: Compares means between two independent groups.

**Paired t-test**: Compares means from the same group at different time points.

## Python Code

In Python, we use **scipy.stats.ttest_ind()** for an independent t-test.


```python
import pandas as pd
from scipy import stats

# Load dataset
df = pd.read_csv("data/iris.csv")

# Filter two species for comparison
setosa = df[df['species'] == 'setosa']['sepal_length']
versicolor = df[df['species'] == 'versicolor']['sepal_length']

# Perform independent t-test
t_stat, p_value = stats.ttest_ind(setosa, versicolor)

print(f"t-statistic: {t_stat}, p-value: {p_value}")
```

    t-statistic: -10.52098626754911, p-value: 8.985235037487079e-18


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
