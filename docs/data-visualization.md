# (PART) DATA VISUALIZATION {-}

# How to Create a Bar Plot in Python and R?

## Explanation

A bar plot is used to visualize categorical data with rectangular bars representing the frequency or value of categories.




## Python Code


```python
# Import libraries
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset
df = pd.read_csv('data/iris.csv')

# Create a bar plot
sns.countplot(x="species", data=df)
plt.title("Bar Plot of Species")
plt.xlabel("Species")
plt.ylabel("Count")
plt.show()
```


    
![](data-visualization_files/data-visualization_1_0.png)
    


## R Code


``` r
# Load the necessary libraries
library(ggplot2)

# Load the dataset
df <- read.csv('data/iris.csv')

# Create a bar plot with fill color based on species
ggplot(df, aes(x=species, fill=species)) + 
  geom_bar() + 
  theme_minimal() + 
  ggtitle("Bar Plot of Species") +
  xlab("Species") +
  ylab("Count")
```

<img src="data-visualization_files/figure-html/unnamed-chunk-2-1.png" width="672" />

# How to Create a Histogram in Python and R?

## Explanation

A histogram displays the distribution of a continuous variable by dividing the data into bins or intervals. The height of each bar represents the frequency of values within that bin.

## Python Code


```python
# Import libraries
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset
df = pd.read_csv('data/iris.csv')

# Create a histogram
sns.histplot(df['sepal_length'], kde=True, bins=10)
plt.title("Histogram of Sepal Length")
plt.xlabel("Sepal Length")
plt.ylabel("Frequency")
plt.show()
```


    
![](data-visualization_files/data-visualization_4_0.png)
    


## R Code


``` r
# Load the necessary libraries
library(ggplot2)

# Load the dataset
df <- read.csv('data/iris.csv')

# Create a histogram
ggplot(df, aes(x=sepal_length)) +
  geom_histogram(bins=10, fill="skyblue", color="black") +
  theme_minimal() +
  ggtitle("Histogram of Sepal Length") +
  xlab("Sepal Length") +
  ylab("Frequency")
```

<img src="data-visualization_files/figure-html/unnamed-chunk-3-1.png" width="672" />

# How to Create a Scatter Plot in Python and R?

## Explanation

A scatter plot is used to show the relationship between two continuous variables. Each point represents an observation in the dataset.

## Python Code


```python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset
df = pd.read_csv('data/iris.csv')
df['species'] = df['species'].astype('category')  # Ensure categorical variable

# Set a better background
sns.set_style("whitegrid")

# Create a scatter plot with improved coloring
ax = sns.scatterplot(x='sepal_length', y='sepal_width', hue='species', data=df, palette='Set1')

# Ensure legend is displayed
plt.legend(title="Species")

# Add labels and title
plt.title("Scatter Plot of Sepal Length vs Sepal Width by Species")
plt.xlabel("Sepal Length")
plt.ylabel("Sepal Width")

# Show the plot
plt.show()
```


    
![](data-visualization_files/data-visualization_7_0.png)
    


## R Code


``` r
# Load the necessary libraries
library(ggplot2)

# Load the dataset
df <- read.csv('data/iris.csv')

# Create a scatter plot colored by species
ggplot(df, aes(x=sepal_length, y=sepal_width, color=species)) +
  geom_point() +
  theme_minimal() +
  ggtitle("Scatter Plot of Sepal Length vs Sepal Width by Species") +
  xlab("Sepal Length") +
  ylab("Sepal Width")
```

<img src="data-visualization_files/figure-html/unnamed-chunk-4-1.png" width="672" />

# How to Create a Line Plot in Python and R?

## Explanation

A line plot is used to display the relationship between two continuous variables, where data points are connected by lines to show trends over time or other continuous variables.

## Python Code


```python
# Import libraries
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset
df = pd.read_csv('data/iris.csv')

# Create a line plot
sns.lineplot(x='sepal_length', y='sepal_width', data=df)
plt.title("Line Plot of Sepal Length vs Sepal Width")
plt.xlabel("Sepal Length")
plt.ylabel("Sepal Width")
plt.show()
```


    
![](data-visualization_files/data-visualization_10_0.png)
    


## R Code


``` r
# Load the necessary libraries
library(ggplot2)

# Load the dataset
df <- read.csv('data/iris.csv')

# Create a line plot with a specific color
ggplot(df, aes(x=sepal_length, y=sepal_width)) +
  geom_line(color="steelblue") +  # Set the line color to steelblue
  theme_minimal() +
  ggtitle("Line Plot of Sepal Length vs Sepal Width") +
  xlab("Sepal Length") +
  ylab("Sepal Width")
```

<img src="data-visualization_files/figure-html/unnamed-chunk-5-1.png" width="672" />

# How to Create a Box Plot in Python and R?

## Explanation

A box plot (or box-and-whisker plot) is used to display the distribution of a continuous variable, highlighting the median, quartiles, and potential outliers.

## Python Code


