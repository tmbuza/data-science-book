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


    
![](data-visualization_files/data-visualization_2_0.png)
    


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

<img src="data-visualization_files/figure-html/unnamed-chunk-1-1.png" width="672" />

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


    
![](data-visualization_files/data-visualization_5_0.png)
    


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

<img src="data-visualization_files/figure-html/unnamed-chunk-2-1.png" width="672" />

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


    
![](data-visualization_files/data-visualization_8_0.png)
    


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

<img src="data-visualization_files/figure-html/unnamed-chunk-3-1.png" width="672" />

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


    
![](data-visualization_files/data-visualization_11_0.png)
    


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

<img src="data-visualization_files/figure-html/unnamed-chunk-4-1.png" width="672" />

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


    
![](data-visualization_files/data-visualization_14_0.png)
    


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

<img src="data-visualization_files/figure-html/unnamed-chunk-5-1.png" width="672" />

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


    
![](data-visualization_files/data-visualization_17_0.png)
    


## R Code


``` r
# Load the necessary libraries
library(ggplot2)
library(RColorBrewer)

# Load the dataset
df <- read.csv('data/iris.csv')

# Ensure the numeric columns are selected
df_numeric <- df[, sapply(df, is.numeric)]

# Create a correlation matrix for the numeric data
corr <- cor(df_numeric)

# Define the color palette
colors <- brewer.pal(9, "YlGnBu")

# Create a heatmap with a specified range
heatmap(corr, 
        main="Heatmap of Iris Dataset Correlations", 
        col=colors, 
        scale="none", 
        cexCol=0.75, 
        cexRow=0.75, 
        breaks=seq(-1, 1, length.out=100))
```

# How to Create a Pair Plot in Python and R?

## Explanation

A pair plot is used to visualize pairwise relationships between multiple variables. It’s particularly useful for understanding the correlations between multiple continuous variables.

## Python Code


```python
# Import libraries
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the dataset
df = pd.read_csv('data/iris.csv')

# Create a pair plot
sns.pairplot(df, hue="species")
plt.title("Pair Plot of Iris Dataset")
plt.show()
```

    /Users/tmbmacbookair/anaconda3/lib/python3.11/site-packages/seaborn/axisgrid.py:118: UserWarning: The figure layout has changed to tight
      self._figure.tight_layout(*args, **kwargs)



    
![](data-visualization_files/data-visualization_20_1.png)
    


## R Code



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


    
![](data-visualization_files/data-visualization_23_0.png)
    


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

<img src="data-visualization_files/figure-html/unnamed-chunk-8-1.png" width="672" />
