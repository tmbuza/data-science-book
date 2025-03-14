# (PART) GETTING STARTED {-}

# How to Set Up Your Project Directory in Python and R {#set-project-dir}

**Explanation**

A well-organized project directory is key to efficient data science work. In this section, you will set up a project directory with separate folders for your datasets and scripts.


```
## Loading required package: tidyverse
```

```
## ── Attaching core tidyverse packages ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 2.0.0 ──
## ✔ dplyr     1.1.4     ✔ readr     2.1.5
## ✔ forcats   1.0.0     ✔ stringr   1.5.1
## ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
## ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
## ✔ purrr     1.0.4     
## ── Conflicts ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

## Python Code


```python
import os

# Define project structure
project_dir = './'
data_dir = os.path.join(project_dir, 'data')
scripts_dir = os.path.join(project_dir, 'scripts')
# images_dir = os.path.join(project_dir, 'images')
output_dir = os.path.join(project_dir, 'output')

# Create directories
os.makedirs(data_dir, exist_ok=True)
os.makedirs(scripts_dir, exist_ok=True)
# os.makedirs(images_dir, exist_ok=True)
os.makedirs(output_dir, exist_ok=True)

print(f"Project directory structure created at {project_dir}")
```

    Project directory structure created at ./


## R Code


``` r
# Define project structure
project_dir <- "./"
data_dir <- file.path(project_dir, "data")
scripts_dir <- file.path(project_dir, "scripts")
images_dir <- file.path(project_dir, "images")
output_dir <- file.path(project_dir, "output")

# Create directories
dir.create(data_dir, showWarnings = FALSE)
dir.create(scripts_dir, showWarnings = FALSE)
dir.create(images_dir, showWarnings = FALSE)
dir.create(output_dir, showWarnings = FALSE)

cat("Project directory structure created at", project_dir, "\n")
```

```
Project directory structure created at ./ 
```

# How to Save a Dataset in Python and R

**Explanation**

Saving datasets is essential for storing processed data, sharing results, and reusing data in later analysis. In Python, we commonly use pandas to save datasets in CSV format. In R, readr::write_csv() and write.csv() are common functions for saving datasets.

## Python Code


```python
import pandas as pd
from sklearn.datasets import load_iris

# Load the full iris dataset
iris = load_iris(as_frame=True)  
df = iris.frame  # Converts to DataFrame

# Add species names
df["species"] = df["target"].map({0: "setosa", 1: "versicolor", 2: "virginica"})

# Save dataset with all columns
df.to_csv("data/iris.csv", index=False)

print("Dataset saved as 'data/iris.csv'")
```

    Dataset saved as 'data/iris.csv'


## R Code


``` r
# Load necessary libraries
library(readr)

# Load the full iris dataset
df <- datasets::iris

# Save the dataset with species included using write_csv from readr
write_csv(df, "data/iris.csv")

# Confirmation message
print("Dataset saved as 'data/iris.csv'")
```

```
[1] "Dataset saved as 'data/iris.csv'"
```

# How to Load a Dataset in Python and R {#loading-a-dataset}

**Explanation**

After saving a dataset, we often need to load it back into our program for analysis. In Python, pandas.read_csv() is commonly used to load CSV files. In R, we use read_csv() or readr::read_csv() to achieve the same result.

## Python Code


```python
import pandas as pd

# Load dataset from CSV file
df = pd.read_csv("data/iris.csv")

# Display the first few rows
print(df.head())
```

       sepal length (cm)  sepal width (cm)  petal length (cm)  petal width (cm)  \
    0                5.1               3.5                1.4               0.2   
    1                4.9               3.0                1.4               0.2   
    2                4.7               3.2                1.3               0.2   
    3                4.6               3.1                1.5               0.2   
    4                5.0               3.6                1.4               0.2   
    
       target species  
    0       0  setosa  
    1       0  setosa  
    2       0  setosa  
    3       0  setosa  
    4       0  setosa  


## R Code


``` r
# Load necessary library
library(readr)

# Load dataset from CSV file
df <- read_csv("data/iris.csv")

# Display the first few rows
head(df)
```

```
# A tibble: 6 × 5
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
         <dbl>       <dbl>        <dbl>       <dbl> <chr>  
1          5.1         3.5          1.4         0.2 setosa 
2          4.9         3            1.4         0.2 setosa 
3          4.7         3.2          1.3         0.2 setosa 
4          4.6         3.1          1.5         0.2 setosa 
5          5           3.6          1.4         0.2 setosa 
6          5.4         3.9          1.7         0.4 setosa 
```

# How to Check the Structure of a Dataset in Python and R {#checking-dataset-structure}

**Explanation**

Understanding a dataset’s structure helps in selecting the right data processing techniques. In Python, df.info() provides an overview of column names, data types, and missing values. In R, str(df) serves the same purpose.

## Python Code


```python
import pandas as pd

