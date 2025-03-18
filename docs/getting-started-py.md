# (PART) GETTING STARTED {-}

#  Setting Up Your Development Environment {#setup-dev-envt}

Before diving into the Q&A sections, it's important to ensure your environment is properly set up. This section will guide you through the steps to prepare everything you need to start working with both Python and R. To begin working with data science, you’ll need to set up your development environment. Follow the steps below to install and configure the necessary tools.




## Install Python

1. Visit the official [Python website](https://www.python.org/downloads/) to download and install the latest version of Python.
2. During installation, ensure that you check the box to **add Python to your PATH**.

## Install R

1. Visit the official [R Project website](https://cran.r-project.org/) to download and install the latest version of R.
2. Follow the installation instructions for your operating system.

## Install VSCode

### Why Use VSCode?
**Visual Studio Code (VSCode)** is a lightweight, free, and powerful code editor that supports multiple programming languages, including **Python** and **R**. It provides an interactive environment for writing, running, and debugging code efficiently.  

### Installation Steps:
1. Download and install **Visual Studio Code (VSCode)** from the [official VSCode website](https://code.visualstudio.com/).
2. Once installed, open VSCode and install the necessary extensions to enable support for Python and R.

### **Installing Extensions in VSCode**
Extensions enhance the functionality of VSCode by adding language support, debugging tools, and other useful features.

**For Python:**

- Open VSCode.
- Press `Ctrl + Shift + X` (Windows/Linux) or `Cmd + Shift + X` (Mac) to open the Extensions Marketplace.
- Search for **Python** (developed by Microsoft).
- Click **Install**.
- This extension provides:
  - **IntelliSense** (code completion, function suggestions, and real-time error checking).
  - Debugging support.
  - Jupyter Notebook integration.
  - Formatting and linting tools.

**For R:**

- In the Extensions Marketplace, search for **R**.
- Click **Install**.
- This extension provides:
  - **IntelliSense** for R functions and datasets.
  - Integrated R terminal for running scripts.
  - Debugging support.

**What is IntelliSense?**

**IntelliSense** is an advanced code assistance feature that helps you write code faster and with fewer errors by providing **autocomplete suggestions, function hints, and real-time error checking**. It makes coding in Python and R easier by suggesting function names, displaying expected arguments, and highlighting errors before you run the code.

**Verify Installation**

After installing VSCode and the extensions:

- Open VSCode and check if the extensions are enabled.
- Open a Python or R script to ensure syntax highlighting and **IntelliSense** work correctly.
- If using R, ensure you have R installed on your system so that the R extension can detect it.

Now, you're ready to start coding in both **Python** and **R** using VSCode! 🚀


---



# (PART) BASIC KNOWLEDGE {-}

# How to Install Basic Libaries for Python and R 

## Explanation

Before you can load datasets in Python and R, you need to install the necessary libraries. Here's how you can install the basic libraries required for this guide:

## Python Code
In your terminal, run the following command to install the necessary libraries for data manipulation, visualization, and machine learning:

```bash
pip install pandas matplotlib scikit-learn
```


## R Code

In R, install the following packages to help with data manipulation and visualization:

```r
if (!require(tidyverse)) {install.packages('tidyverse')}
library(tidyverse)

if (!require(caret)) {install.packages('caret')}
library(caret)
```

The **tidyverse** R package contains a collection of essential packages for data science, including:

- **ggplot2** for data visualization  
- **dplyr** for data manipulation  
- **tidyr** for data tidying  
- **readr** for reading and writing data files  
- **purrr** for functional programming  
- **tibble** for an improved data frame format  
- **stringr** for string manipulation  
- **forcats** for categorical variable handling  

The **caret** package (short for *Classification and Regression Training*) is widely used for machine learning in R. It provides a unified interface for training and evaluating models, making it easier to apply machine learning techniques.

These libraries and packages will ensure you have the tools you need to get started with data analysis and visualization in both languages.

---


# How to Create a Project Directory in Python and R {#set-project-dir}

## Explanation
A well-organized project directory is key to efficient data science work. In this section, you will set up a project directory with separate folders for your datasets and scripts. Now that you have your environment set up, it’s time to create your project directory. This will help keep your files organized as you progress through the guide.

Create a new folder for your project, such as `beginner-data-science`. Inside this folder, create the following subfolders:

- **data**: This folder will store your datasets.
- **scripts**: Store Python or R scripts here.
- **images**: Use this folder for images related to the project.

**Example Structure:**

```plaintext
beginner-data-science/
  ├── data/
  ├── scripts/
  └── images/
```

---

## Python Code





```python
import os

# Define project structure
project_dir = './'
data_dir = os.path.join(project_dir, 'data')
scripts_dir = os.path.join(project_dir, 'scripts')
images_dir = os.path.join(project_dir, 'images')

# Create directories
os.makedirs(data_dir, exist_ok=True)
os.makedirs(scripts_dir, exist_ok=True)
os.makedirs(images_dir, exist_ok=True)

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

# Create directories
dir.create(data_dir, showWarnings = FALSE)
dir.create(scripts_dir, showWarnings = FALSE)
dir.create(images_dir, showWarnings = FALSE)

cat("Project directory structure created at", project_dir, "\n")
```

```
Project directory structure created at ./ 
```

---



# How to Save a Dataset in Python and R

## Explanation

Saving datasets is essential for storing processed data, sharing results, and reusing data in later analysis. In Python, we commonly use pandas to save datasets in CSV format. In R, readr::write_csv() and write.csv() are common functions for saving datasets. You will need to: 

1. Iris dataset is available from [this link](https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data).
2. Also comes with some python libraries such as sklearn.datasets in python and data() in R. 

Note! When working with datasets in both Python and R, it’s essential to save them in a structured format. However, the column names in the Iris dataset differ slightly between Python and R:

- Python (pandas version) uses:
  - sepal length (cm), sepal width (cm), petal length (cm), petal width (cm), species
- R (datasets::iris version) uses:
  - Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, Species

To maintain consistency, we will save two separate versions:

- iris-py.csv (from Python)
- iris-r.csv (from R)

This ensures that each dataset retains its original structure before standardization.

## Python Code



```python
import pandas as pd
from sklearn.datasets import load_iris

# Load the full iris dataset
iris = load_iris(as_frame=True)
df = iris.frame

# Add species names
df["species"] = df["target"].map({0: "setosa", 1: "versicolor", 2: "virginica"})

# Save the dataset as "iris-py.csv"
df.to_csv("data/iris_py.csv", index=False)

print("Dataset saved as 'data/iris_py.csv'")
```

    Dataset saved as 'data/iris_py.csv'



```python
# Add species names
df["species"] = df["target"].map({0: "setosa", 1: "versicolor", 2: "virginica"})

# Save dataset with all columns
df.to_csv("data/iris_py.csv", index=False)

print("Dataset saved as 'data/iris_py.csv'")

```

    Dataset saved as 'data/iris_py.csv'


## R Code


``` r
# Load necessary libraries
library(readr)

# Load the full iris dataset
df <- datasets::iris

# Save the dataset with species included using write_csv from readr
write_csv(df, "data/iris_r.csv")

# Confirmation message
print("Dataset saved as 'data/iris_r.csv'")
```

```
[1] "Dataset saved as 'data/iris_r.csv'"
```

---


# How to Rename Column Names in Python and R?

## Explanation

Since the column names differ between Python and R versions of the dataset, we will standardize them to ensure consistency. The renamed column names will be:

- sepal_length
- sepal_width
- petal_length
- petal_width
- species

This makes it easier to work with the dataset across different tools and languages.

After Renaming, we will save the final dataset as iris.csv.

## Python Code



```python
import pandas as pd

# Load dataset
df = pd.read_csv("data/iris_py.csv")

# Rename columns
df.rename(columns={'sepal length (cm)': 'sepal_length', 
                   'sepal width (cm)': 'sepal_width',
                   'petal length (cm)': 'petal_length',
                   'petal width (cm)': 'petal_width',
                   'species': 'species'}, inplace=True)

# Save the standardized dataset
df.to_csv("data/iris.csv", index=False)

print("Renamed dataset saved as 'data/iris.csv'")
```

    Renamed dataset saved as 'data/iris.csv'


## R Code


``` r
library(readr)
library(dplyr)

# Load dataset
df <- read_csv("data/iris_r.csv")

# Rename columns
df <- df %>%
  rename(sepal_length = Sepal.Length,
         sepal_width = Sepal.Width,
         petal_length = Petal.Length,
         petal_width = Petal.Width,
         species = Species)

# Save the standardized dataset
write_csv(df, "data/iris.csv")

print("Renamed dataset saved as 'data/iris.csv'")
```

```
[1] "Renamed dataset saved as 'data/iris.csv'"
```

# How to load a dataset in Python and R?

## Explanation

Loading a dataset is one of the first steps in any data analysis project. In this case, we'll load the Iris dataset, a popular dataset for beginner data science projects, in both Python and R. The dataset has been saved as `iris.csv` in your `data` folder.

We will use **pandas** in Python and **readr** in R to load the dataset into a dataframe.

- In Python we will use the `pandas` library, which is a powerful tool for data manipulation and analysis.
- The `read_csv()` function in pandas will allow us to read the `iris.csv` file into a dataframe.

- In R we will use the `readr` package, which provides modern and faster alternatives to base R functions.
- The `read_csv()` function in `readr` is similar to pandas in Python and offers a streamlined approach for loading CSV files.


## Python Code



```python

import pandas as pd

# Load the dataset
iris = pd.read_csv('data/iris.csv')

# Show the first few rows
print(iris.head())



```

       sepal_length  sepal_width  petal_length  petal_width  target species
    0           5.1          3.5           1.4          0.2       0  setosa
    1           4.9          3.0           1.4          0.2       0  setosa
    2           4.7          3.2           1.3          0.2       0  setosa
    3           4.6          3.1           1.5          0.2       0  setosa
    4           5.0          3.6           1.4          0.2       0  setosa


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
  sepal_length sepal_width petal_length petal_width species
         <dbl>       <dbl>        <dbl>       <dbl> <chr>  
1          5.1         3.5          1.4         0.2 setosa 
2          4.9         3            1.4         0.2 setosa 
3          4.7         3.2          1.3         0.2 setosa 
4          4.6         3.1          1.5         0.2 setosa 
5          5           3.6          1.4         0.2 setosa 
6          5.4         3.9          1.7         0.4 setosa 
```

---


# How to Explore a Dataset in Python and R?

## Explanation

After loading a dataset, it is important to explore its structure, summary statistics, and key properties before performing any analysis. This helps in understanding the data and identifying potential issues such as missing values or outliers.

In this section, we will:

- View the structure of the dataset.
- Get summary statistics.
- Check for missing values.

## Python Code



```python
import pandas as pd

# Load the dataset
iris = pd.read_csv('data/iris.csv')

# Display basic information about the dataset
print("Dataset Information:")
print(iris.info())

# Show summary statistics
print("\nSummary Statistics:")
print(iris.describe())

# Check for missing values
print("\nMissing Values:")
print(iris.isnull().sum())
```

    Dataset Information:
    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 150 entries, 0 to 149
    Data columns (total 6 columns):
     #   Column        Non-Null Count  Dtype  
    ---  ------        --------------  -----  
     0   sepal_length  150 non-null    float64
     1   sepal_width   150 non-null    float64
     2   petal_length  150 non-null    float64
     3   petal_width   150 non-null    float64
     4   target        150 non-null    int64  
     5   species       150 non-null    object 
    dtypes: float64(4), int64(1), object(1)
    memory usage: 7.2+ KB
    None
    
    Summary Statistics:
           sepal_length  sepal_width  petal_length  petal_width      target
    count    150.000000   150.000000    150.000000   150.000000  150.000000
    mean       5.843333     3.057333      3.758000     1.199333    1.000000
    std        0.828066     0.435866      1.765298     0.762238    0.819232
    min        4.300000     2.000000      1.000000     0.100000    0.000000
    25%        5.100000     2.800000      1.600000     0.300000    0.000000
    50%        5.800000     3.000000      4.350000     1.300000    1.000000
    75%        6.400000     3.300000      5.100000     1.800000    2.000000
    max        7.900000     4.400000      6.900000     2.500000    2.000000
    
    Missing Values:
    sepal_length    0
    sepal_width     0
    petal_length    0
    petal_width     0
    target          0
    species         0
    dtype: int64


## R Code


``` r
# Load necessary library
library(readr)
library(dplyr)

# Load the dataset
df <- read_csv("data/iris.csv")

# Display the structure of the dataset
cat("Dataset Structure:\n")
```

```
Dataset Structure:
```

``` r
str(df)
```

```
spc_tbl_ [150 × 5] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ sepal_length: num [1:150] 5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
 $ sepal_width : num [1:150] 3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
 $ petal_length: num [1:150] 1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
 $ petal_width : num [1:150] 0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
 $ species     : chr [1:150] "setosa" "setosa" "setosa" "setosa" ...
 - attr(*, "spec")=
  .. cols(
  ..   sepal_length = col_double(),
  ..   sepal_width = col_double(),
  ..   petal_length = col_double(),
  ..   petal_width = col_double(),
  ..   species = col_character()
  .. )
 - attr(*, "problems")=<externalptr> 
```

``` r
# Show summary statistics
cat("\nSummary Statistics:\n")
```

```

Summary Statistics:
```

``` r
summary(df)
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
# Check for missing values
cat("\nMissing Values:\n")
```

```

Missing Values:
```

``` r
colSums(is.na(df))
```

```
sepal_length  sepal_width petal_length  petal_width      species 
           0            0            0            0            0 
```

---

# How to Handle Missing Data in Python and R?

## Explanation

Handling missing data is one of the most important steps in data cleaning. In this section, we’ll explore how to handle missing values in a dataset. There are several strategies for handling missing data, such as:

- **Removing missing values**
- **Imputing missing values** (filling them with a specific value or a calculated statistic)

In this guide, we will focus on removing missing values, though you can also explore imputation depending on your data and goals.

## Python Code

In Python, we can use **pandas** to detect and handle missing data. The `isna()` and `dropna()` functions are commonly used for this task.



```python
import pandas as pd

# Load dataset
df = pd.read_csv("data/iris.csv")
df
# Check for missing values
print(df.isna().sum())

# Remove rows with missing data
df_cleaned = df.dropna()

# Check the cleaned data
print(df_cleaned.head())
```

    sepal_length    0
    sepal_width     0
    petal_length    0
    petal_width     0
    target          0
    species         0
    dtype: int64
       sepal_length  sepal_width  petal_length  petal_width  target species
    0           5.1          3.5           1.4          0.2       0  setosa
    1           4.9          3.0           1.4          0.2       0  setosa
    2           4.7          3.2           1.3          0.2       0  setosa
    3           4.6          3.1           1.5          0.2       0  setosa
    4           5.0          3.6           1.4          0.2       0  setosa


## R Code

In R, we can use the is.na() function to detect missing values, and the na.omit() function to remove them.


``` r
library(dplyr)
library(readr)

# Load dataset
df <- read_csv("data/iris.csv")

# Check for missing values
missing_values <- colSums(is.na(df))
print(missing_values)
```

```
sepal_length  sepal_width petal_length  petal_width      species 
           0            0            0            0            0 
```

``` r
# Remove rows with missing data
df_cleaned <- na.omit(df)

# Check the cleaned data
head(df_cleaned)
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

Handling missing data properly ensures that your analysis is accurate and that missing values do not introduce bias into your model or analysis.

# How to Filter Data in Python and R?

## Explanation

Filtering data is a common task in data science. It allows you to select specific rows based on conditions or criteria, helping you focus on the subset of data that is most relevant to your analysis.

In this section, we will learn how to filter data using conditions in both Python and R. We'll demonstrate filtering rows based on specific column values.

## Python Code

In Python, we use **pandas** to filter data. The `loc[]` method is useful for selecting rows based on specific conditions.



```python
import pandas as pd

# Load dataset
df = pd.read_csv("data/iris.csv")

# Filter rows where species is 'setosa'
setosa_df = df[df['species'] == 'setosa']

# Show the first few rows of the filtered data
print(setosa_df.head())
```

       sepal_length  sepal_width  petal_length  petal_width  target species
    0           5.1          3.5           1.4          0.2       0  setosa
    1           4.9          3.0           1.4          0.2       0  setosa
    2           4.7          3.2           1.3          0.2       0  setosa
    3           4.6          3.1           1.5          0.2       0  setosa
    4           5.0          3.6           1.4          0.2       0  setosa


## R Code

In R, we can use the dplyr package to filter rows based on specific conditions. The filter() function is used for this purpose.



``` r
library(dplyr)
library(readr)

# Load dataset
df <- read_csv("data/iris.csv")

# Filter rows where species is 'setosa'
setosa_df <- df %>% filter(species == 'setosa')

# Show the first few rows of the filtered data
head(setosa_df)
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

Filtering data allows you to narrow down your dataset and focus on specific insights or subsets of interest. In real-world projects, filtering is often one of the first steps in analyzing a dataset.

# How to Group Data in Python and R?

## Explanation

Grouping data is a common task when summarizing and analyzing datasets. In this section, we’ll group the Iris dataset by the Species column and calculate summary statistics (e.g., mean) for each group.

In Python, we use **pandas** for this task, while in R we use **dplyr**. Let’s explore how to group the data by species and calculate the mean of each numeric column.

## Python Code


```python
import pandas as pd

# Load dataset
df = pd.read_csv("data/iris.csv")

# Group by 'Species' and calculate the mean for each group
grouped_df = df.groupby('species').mean()

# Display the grouped data
print(grouped_df)

```

                sepal_length  sepal_width  petal_length  petal_width  target
    species                                                                 
    setosa             5.006        3.428         1.462        0.246     0.0
    versicolor         5.936        2.770         4.260        1.326     1.0
    virginica          6.588        2.974         5.552        2.026     2.0


## R Code


``` r
library(dplyr)
library(readr)

# Load dataset
df <- read_csv("data/iris.csv")

# Group by 'species' and calculate the mean for each group
grouped_df <- df %>%
  group_by(species) %>%
  summarise(across(where(is.numeric), mean))

# Display the grouped data
print(grouped_df)
```

```
# A tibble: 3 × 5
  species    sepal_length sepal_width petal_length petal_width
  <chr>             <dbl>       <dbl>        <dbl>       <dbl>
1 setosa             5.01        3.43         1.46       0.246
2 versicolor         5.94        2.77         4.26       1.33 
3 virginica          6.59        2.97         5.55       2.03 
```

# How to Aggregate Data in Python and R?

## Explanation

Aggregation helps summarize datasets by computing statistics such as mean, median, count, or sum for different groups. This is useful when analyzing patterns within the dataset.

For example, in the iris dataset, we can find the average sepal width per species to compare flower characteristics.

## Python Code


```python
import pandas as pd

# Load the dataset
df = pd.read_csv("data/iris.csv")

# Aggregate: Calculate mean sepal width per species
agg_df = df.groupby("species")["sepal_width"].mean().reset_index()

# Save the aggregated data
agg_df.to_csv("data/iris_aggregated_py.csv", index=False)

# Display the result
print(agg_df)
```

          species  sepal_width
    0      setosa        3.428
    1  versicolor        2.770
    2   virginica        2.974


## R Code


``` r
# Load necessary libraries
library(readr)
library(dplyr)

# Load the dataset
df <- read_csv("data/iris.csv")

# Aggregate: Calculate mean sepal width per species
agg_df <- df %>%
  group_by(species) %>%
  summarise(mean_sepal_width = mean(sepal_width, na.rm = TRUE))

# Save the aggregated data
write_csv(agg_df, "data/iris_aggregated_r.csv")

# Display the result
print(agg_df)
```

```
# A tibble: 3 × 2
  species    mean_sepal_width
  <chr>                 <dbl>
1 setosa                 3.43
2 versicolor             2.77
3 virginica              2.97
```

# How to Split a Dataset in Python and R?

## Explanation

Splitting a dataset into multiple parts is useful when you want to work with subsets of data. In this case, we will split the iris dataset into two parts:
x
- **iris_part1.csv**: Contains columns sepal_length, sepal_width, and species.
- **iris_part2.csv**: Contains columns petal_length, petal_width, and species.

These parts will later be merged based on the **species** column.

## Python Code



```python
import pandas as pd

# Load the iris dataset
df = pd.read_csv("data/iris.csv")

# Split into two parts
part1 = df[['sepal_length', 'sepal_width', 'species']]
part2 = df[['petal_length', 'petal_width', 'species']]

# Save the parts as separate CSV files
part1.to_csv("data/iris_part1.csv", index=False)
part2.to_csv("data/iris_part2.csv", index=False)

# Display a message to confirm
print("Parts saved as iris_part1.csv and iris_part2.csv")
```

    Parts saved as iris_part1.csv and iris_part2.csv


## R Code


``` r
# Load necessary libraries
library(readr)

# Load the iris dataset
df <- read_csv("data/iris.csv")

# Split into two parts
part1 <- df[, c("sepal_length", "sepal_width", "species")]
part2 <- df[, c("petal_length", "petal_width", "species")]

# Save the parts as separate CSV files
write_csv(part1, "data/iris_part1.csv")
write_csv(part2, "data/iris_part2.csv")

# Display a message to confirm
cat("Parts saved as iris_part1.csv and iris_part2.csv\n")
```

```
Parts saved as iris_part1.csv and iris_part2.csv
```


Now that we have created the two parts, we can proceed to merge them using the steps outlined previously.

# How to Merge Datasets in Python and R?

## Explanation

Merging datasets is a common task when working with multiple data sources. In the iris dataset, we may want to combine different subsets of data based on a common column, such as the species.

In this example, we assume there are two datasets:

- iris_part1.csv (contains sepal_length, sepal_width, and species)
- iris_part2.csv (contains petal_length, petal_width, and species)

We will merge them on the species column.

## Python Code


```python
import pandas as pd

# Load the two parts of the iris dataset (with renamed columns)
part1 = pd.read_csv("data/iris_part1.csv")
part2 = pd.read_csv("data/iris_part2.csv")

# Merge the datasets based on the 'species' column
merged_df = pd.merge(part1, part2, on='species')

# Save the merged dataset as a new CSV file
merged_df.to_csv("data/iris_merged.csv", index=False)

# Display the first few rows of the merged dataset
print(merged_df.head())
```

       sepal_length  sepal_width species  petal_length  petal_width
    0           5.1          3.5  setosa           1.4          0.2
    1           5.1          3.5  setosa           1.4          0.2
    2           5.1          3.5  setosa           1.3          0.2
    3           5.1          3.5  setosa           1.5          0.2
    4           5.1          3.5  setosa           1.4          0.2


## R Code


``` r
# Load necessary library
library(readr)

# Load the two parts of the iris dataset (with renamed columns)
part1 <- read_csv("data/iris_part1.csv")
part2 <- read_csv("data/iris_part2.csv")

# Merge the datasets based on the 'species' column
merged_df <- merge(part1, part2, by = "species")

# Save the merged dataset as a new CSV file
write_csv(merged_df, "data/iris_merged.csv")

# Display the first few rows of the merged dataset
head(merged_df)
```

```
  species sepal_length sepal_width petal_length petal_width
1  setosa          5.1         3.5          1.4         0.2
2  setosa          5.1         3.5          1.4         0.2
3  setosa          5.1         3.5          1.3         0.2
4  setosa          5.1         3.5          1.5         0.2
5  setosa          5.1         3.5          1.4         0.2
6  setosa          5.1         3.5          1.7         0.4
```