```python
# Import libraries
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset
df = pd.read_csv('data/iris.csv')

# Create a box plot
sns.boxplot(x='species', y='sepal_length', data=df)
plt.title("Box Plot of Sepal Length by Species")
plt.xlabel("Species")
plt.ylabel("Sepal Length")
plt.show()
```


    
![](data-visualization_files/data-visualization_13_0.png)
    


## R Code


``` r
# Load the necessary libraries
library(ggplot2)

# Load the dataset
df <- read.csv('data/iris.csv')

# Create a box plot
ggplot(df, aes(x=species, y=sepal_length, fill=species)) +
  geom_boxplot() +
  theme_minimal() +
  ggtitle("Box Plot of Sepal Length by Species") +
  xlab("Species") +
  ylab("Sepal Length")
```

<img src="data-visualization_files/figure-html/unnamed-chunk-6-1.png" width="672" />

# How to Create a Heatmap in Python and R?

## Explanation

A heatmap is used to display data in matrix form, where individual values are represented by colors. It’s often used to visualize correlation matrices or other tabular data.

## Python Code


```python
# Import libraries
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset
df = pd.read_csv('data/iris.csv')

# Select only numeric columns for correlation
numeric_df = df.select_dtypes(include=['float64', 'int64'])

# Create a correlation matrix
corr = numeric_df.corr()

# Create a heatmap with a specified range for color scale
sns.heatmap(corr, annot=True, cmap="coolwarm", vmin=-1, vmax=1)
plt.title("Heatmap of Iris Dataset Correlations")
plt.show()
```


    
![](data-visualization_files/data-visualization_16_0.png)
    


## R Code


``` r
# Import libraries
library(readr)    # For reading CSV
library(corrplot) # For correlation matrix visualization
library(dplyr)    # For data manipulation

# Load the dataset
df <- read_csv("data/iris.csv")

# Select only numeric columns for correlation
numeric_df <- df %>% select(where(is.numeric))

# Create a correlation matrix
corr <- cor(numeric_df)

# Create a heatmap using corrplot with adjusted x-axis label position
corrplot(corr, method = "color", 
         col = colorRampPalette(c("blue", "white", "red"))(200), 
         addCoef.col = "black", 
         number.cex = 0.7, 
         title = "Heatmap of Iris Dataset Correlations",
         mar = c(0, 0, 2, 0),   # Adjust margin size to create space for the title
         las = 1)               # Rotate x-axis labels for better spacing
```

<img src="data-visualization_files/figure-html/unnamed-chunk-7-1.png" width="672" />

# How to Create a Pair Plot in Python and R?

## Explanation

A pair plot is used to visualize pairwise relationships between multiple variables. It’s particularly useful for understanding the correlations between multiple continuous variables.

## Python Code


```python
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt
import warnings  # Suppress warnings

# Hide warnings
warnings.filterwarnings("ignore")

# Load dataset from CSV
df = pd.read_csv("data/iris.csv")

# Exclude the target column and plot pairplot
sns.pairplot(df, hue="species")

# Adjust layout to prevent overlapping
plt.tight_layout()

# Show the plot
plt.show()
```


    
![](data-visualization_files/data-visualization_19_0.png)
    


## R Code


``` r
# Ensure required packages are installed and loaded
if (!require(GGally)) install.packages("GGally", repos = "https://cloud.r-project.org/", dependencies = TRUE)
if (!require(ggplot2)) install.packages("ggplot2", repos = "https://cloud.r-project.org/", dependencies = TRUE)
if (!require(readr)) install.packages("readr", repos = "https://cloud.r-project.org/", dependencies = TRUE)

library(GGally)
library(ggplot2)
library(readr)

# Load dataset from CSV
df <- read_csv("data/iris.csv")

# Plot pairplot excluding the target column but using it as hue
ggpairs(df, aes(color = species)) + theme_minimal()
```

<img src="data-visualization_files/figure-html/unnamed-chunk-8-1.png" width="1152" />

# How to Create a Violin Plot in Python and R?

## Explanation

A violin plot combines aspects of a box plot and a kernel density plot. It provides a detailed view of the distribution of a continuous variable for different categories.

## Python Code


```python
# Import libraries
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset
df = pd.read_csv('data/iris.csv')

# Create a violin plot
sns.violinplot(x='species', y='sepal_length', data=df)
plt.title("Violin Plot of Sepal Length by Species")
plt.xlabel("Species")
plt.ylabel("Sepal Length")
plt.show()
```


    
![](data-visualization_files/data-visualization_22_0.png)
    


## R Code


``` r
# Load the necessary libraries
library(ggplot2)

# Load the dataset
df <- read.csv('data/iris.csv')

# Create a violin plot with grouping by color
ggplot(df, aes(x=species, y=sepal_length, fill=species)) +
  geom_violin() +
  theme_minimal() +
  ggtitle("Violin Plot of Sepal Length by Species") +
  xlab("Species") +
  ylab("Sepal Length")
```

<img src="data-visualization_files/figure-html/unnamed-chunk-9-1.png" width="672" />