# Load dataset
df = pd.read_csv("data/iris.csv")

# Display dataset structure
print(df.info())

```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 150 entries, 0 to 149
    Data columns (total 5 columns):
     #   Column        Non-Null Count  Dtype  
    ---  ------        --------------  -----  
     0   Sepal.Length  150 non-null    float64
     1   Sepal.Width   150 non-null    float64
     2   Petal.Length  150 non-null    float64
     3   Petal.Width   150 non-null    float64
     4   Species       150 non-null    object 
    dtypes: float64(4), object(1)
    memory usage: 6.0+ KB
    None


## R Code


``` r
# Load necessary library
library(readr)

# Load dataset from CSV file
df <- read_csv("data/iris.csv")

# Display dataset structure
str(df)
```

```
spc_tbl_ [150 × 5] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ Sepal.Length: num [1:150] 5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
 $ Sepal.Width : num [1:150] 3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
 $ Petal.Length: num [1:150] 1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
 $ Petal.Width : num [1:150] 0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
 $ Species     : chr [1:150] "setosa" "setosa" "setosa" "setosa" ...
 - attr(*, "spec")=
  .. cols(
  ..   Sepal.Length = col_double(),
  ..   Sepal.Width = col_double(),
  ..   Petal.Length = col_double(),
  ..   Petal.Width = col_double(),
  ..   Species = col_character()
  .. )
 - attr(*, "problems")=<externalptr> 
```

# How to View Summary Statistics of a Dataset in Python and R {#summary-statistics}

**Explanation**

Summary statistics provide insights into the dataset, such as the mean, median, min, max, and quartiles for numerical columns. In Python, df.describe() gives a quick statistical summary. In R, summary(df) does the same.

## Python Code


```python
import pandas as pd

# Load dataset
df = pd.read_csv("data/iris.csv")

# Display summary statistics
print(df.describe())
```

           Sepal.Length  Sepal.Width  Petal.Length  Petal.Width
    count    150.000000   150.000000    150.000000   150.000000
    mean       5.843333     3.057333      3.758000     1.199333
    std        0.828066     0.435866      1.765298     0.762238
    min        4.300000     2.000000      1.000000     0.100000
    25%        5.100000     2.800000      1.600000     0.300000
    50%        5.800000     3.000000      4.350000     1.300000
    75%        6.400000     3.300000      5.100000     1.800000
    max        7.900000     4.400000      6.900000     2.500000


## R Code


``` r
# Load necessary library
library(readr)

# Load dataset from CSV file
df <- read_csv("data/iris.csv")

# Display summary statistics
summary(df)
```

```
  Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
 Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
 Median :5.800   Median :3.000   Median :4.350   Median :1.300  
 Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
 Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
   Species         
 Length:150        
 Class :character  
 Mode  :character  
                   
                   
                   
```

# How to Check for Missing Values in a Dataset in Python and R {#checking-for-missing-values}

**Explanation**

Missing values can affect data analysis and machine learning models, so it’s important to detect them.

- In Python, df.isnull().sum() shows the number of missing values per column.
- In R, colSums(is.na(df)) performs a similar check.

## Python Code


```python
import pandas as pd

# Load dataset
df = pd.read_csv("data/iris.csv")

# Check for missing values
print(df.isnull().sum())
```

    sepal length (cm)    0
    sepal width (cm)     0
    petal length (cm)    0
    petal width (cm)     0
    target               0
    species              0
    dtype: int64


## R Code


``` r
# Load necessary library
library(readr)

# Load dataset from CSV file
df <- read_csv("data/iris.csv")

# Check for missing values
colSums(is.na(df))
```

```
Sepal.Length  Sepal.Width Petal.Length  Petal.Width      Species 
           0            0            0            0            0 
```

# How to Rename Columns in a Dataset in Python and R {#renaming-columns}

**Explanation**

Renaming columns makes datasets easier to work with, especially if column names are long or unclear.

- In Python, df.rename(columns={}) allows renaming specific columns.
- In R, colnames(df) <- c(...) is used to rename all columns at once, or names(df)[index] <- "new_name" for renaming specific ones.

## Python Code


```python
import pandas as pd

# Load dataset
df = pd.read_csv("data/iris.csv")

# Rename specific columns with the correct names
df.rename(columns={"Sepal.Length": "sepal_length", 
                   "Sepal.Width": "sepal_width", 
                   "Petal.Length": "petal_length", 
                   "Petal.Width": "petal_width", 
                   "Species": "species"}, inplace=True)

