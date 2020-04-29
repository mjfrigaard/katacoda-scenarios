# Two levels of data wrangling 

We like to think of wrangling on two different levels. The first level deals with the data shape and structure. The second level of data wrangling refers to the format of individual variables (which we will get to in the following steps). 

Questions we should be asking ourselves about data at this level include:

1. Approximately how many rows (or observations) and columns (or variables) should we be seeing?  
2. Are all the rows unique (i.e.will each case have a row)?    
3. Does each measurement have a column (or variable)?   
4. Are these variables each measuring exactly one thing?   
3. Should we expect missing or incomplete data, and if so, why/how are they missing?   

## Reshaping data

A common task for data manipulation is moving columns to rows, or rows to columns. The `tidyr` package in R makes this easy with two `tidyr::pivot_` functions. We'll load the `BobRoss` dataset into R using `fivethirtyeight::bob_ross`. 

First, we have to install and load the package into the R environment.

```
install.packages("fivethirtyeight")
library(fivethirtyeight)
```{{execute}}

Now we can assign the `bob_ross` data frame into the `BobRoss` object. 

```
BobRoss <- fivethirtyeight::bob_ross
```{{execute}}

### Viewing the dataset

We can view the `BobRoss` dataset using `dplyr`'s `glimpse()` function, which shows the data in a transposed view (`glimpse()` displays the variables horizontally, and prints as much data as possible to the screen.

```
glimpse(BobRoss)
```{{copy}}


`glimpse()` is a convenient function for examining the structure and shape of a dataset. Other options include `utils::str()` and `utils::head()`. 

We can now answer two of the questions above: 

1. Approximately how many rows (or observations) and columns (or variables) should we be seeing? 403 rows, 71 columns
3. Does each measurement have a column (or variable)? *do they?*