# Display the first few rows to confirm the changes
print(df.head())
```

       sepal_length  sepal_width  petal_length  petal_width species
    0           5.1          3.5           1.4          0.2  setosa
    1           4.9          3.0           1.4          0.2  setosa
    2           4.7          3.2           1.3          0.2  setosa
    3           4.6          3.1           1.5          0.2  setosa
    4           5.0          3.6           1.4          0.2  setosa


## R Code


``` r
# Load necessary library
library(readr)

# Load dataset from CSV file
df <- read_csv("data/iris.csv")

# Rename all columns
colnames(df) <- c("sepal_length", "sepal_width", "petal_length", "petal_width", "species")

# Display new column names
head(df)
```

```
# A tibble: 6 × 5
  sepal_length sepal_width petal_length petal_width species
         <dbl>       <dbl>        <dbl>       <dbl> <chr>  
1          5.1         3.5          1.4         0.2 setosa 
2          4.9         3            1.4         0.2 setosa 
3          4.7         3.2          1.3         0.2 setosa 
4          4.6         3.1          1.5         0.2 setosa 
5          5           3.6          1.4         0.2 setosa 
6          5.4         3.9          1.7         0.4 setosa 
```

# How to Filter Rows in a Dataset in Python and R

**Explanation**

Filtering allows you to extract specific rows that meet a given condition.

- In Python, you can use boolean indexing: df[df["column"] == value].
- In R, you can use subset(df, column == value) or df[df$column == value, ].


```python
import pandas as pd

# Load dataset
df = pd.read_csv("data/iris.csv")

# Filter rows where species is "setosa"
filtered_df = df[df["species"] == "setosa"]

# Display filtered rows
print(filtered_df.head())
```

       sepal_length  sepal_width  petal_length  petal_width species
    0           5.1          3.5           1.4          0.2  setosa
    1           4.9          3.0           1.4          0.2  setosa
    2           4.7          3.2           1.3          0.2  setosa
    3           4.6          3.1           1.5          0.2  setosa
    4           5.0          3.6           1.4          0.2  setosa


## R Code


``` r
# If necessary, install the tidyverse package
if(!require("tidyverse")) {install.packages("tidyverse")}

# Load the dplyr package from tidyverse
library(dplyr)

# Load dataset
df <- read_csv("data/iris.csv")

# Filter rows where species is 'setosa'
setosa_df <- filter(df, "species" == "setosa")

# Display the filtered dataset
print(setosa_df)
```

```
# A tibble: 0 × 5
# ℹ 5 variables: Sepal.Length <dbl>, Sepal.Width <dbl>, Petal.Length <dbl>,
#   Petal.Width <dbl>, Species <chr>
```

# How to Visualize a Dataset in Python and R

**Explanation**

Visualization is a powerful way to explore data.

- In Python, we can use matplotlib or seaborn for plotting.
- In R, ggplot2 is one of the most commonly used packages for visualization.

We’ll create a simple scatter plot to visualize the relationship between two features: sepal length and sepal width, and color the points based on the species.

## Python Code


```python
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load the dataset
df = pd.read_csv("data/iris.csv")

# Rename the columns to match the names you expect
df.rename(columns={
    'Sepal.Length': 'sepal_length', 
    'Sepal.Width': 'sepal_width', 
    'Petal.Length': 'petal_length', 
    'Petal.Width': 'petal_width', 
    'Species': 'species'}, inplace=True)

# Create a scatter plot
sns.scatterplot(data=df, x='sepal_length', y='sepal_width', hue='species')

# Add title and labels
plt.title("Sepal Length vs Sepal Width")
plt.xlabel("Sepal Length (cm)")
plt.ylabel("Sepal Width (cm)")

# Show the plot
plt.show()
```


    
![](getting-started-py_files/getting-started-py_25_0.png)
    


## R Code


``` r
# Install and load necessary libraries
if (!require("ggplot2")) install.packages("ggplot2")
library(ggplot2)
if (!require("readr")) install.packages("readr")
library(readr)

# Load the dataset
df <- read_csv("data/iris.csv")

# Rename the columns to match the names you expect
colnames(df) <- c("sepal_length", "sepal_width", "petal_length", "petal_width", "species")

# Create a scatter plot
ggplot(df, aes(x = sepal_length, y = sepal_width, color = species)) +
  geom_point() +
  labs(title = "Sepal Length vs Sepal Width", 
       x = "Sepal Length (cm)", 
       y = "Sepal Width (cm)") +
  theme_bw()
```

<img src="getting-started-py_files/figure-html/unnamed-chunk-10-1.png" width="672" />
